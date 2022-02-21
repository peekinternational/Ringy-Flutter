// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) {
  return _ChatModel.fromJson(json);
}

/// @nodoc
class _$ChatModelTearOff {
  const _$ChatModelTearOff();

  _ChatModel call(
      {String? id,
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
      ReceiverIdObj? receiverId}) {
    return _ChatModel(
      id: id,
      message: message,
      messageType: messageType,
      chatType: chatType,
      bookmarked: bookmarked,
      status: status,
      isSeen: isSeen,
      isDeleted: isDeleted,
      isGroup: isGroup,
      groupId: groupId,
      receiptStatus: receiptStatus,
      isSeenCount: isSeenCount,
      hide: hide,
      projectId: projectId,
      senderUserId: senderUserId,
      receiverUserId: receiverUserId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      fileSize: fileSize,
      commentId: commentId,
      senderId: senderId,
      receiverId: receiverId,
    );
  }

  ChatModel fromJson(Map<String, Object?> json) {
    return ChatModel.fromJson(json);
  }
}

/// @nodoc
const $ChatModel = _$ChatModelTearOff();

/// @nodoc
mixin _$ChatModel {
  String? get id => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get messageType => throw _privateConstructorUsedError;
  int? get chatType => throw _privateConstructorUsedError;
  int? get bookmarked => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  int? get isSeen => throw _privateConstructorUsedError;
  int? get isDeleted => throw _privateConstructorUsedError;
  int? get isGroup => throw _privateConstructorUsedError;
  String? get groupId => throw _privateConstructorUsedError;
  int? get receiptStatus => throw _privateConstructorUsedError;
  int? get isSeenCount => throw _privateConstructorUsedError;
  int? get hide => throw _privateConstructorUsedError;
  String? get projectId => throw _privateConstructorUsedError;
  String? get senderUserId => throw _privateConstructorUsedError;
  String? get receiverUserId => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get fileSize => throw _privateConstructorUsedError;
  CommentIdObj? get commentId => throw _privateConstructorUsedError;
  SenderIdObj? get senderId => throw _privateConstructorUsedError;
  ReceiverIdObj? get receiverId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatModelCopyWith<ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatModelCopyWith<$Res> {
  factory $ChatModelCopyWith(ChatModel value, $Res Function(ChatModel) then) =
      _$ChatModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
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
      ReceiverIdObj? receiverId});

  $CommentIdObjCopyWith<$Res>? get commentId;
  $SenderIdObjCopyWith<$Res>? get senderId;
  $ReceiverIdObjCopyWith<$Res>? get receiverId;
}

/// @nodoc
class _$ChatModelCopyWithImpl<$Res> implements $ChatModelCopyWith<$Res> {
  _$ChatModelCopyWithImpl(this._value, this._then);

  final ChatModel _value;
  // ignore: unused_field
  final $Res Function(ChatModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
    Object? messageType = freezed,
    Object? chatType = freezed,
    Object? bookmarked = freezed,
    Object? status = freezed,
    Object? isSeen = freezed,
    Object? isDeleted = freezed,
    Object? isGroup = freezed,
    Object? groupId = freezed,
    Object? receiptStatus = freezed,
    Object? isSeenCount = freezed,
    Object? hide = freezed,
    Object? projectId = freezed,
    Object? senderUserId = freezed,
    Object? receiverUserId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? fileSize = freezed,
    Object? commentId = freezed,
    Object? senderId = freezed,
    Object? receiverId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      messageType: messageType == freezed
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as int?,
      chatType: chatType == freezed
          ? _value.chatType
          : chatType // ignore: cast_nullable_to_non_nullable
              as int?,
      bookmarked: bookmarked == freezed
          ? _value.bookmarked
          : bookmarked // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      isSeen: isSeen == freezed
          ? _value.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as int?,
      isDeleted: isDeleted == freezed
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as int?,
      isGroup: isGroup == freezed
          ? _value.isGroup
          : isGroup // ignore: cast_nullable_to_non_nullable
              as int?,
      groupId: groupId == freezed
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptStatus: receiptStatus == freezed
          ? _value.receiptStatus
          : receiptStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      isSeenCount: isSeenCount == freezed
          ? _value.isSeenCount
          : isSeenCount // ignore: cast_nullable_to_non_nullable
              as int?,
      hide: hide == freezed
          ? _value.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      senderUserId: senderUserId == freezed
          ? _value.senderUserId
          : senderUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverUserId: receiverUserId == freezed
          ? _value.receiverUserId
          : receiverUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSize: fileSize == freezed
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as String?,
      commentId: commentId == freezed
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as CommentIdObj?,
      senderId: senderId == freezed
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as SenderIdObj?,
      receiverId: receiverId == freezed
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as ReceiverIdObj?,
    ));
  }

  @override
  $CommentIdObjCopyWith<$Res>? get commentId {
    if (_value.commentId == null) {
      return null;
    }

    return $CommentIdObjCopyWith<$Res>(_value.commentId!, (value) {
      return _then(_value.copyWith(commentId: value));
    });
  }

  @override
  $SenderIdObjCopyWith<$Res>? get senderId {
    if (_value.senderId == null) {
      return null;
    }

    return $SenderIdObjCopyWith<$Res>(_value.senderId!, (value) {
      return _then(_value.copyWith(senderId: value));
    });
  }

  @override
  $ReceiverIdObjCopyWith<$Res>? get receiverId {
    if (_value.receiverId == null) {
      return null;
    }

    return $ReceiverIdObjCopyWith<$Res>(_value.receiverId!, (value) {
      return _then(_value.copyWith(receiverId: value));
    });
  }
}

