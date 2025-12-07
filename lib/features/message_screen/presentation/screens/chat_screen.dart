import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nephroscan/base/app_common_widget/custom_top_nav_bar/custom_top_nav_bar.dart';
import 'package:nephroscan/base/utils/strings.dart';

import '../widgets/chat_widgets.dart';

@RoutePage()
class ChatPage extends StatefulWidget {
  final String id;
  final String name;
  const ChatPage({super.key, required this.id, required this.name});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String? roomId;
  final msgCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    return Scaffold(
      appBar: CustomTopNavBar(title: widget.name),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: StreamBuilder(
              stream: firestore
                  .collection(AppStrings.messageCollection)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.docs.isNotEmpty) {
                    List<QueryDocumentSnapshot?> allData = snapshot.data!.docs
                        .where(
                          (element) =>
                              element['users'].contains(widget.id) &&
                              element['users'].contains(
                                FirebaseAuth.instance.currentUser!.uid,
                              ),
                        )
                        .toList();
                    QueryDocumentSnapshot? data = allData.isNotEmpty
                        ? allData.first
                        : null;
                    if (data != null) {
                      roomId = data.id;
                    }
                    return data == null
                        ? Container()
                        : StreamBuilder(
                            stream: data.reference
                                .collection('messages')
                                .orderBy('datetime', descending: true)
                                .snapshots(),
                            builder:
                                (context, AsyncSnapshot<QuerySnapshot> snap) {
                                  return !snap.hasData
                                      ? Container()
                                      : ListView.builder(
                                          itemCount: snap.data!.docs.length,
                                          reverse: true,
                                          itemBuilder: (context, i) {
                                            return ChatWidgets.messagesCard(
                                              snap.data!.docs[i]['sent_by'] ==
                                                  FirebaseAuth
                                                      .instance
                                                      .currentUser!
                                                      .uid,
                                              snap.data!.docs[i]['message'],
                                              DateFormat('hh:mm a').format(
                                                snap.data!.docs[i]['datetime']
                                                    .toDate(),
                                              ),
                                            );
                                          },
                                        );
                                },
                          );
                  } else {
                    return const Center(child: Text('No conversion found'));
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.indigo),
                  );
                }
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.indigo),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: msgCtr,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter Message',
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    if (msgCtr.text.toString() != '') {
                      if (roomId != null) {
                        Map<String, dynamic> data = {
                          'message': msgCtr.text.trim(),
                          'sent_by': FirebaseAuth.instance.currentUser!.uid,
                          'datetime': DateTime.now(),
                        };
                        firestore
                            .collection(AppStrings.messageCollection)
                            .doc(roomId)
                            .update({
                              'last_message_time': DateTime.now(),
                              'last_message': msgCtr.text,
                            });
                        firestore
                            .collection(AppStrings.messageCollection)
                            .doc(roomId)
                            .collection('messages')
                            .add(data);
                      } else {
                        Map<String, dynamic> data = {
                          'message': msgCtr.text.trim(),
                          'sent_by': FirebaseAuth.instance.currentUser!.uid,
                          'datetime': DateTime.now(),
                        };
                        firestore
                            .collection(AppStrings.messageCollection)
                            .add({
                              'users': [
                                widget.id,
                                FirebaseAuth.instance.currentUser!.uid,
                              ],
                              'last_message': msgCtr.text,
                              'last_message_time': DateTime.now(),
                            })
                            .then((value) async {
                              value.collection('messages').add(data);
                            });
                      }
                    }
                    msgCtr.clear();
                  },
                  icon: const Icon(Icons.send),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
