// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'receiver_id_obj.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReceiverIdObj _$ReceiverIdObjFromJson(Map<String, dynamic> json) {
  return _ReceiverIdObj.fromJson(json);
}

/// @nodoc
class _$ReceiverIdObjTearOff {
  const _$ReceiverIdObjTearOff();

  _ReceiverIdObj call({String? id, String? user_name, String? p_image}) {
    return _ReceiverIdObj(
      id: id,
      user_name: user_name,
      p_image: p_image,
    );
  }

  ReceiverIdObj fromJson(Map<String, Object?> json) {
    return ReceiverIdObj.fromJson(json);
  }
}

/// @nodoc
const $ReceiverIdObj = _$ReceiverIdObjTearOff();

/// @nodoc
mixin _$ReceiverIdObj {
  String? get id => throw _privateConstructorUsedError;
  String? get user_name => throw _privateConstructorUsedError;
  String? get p_image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceiverIdObjCopyWith<ReceiverIdObj> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiverIdObjCopyWith<$Res> {
  factory $ReceiverIdObjCopyWith(
          ReceiverIdObj value, $Res Function(ReceiverIdObj) then) =
      _$ReceiverIdObjCopyWithImpl<$Res>;
  $Res call({String? id, String? user_name, String? p_image});
}

/// @nodoc
class _$ReceiverIdObjCopyWithImpl<$Res>
    implements $ReceiverIdObjCopyWith<$Res> {
  _$ReceiverIdObjCopyWithImpl(this._value, this._then);

  final ReceiverIdObj _value;
  // ignore: unused_field
  final $Res Function(ReceiverIdObj) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? user_name = freezed,
    Object? p_image = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user_name: user_name == freezed
          ? _value.user_name
          : user_name // ignore: cast_nullable_to_non_nullable
              as String?,
      p_image: p_image == freezed
          ? _value.p_image
          : p_image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ReceiverIdObjCopyWith<$Res>
    implements $ReceiverIdObjCopyWith<$Res> {
  factory _$ReceiverIdObjCopyWith(
          _ReceiverIdObj value, $Res Function(_ReceiverIdObj) then) =
      __$ReceiverIdObjCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String? user_name, String? p_image});
}

/// @nodoc
class __$ReceiverIdObjCopyWithImpl<$Res>
    extends _$ReceiverIdObjCopyWithImpl<$Res>
    implements _$ReceiverIdObjCopyWith<$Res> {
  __$ReceiverIdObjCopyWithImpl(
      _ReceiverIdObj _value, $Res Function(_ReceiverIdObj) _then)
      : super(_value, (v) => _then(v as _ReceiverIdObj));

  @override
  _ReceiverIdObj get _value => super._value as _ReceiverIdObj;

  @override
  $Res call({
    Object? id = freezed,
    Object? user_name = freezed,
    Object? p_image = freezed,
  }) {
    return _then(_ReceiverIdObj(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user_name: user_name == freezed
          ? _value.user_name
          : user_name // ignore: cast_nullable_to_non_nullable
              as String?,
      p_image: p_image == freezed
          ? _value.p_image
          : p_image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReceiverIdObj implements _ReceiverIdObj {
  _$_ReceiverIdObj({this.id, this.user_name, this.p_image});

  factory _$_ReceiverIdObj.fromJson(Map<String, dynamic> json) =>
      _$$_ReceiverIdObjFromJson(json);

  @override
  final String? id;
  @override
  final String? user_name;
  @override
  final String? p_image;

  @override
  String toString() {
    return 'ReceiverIdObj(_id: $id, user_name: $user_name, p_image: $p_image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReceiverIdObj &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user_name, user_name) ||
                other.user_name == user_name) &&
            (identical(other.p_image, p_image) || other.p_image == p_image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, user_name, p_image);

  @JsonKey(ignore: true)
  @override
  _$ReceiverIdObjCopyWith<_ReceiverIdObj> get copyWith =>
      __$ReceiverIdObjCopyWithImpl<_ReceiverIdObj>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReceiverIdObjToJson(this);
  }
}

abstract class _ReceiverIdObj implements ReceiverIdObj {
  factory _ReceiverIdObj({String? id, String? user_name, String? p_image}) =
      _$_ReceiverIdObj;

  factory _ReceiverIdObj.fromJson(Map<String, dynamic> json) =
      _$_ReceiverIdObj.fromJson;

  @override
  String? get id;
  @override
  String? get user_name;
  @override
  String? get p_image;
  @override
  @JsonKey(ignore: true)
  _$ReceiverIdObjCopyWith<_ReceiverIdObj> get copyWith =>
      throw _privateConstructorUsedError;
}
