// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_id_obj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentIdObj _$$_CommentIdObjFromJson(Map<String, dynamic> json) =>
    _$_CommentIdObj(
      id: json['_id'] as String?,
      message: json['message'] as String?,
      messageType: json['messageType'] as int?,
      isDeleted: json['isDeleted'] as int?,
      senderId: json['senderId'] == null
          ? null
          : SenderIdObj.fromJson(json['senderId'] as Map<String, dynamic>),
      receiverId: json['receiverId'] as String?,
    );

Map<String, dynamic> _$$_CommentIdObjToJson(_$_CommentIdObj instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'message': instance.message,
      'messageType': instance.messageType,
      'isDeleted': instance.isDeleted,
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
    };
