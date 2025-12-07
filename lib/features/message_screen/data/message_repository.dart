import 'package:cloud_firestore/cloud_firestore.dart';

class MessageRepository {
  final FirebaseFirestore _firestore;

  MessageRepository([FirebaseFirestore? firestore])
    : _firestore = firestore ?? FirebaseFirestore.instance;

  String _roomIdFor(String a, String b) {
    final ids = [a, b]..sort();
    return ids.join('_');
  }

  Future<String> createOrGetRoom({
    required String senderId,
    required String receiverId,
  }) async {
    final roomId = _roomIdFor(senderId, receiverId);
    final roomRef = _firestore.collection('rooms').doc(roomId);

    final snapshot = await roomRef.get();
    if (!snapshot.exists) {
      await roomRef.set({
        'users': [senderId, receiverId],
        'createdAt': FieldValue.serverTimestamp(),
        'lastMessage': null,
        'lastUpdated': FieldValue.serverTimestamp(),
      });
    }

    return roomId;
  }

  Future<void> sendMessage({
    required String senderId,
    required String receiverId,
    required String text,
    Map<String, dynamic>? meta,
  }) async {
    if (text.trim().isEmpty) return;

    final roomId = await createOrGetRoom(
      senderId: senderId,
      receiverId: receiverId,
    );

    final messageRef = _firestore.collection('messages').doc();
    final messageData = {
      'id': messageRef.id,
      'roomId': roomId,
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'createdAt': FieldValue.serverTimestamp(),
      'status': 'sent',
      'meta': meta ?? {},
    };

    // Write message and update room last message atomically using a batch.
    final batch = _firestore.batch();
    batch.set(messageRef, messageData);
    final roomRef = _firestore.collection('rooms').doc(roomId);
    batch.update(roomRef, {
      'lastMessage': text,
      'lastUpdated': FieldValue.serverTimestamp(),
    });

    await batch.commit();
  }

  Stream<List<Map<String, dynamic>>> messagesStreamForRoom(String roomId) {
    return _firestore
        .collection('messages')
        .where('roomId', isEqualTo: roomId)
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map((snap) => snap.docs.map((d) => d.data()).toList());
  }

  Stream<List<Map<String, dynamic>>> roomsForUserStream(String userId) {
    return _firestore
        .collection('rooms')
        .where('users', arrayContains: userId)
        .orderBy('lastUpdated', descending: true)
        .snapshots()
        .map((snap) => snap.docs.map((d) => d.data()).toList());
  }
}
