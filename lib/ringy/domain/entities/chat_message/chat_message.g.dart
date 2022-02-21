// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatModel _$$_ChatModelFromJson(Map<String, dynamic> json) => _$_ChatModel(
      id: json['_id'] as String?,
      message: json['message'] as String?,
      messageType: json['messageType'] as int?,
      chatType: json['chatType'] as int?,
      bookmarked: json['bookmarked'] as int?,
      status: json['status'] as int?,
      isSeen: json['isSeen'] as int?,
      isDeleted: json['isDeleted'] as int?,
      isGroup: json['isGroup'] as int?,
      groupId: json['groupId'] as String?,
      receiptStatus: json['receiptStatus'] as int?,
      isSeenCount: json['isSeenCount'] as int?,
      hide: json['hide'] as int?,
      projectId: json['projectId'] as String?,
      senderUserId: json['senderUserId'] as String?,
      receiverUserId: json['receiverUserId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      fileSize: json['fileSize'] as String?,
      commentId: json['commentId'] == null
          ? null
          : CommentIdObj.fromJson(json['commentId'] as Map<String, dynamic>),
      senderId: json['senderId'] == null
          ? null
          : SenderIdObj.fromJson(json['senderId'] as Map<String, dynamic>),
      receiverId: json['receiverId'] == null
          ? null
          : ReceiverIdObj.fromJson(json['receiverId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChatModelToJson(_$_ChatModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'message': instance.message,
      'messageType': instance.messageType,
      'chatType': instance.chatType,
      'bookmarked': instance.bookmarked,
      'status': instance.status,
      'isSeen': instance.isSeen,
      'isDeleted': instance.isDeleted,
      'isGroup': instance.isGroup,
      'groupId': instance.groupId,
      'receiptStatus': instance.receiptStatus,
      'isSeenCount': instance.isSeenCount,
      'hide': instance.hide,
      'projectId': instance.projectId,
      'senderUserId': instance.senderUserId,
      'receiverUserId': instance.receiverUserId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'fileSize': instance.fileSize,
      'commentId': instance.commentId,
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
    };
