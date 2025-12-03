class MessageEntity {
  final String? id;
  final String? conversationId;
  final String? senderId;
  final String? receiverId;
  final String? text;
  final DateTime? timestamp;

  MessageEntity({
    this.id,
    this.conversationId,
    this.senderId,
    this.receiverId,
    this.text,
    this.timestamp,
  });
}
