// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment_id_obj.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentIdObj _$CommentIdObjFromJson(Map<String, dynamic> json) {
  return _CommentIdObj.fromJson(json);
}

/// @nodoc
class _$CommentIdObjTearOff {
  const _$CommentIdObjTearOff();

  _CommentIdObj call(
      {String? id,
      String? message,
      int? messageType,
      int? isDeleted,
      SenderIdObj? senderId,
      String? receiverId}) {
    return _CommentIdObj(
      id: id,
      message: message,
      messageType: messageType,
      isDeleted: isDeleted,
      senderId: senderId,
      receiverId: receiverId,
    );
  }

  CommentIdObj fromJson(Map<String, Object?> json) {
    return CommentIdObj.fromJson(json);
  }
}

/// @nodoc
const $CommentIdObj = _$CommentIdObjTearOff();

/// @nodoc
mixin _$CommentIdObj {
  String? get id => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get messageType => throw _privateConstructorUsedError;
  int? get isDeleted => throw _privateConstructorUsedError;
  SenderIdObj? get senderId => throw _privateConstructorUsedError;
  String? get receiverId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentIdObjCopyWith<CommentIdObj> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentIdObjCopyWith<$Res> {
  factory $CommentIdObjCopyWith(
          CommentIdObj value, $Res Function(CommentIdObj) then) =
      _$CommentIdObjCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? message,
      int? messageType,
      int? isDeleted,
      SenderIdObj? senderId,
      String? receiverId});

  $SenderIdObjCopyWith<$Res>? get senderId;
}

/// @nodoc
class _$CommentIdObjCopyWithImpl<$Res> implements $CommentIdObjCopyWith<$Res> {
  _$CommentIdObjCopyWithImpl(this._value, this._then);

  final CommentIdObj _value;
  // ignore: unused_field
  final $Res Function(CommentIdObj) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
    Object? messageType = freezed,
    Object? isDeleted = freezed,
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
      isDeleted: isDeleted == freezed
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as int?,
      senderId: senderId == freezed
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as SenderIdObj?,
      receiverId: receiverId == freezed
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
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
}

/// @nodoc
abstract class _$CommentIdObjCopyWith<$Res>
    implements $CommentIdObjCopyWith<$Res> {
  factory _$CommentIdObjCopyWith(
          _CommentIdObj value, $Res Function(_CommentIdObj) then) =
      __$CommentIdObjCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? message,
      int? messageType,
      int? isDeleted,
      SenderIdObj? senderId,
      String? receiverId});

  @override
  $SenderIdObjCopyWith<$Res>? get senderId;
}

/// @nodoc
class __$CommentIdObjCopyWithImpl<$Res> extends _$CommentIdObjCopyWithImpl<$Res>
    implements _$CommentIdObjCopyWith<$Res> {
  __$CommentIdObjCopyWithImpl(
      _CommentIdObj _value, $Res Function(_CommentIdObj) _then)
      : super(_value, (v) => _then(v as _CommentIdObj));

  @override
  _CommentIdObj get _value => super._value as _CommentIdObj;

  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
    Object? messageType = freezed,
    Object? isDeleted = freezed,
    Object? senderId = freezed,
    Object? receiverId = freezed,
  }) {
    return _then(_CommentIdObj(
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
      isDeleted: isDeleted == freezed
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as int?,
      senderId: senderId == freezed
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as SenderIdObj?,
      receiverId: receiverId == freezed
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommentIdObj implements _CommentIdObj {
  _$_CommentIdObj(
      {this.id,
      this.message,
      this.messageType,
      this.isDeleted,
      this.senderId,
      this.receiverId});

  factory _$_CommentIdObj.fromJson(Map<String, dynamic> json) =>
      _$$_CommentIdObjFromJson(json);

  @override
  final String? id;
  @override
  final String? message;
  @override
  final int? messageType;
  @override
  final int? isDeleted;
  @override
  final SenderIdObj? senderId;
  @override
  final String? receiverId;

  @override
  String toString() {
    return 'CommentIdObj(_id: $id, message: $message, messageType: $messageType, isDeleted: $isDeleted, senderId: $senderId, receiverId: $receiverId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommentIdObj &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, message, messageType, isDeleted, senderId, receiverId);

  @JsonKey(ignore: true)
  @override
  _$CommentIdObjCopyWith<_CommentIdObj> get copyWith =>
      __$CommentIdObjCopyWithImpl<_CommentIdObj>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentIdObjToJson(this);
  }
}

abstract class _CommentIdObj implements CommentIdObj {
  factory _CommentIdObj(
      {String? id,
      String? message,
      int? messageType,
      int? isDeleted,
      SenderIdObj? senderId,
      String? receiverId}) = _$_CommentIdObj;

  factory _CommentIdObj.fromJson(Map<String, dynamic> json) =
      _$_CommentIdObj.fromJson;

  @override
  String? get id;
  @override
  String? get message;
  @override
  int? get messageType;
  @override
  int? get isDeleted;
  @override
  SenderIdObj? get senderId;
  @override
  String? get receiverId;
  @override
  @JsonKey(ignore: true)
  _$CommentIdObjCopyWith<_CommentIdObj> get copyWith =>
      throw _privateConstructorUsedError;
}