/// @nodoc
abstract class _$ChatModelCopyWith<$Res> implements $ChatModelCopyWith<$Res> {
  factory _$ChatModelCopyWith(
          _ChatModel value, $Res Function(_ChatModel) then) =
      __$ChatModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
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
      ReceiverIdObj? receiverId});

  @override
  $CommentIdObjCopyWith<$Res>? get commentId;
  @override
  $SenderIdObjCopyWith<$Res>? get senderId;
  @override
  $ReceiverIdObjCopyWith<$Res>? get receiverId;
}

/// @nodoc
class __$ChatModelCopyWithImpl<$Res> extends _$ChatModelCopyWithImpl<$Res>
    implements _$ChatModelCopyWith<$Res> {
  __$ChatModelCopyWithImpl(_ChatModel _value, $Res Function(_ChatModel) _then)
      : super(_value, (v) => _then(v as _ChatModel));

  @override
  _ChatModel get _value => super._value as _ChatModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
    Object? messageType = freezed,
    Object? chatType = freezed,
    Object? bookmarked = freezed,
    Object? status = freezed,
    Object? isSeen = freezed,
    Object? isDeleted = freezed,
    Object? isGroup = freezed,
    Object? groupId = freezed,
    Object? receiptStatus = freezed,
    Object? isSeenCount = freezed,
    Object? hide = freezed,
    Object? projectId = freezed,
    Object? senderUserId = freezed,
    Object? receiverUserId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? fileSize = freezed,
    Object? commentId = freezed,
    Object? senderId = freezed,
    Object? receiverId = freezed,
  }) {
    return _then(_ChatModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      messageType: messageType == freezed
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as int?,
      chatType: chatType == freezed
          ? _value.chatType
          : chatType // ignore: cast_nullable_to_non_nullable
              as int?,
      bookmarked: bookmarked == freezed
          ? _value.bookmarked
          : bookmarked // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      isSeen: isSeen == freezed
          ? _value.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as int?,
      isDeleted: isDeleted == freezed
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as int?,
      isGroup: isGroup == freezed
          ? _value.isGroup
          : isGroup // ignore: cast_nullable_to_non_nullable
              as int?,
      groupId: groupId == freezed
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptStatus: receiptStatus == freezed
          ? _value.receiptStatus
          : receiptStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      isSeenCount: isSeenCount == freezed
          ? _value.isSeenCount
          : isSeenCount // ignore: cast_nullable_to_non_nullable
              as int?,
      hide: hide == freezed
          ? _value.hide
          : hide // ignore: cast_nullable_to_non_nullable
              as int?,
      projectId: projectId == freezed
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      senderUserId: senderUserId == freezed
          ? _value.senderUserId
          : senderUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverUserId: receiverUserId == freezed
          ? _value.receiverUserId
          : receiverUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      fileSize: fileSize == freezed
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as String?,
      commentId: commentId == freezed
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as CommentIdObj?,
      senderId: senderId == freezed
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as SenderIdObj?,
      receiverId: receiverId == freezed
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as ReceiverIdObj?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatModel implements _ChatModel {
  _$_ChatModel(
      {this.id,
      this.message,
      this.messageType,
      this.chatType,
      this.bookmarked,
      this.status,
      this.isSeen,
      this.isDeleted,
      this.isGroup,
      this.groupId,
      this.receiptStatus,
      this.isSeenCount,
      this.hide,
      this.projectId,
      this.senderUserId,
      this.receiverUserId,
      this.createdAt,
      this.updatedAt,
      this.fileSize,
      this.commentId,
      this.senderId,
      this.receiverId});

  factory _$_ChatModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChatModelFromJson(json);

  @override
  final String? id;
  @override
  final String? message;
  @override
  final int? messageType;
  @override
  final int? chatType;
  @override
  final int? bookmarked;
  @override
  final int? status;
  @override
  final int? isSeen;
  @override
  final int? isDeleted;
  @override
  final int? isGroup;
  @override
  final String? groupId;
  @override
  final int? receiptStatus;
  @override
  final int? isSeenCount;
  @override
  final int? hide;
  @override
  final String? projectId;
  @override
  final String? senderUserId;
  @override
  final String? receiverUserId;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final String? fileSize;
  @override
  final CommentIdObj? commentId;
  @override
  final SenderIdObj? senderId;
  @override
  final ReceiverIdObj? receiverId;

  @override
  String toString() {
    return 'ChatModel(_id: $id, message: $message, messageType: $messageType, chatType: $chatType, bookmarked: $bookmarked, status: $status, isSeen: $isSeen, isDeleted: $isDeleted, isGroup: $isGroup, groupId: $groupId, receiptStatus: $receiptStatus, isSeenCount: $isSeenCount, hide: $hide, projectId: $projectId, senderUserId: $senderUserId, receiverUserId: $receiverUserId, createdAt: $createdAt, updatedAt: $updatedAt, fileSize: $fileSize, commentId: $commentId, senderId: $senderId, receiverId: $receiverId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.chatType, chatType) ||
                other.chatType == chatType) &&
            (identical(other.bookmarked, bookmarked) ||
                other.bookmarked == bookmarked) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isSeen, isSeen) || other.isSeen == isSeen) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.isGroup, isGroup) || other.isGroup == isGroup) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.receiptStatus, receiptStatus) ||
                other.receiptStatus == receiptStatus) &&
            (identical(other.isSeenCount, isSeenCount) ||
                other.isSeenCount == isSeenCount) &&
            (identical(other.hide, hide) || other.hide == hide) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.senderUserId, senderUserId) ||
                other.senderUserId == senderUserId) &&
            (identical(other.receiverUserId, receiverUserId) ||
                other.receiverUserId == receiverUserId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        message,
        messageType,
        chatType,
        bookmarked,
        status,
        isSeen,
        isDeleted,
        isGroup,
        groupId,
        receiptStatus,
        isSeenCount,
        hide,
        projectId,
        senderUserId,
        receiverUserId,
        createdAt,
        updatedAt,
        fileSize,
        commentId,
        senderId,
        receiverId
      ]);

  @JsonKey(ignore: true)
  @override
  _$ChatModelCopyWith<_ChatModel> get copyWith =>
      __$ChatModelCopyWithImpl<_ChatModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatModelToJson(this);
  }
}

abstract class _ChatModel implements ChatModel {
  factory _ChatModel(
      {String? id,
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
      ReceiverIdObj? receiverId}) = _$_ChatModel;

  factory _ChatModel.fromJson(Map<String, dynamic> json) =
      _$_ChatModel.fromJson;

  @override
  String? get id;
  @override
  String? get message;
  @override
  int? get messageType;
  @override
  int? get chatType;
  @override
  int? get bookmarked;
  @override
  int? get status;
  @override
  int? get isSeen;
  @override
  int? get isDeleted;
  @override
  int? get isGroup;
  @override
  String? get groupId;
  @override
  int? get receiptStatus;
  @override
  int? get isSeenCount;
  @override
  int? get hide;
  @override
  String? get projectId;
  @override
  String? get senderUserId;
  @override
  String? get receiverUserId;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  String? get fileSize;
  @override
  CommentIdObj? get commentId;
  @override
  SenderIdObj? get senderId;
  @override
  ReceiverIdObj? get receiverId;
  @override
  @JsonKey(ignore: true)
  _$ChatModelCopyWith<_ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}
