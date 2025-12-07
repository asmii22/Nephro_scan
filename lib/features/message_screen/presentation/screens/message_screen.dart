import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nephroscan/base/base.dart';
import 'package:nephroscan/features/message_screen/presentation/widgets/empty_conversation_widget.dart';
import 'package:nephroscan/features/sign_in_sign_up_screen/data/models/user_model/user_model.dart';
import 'package:nephroscan/routes/auto_router.gr.dart';

import 'chat_list.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  String _searchText = '';

  String? _searchValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter search text';
    }
    return null;
  }

  final List<Map<String, dynamic>> _conversations = [
    {
      'id': '1',
      'name': 'Dr. Sarah Johnson',
      'lastMessage': 'Your test results are ready. Please check your reports.',
      'time': '10:30 AM',
      'unreadCount': 2,
      'avatarUrl': '',
    },
    {
      'id': '2',
      'name': 'Dr. Michael Chen',
      'lastMessage': 'Thank you for the update. I\'ll review your case.',
      'time': 'Yesterday',
      'unreadCount': 0,
      'avatarUrl': '',
    },
    {
      'id': '3',
      'name': 'Dr. Emily Williams',
      'lastMessage': 'Please schedule a follow-up appointment next week.',
      'time': 'Yesterday',
      'unreadCount': 1,
      'avatarUrl': '',
    },
    {
      'id': '4',
      'name': 'Dr. Robert Martinez',
      'lastMessage': 'The prescription has been sent to your pharmacy.',
      'time': '2 days ago',
      'unreadCount': 0,
      'avatarUrl': '',
    },
    {
      'id': '5',
      'name': 'Dr. Sarah Johnson',
      'lastMessage': 'Your test results are ready. Please check your reports.',
      'time': '10:30 AM',
      'unreadCount': 2,
      'avatarUrl': '',
    },
    {
      'id': '6',
      'name': 'Dr. Michael Chen',
      'lastMessage': 'Thank you for the update. I\'ll review your case.',
      'time': 'Yesterday',
      'unreadCount': 0,
      'avatarUrl': '',
    },
    {
      'id': '7',
      'name': 'Dr. Emily Williams',
      'lastMessage': 'Please schedule a follow-up appointment next week.',
      'time': 'Yesterday',
      'unreadCount': 1,
      'avatarUrl': '',
    },
    {
      'id': '8',
      'name': 'Dr. Robert Martinez',
      'lastMessage': 'The prescription has been sent to your pharmacy.',
      'time': '2 days ago',
      'unreadCount': 0,
      'avatarUrl': '',
    },
    {
      'id': '9',
      'name': 'Dr. Sarah Johnson',
      'lastMessage': 'Your test results are ready. Please check your reports.',
      'time': '10:30 AM',
      'unreadCount': 2,
      'avatarUrl': '',
    },
    {
      'id': '21',
      'name': 'Dr. Michael Chen',
      'lastMessage': 'Thank you for the update. I\'ll review your case.',
      'time': 'Yesterday',
      'unreadCount': 0,
      'avatarUrl': '',
    },
    {
      'id': '32',
      'name': 'Dr. Emily Williams',
      'lastMessage': 'Please schedule a follow-up appointment next week.',
      'time': 'Yesterday',
      'unreadCount': 1,
      'avatarUrl': '',
    },
    {
      'id': '43',
      'name': 'Dr. Robert Martinez',
      'lastMessage': 'The prescription has been sent to your pharmacy.',
      'time': '2 days ago',
      'unreadCount': 0,
      'avatarUrl': '',
    },
  ];
  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomTopNavBar(
        title: 'Messages',
        leftWidget: SizedBox.shrink(),
        rightWidget: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Handle search
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 8.0,
              ),
              child: AppTextField.textField(
                context: context,
                name: 'search',
                hint: 'Search messages',
                prefixIcon: const Icon(Icons.search),
                autocorrect: false,
                validator: _searchValidator,
                onTextChanged: (value) {
                  setState(() {
                    _searchText = value ?? '';
                  });
                },
              ),
            ),
            if (_searchText.trim().isNotEmpty)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                padding: const EdgeInsets.all(10),
                height: 150,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).colorScheme.outline.withValues(alpha: 0.2),
                  ),
                ),
                child: StreamBuilder(
                  stream: firestore
                      .collection(AppStrings.usersCollection)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    // Parse documents into UserModel and filter by name/email (case-insensitive)
                    List<UserModel> users = [];
                    if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                      final lowerQuery = _searchText.toLowerCase();
                      users = snapshot.data!.docs
                          .map((doc) {
                            final raw = doc.data() as Map<String, dynamic>;
                            // Ensure id is present for the model
                            final mapped = <String, dynamic>{
                              ...raw,
                              'id': doc.id,
                            };
                            try {
                              return UserModel.fromJson(mapped);
                            } catch (e) {
                              // Fallback in case of parsing issues
                              return UserModel(
                                id: doc.id,
                                name: raw['name']?.toString(),
                                email: raw['email']?.toString(),
                                profilePicture: raw['profilePicture']
                                    ?.toString(),
                              );
                            }
                          })
                          .where((u) {
                            final name = u.name?.toLowerCase() ?? '';
                            final email = u.email?.toLowerCase() ?? '';
                            return name.contains(lowerQuery) ||
                                email.contains(lowerQuery);
                          })
                          .toList();
                    }

                    if (users.isEmpty) {
                      return const Center(child: Text('No users found'));
                    }

                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        return ListTile(
                          splashColor: AppColors.transparent,
                          title: Text(user.name ?? user.email ?? 'Unknown'),
                          subtitle: Text(user.email ?? ''),
                          onTap: () {
                            _formKey.currentState?.reset();
                            setState(() {
                              _searchText = '';
                            });
                            context.router.push(
                              ChatRoute(id: user.id, name: user.name ?? ''),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            const SizedBox(height: 8),
            Expanded(
              child: _conversations.isEmpty
                  ? const EmptyConversationWidget()
                  : ChatListWidget(firestore: firestore),
            ),
          ],
        ),
      ),
    );
  }
}
