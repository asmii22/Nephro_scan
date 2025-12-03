import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../base/utils/timestamp_converter.dart';
import '../../domain/entities/message_entity.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
abstract class MessageModel with _$MessageModel {
  const MessageModel._();

  const factory MessageModel({
    String? id,
    String? conversationId,
    String? senderId,
    String? receiverId,
    String? text,
    @TimestampConverter() DateTime? timestamp,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  MessageEntity toEntity() => MessageEntity(
    id: id,
    conversationId: conversationId,
    senderId: senderId,
    receiverId: receiverId,
    text: text,
    timestamp: timestamp,
  );

  factory MessageModel.fromEntity(MessageEntity entity) => MessageModel(
    id: entity.id,
    conversationId: entity.conversationId,
    senderId: entity.senderId,
    receiverId: entity.receiverId,
    text: entity.text,
    timestamp: entity.timestamp,
  );
}
