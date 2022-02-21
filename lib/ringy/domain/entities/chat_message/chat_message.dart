import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ringy_flutter/ringy/domain/entities/commentIdObj/comment_id_obj.dart';
import 'package:ringy_flutter/ringy/domain/entities/receiverIdObj/receiver_id_obj.dart';
import 'package:ringy_flutter/ringy/domain/entities/senderIdObj/sender_id_obj.dart';


part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

@freezed
class ChatModel with _$ChatModel {
  factory ChatModel(
      {
        String? id,
        String? message,
        int? messageType,
        int? chatType,
        int? bookmarked,
        int? status,
        int? isSeen,
        int? isDeleted,
        int? isGroup,
        String? groupId,
        int? receiptStatus,
        int? isSeenCount,
        int? hide,
        String? projectId,
        String? senderUserId,
        String? receiverUserId,
        String? createdAt,
        String? updatedAt,
        String? fileSize,
        CommentIdObj? commentId,
        SenderIdObj? senderId,
        ReceiverIdObj? receiverId,
      }) = _ChatModel;
  factory ChatModel.fromJson(Map<String, dynamic> json) => _$ChatModelFromJson(json);
}









