class MessageEntity {
  final String? senderId;
  final String? receiverId;
  final String? text;
  final DateTime? timestamp;

  MessageEntity({this.senderId, this.receiverId, this.text, this.timestamp});
}
