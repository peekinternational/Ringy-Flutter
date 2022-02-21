import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ringy_flutter/ringy/domain/entities/senderIdObj/sender_id_obj.dart';

part 'comment_id_obj.freezed.dart';
part 'comment_id_obj.g.dart';

@freezed
class CommentIdObj with _$CommentIdObj{
  factory CommentIdObj({
    String? id,
    String? message,
    int? messageType,
    int? isDeleted,
    SenderIdObj? senderId,
    String? receiverId,
  }) = _CommentIdObj;
  factory CommentIdObj.fromJson(Map<String, dynamic> json) => _$CommentIdObjFromJson(json);
}