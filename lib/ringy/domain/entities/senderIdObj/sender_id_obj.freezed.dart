// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sender_id_obj.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SenderIdObj _$SenderIdObjFromJson(Map<String, dynamic> json) {
  return _SenderIdObj.fromJson(json);
}

/// @nodoc
class _$SenderIdObjTearOff {
  const _$SenderIdObjTearOff();

  _SenderIdObj call(
      {String? id, String? user_name, String? p_image, String? ring_name}) {
    return _SenderIdObj(
      id: id,
      user_name: user_name,
      p_image: p_image,
      ring_name: ring_name,
    );
  }

  SenderIdObj fromJson(Map<String, Object?> json) {
    return SenderIdObj.fromJson(json);
  }
}

/// @nodoc
const $SenderIdObj = _$SenderIdObjTearOff();

/// @nodoc
mixin _$SenderIdObj {
  String? get id => throw _privateConstructorUsedError;
  String? get user_name => throw _privateConstructorUsedError;
  String? get p_image => throw _privateConstructorUsedError;
  String? get ring_name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SenderIdObjCopyWith<SenderIdObj> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SenderIdObjCopyWith<$Res> {
  factory $SenderIdObjCopyWith(
          SenderIdObj value, $Res Function(SenderIdObj) then) =
      _$SenderIdObjCopyWithImpl<$Res>;
  $Res call(
      {String? id, String? user_name, String? p_image, String? ring_name});
}

/// @nodoc
class _$SenderIdObjCopyWithImpl<$Res> implements $SenderIdObjCopyWith<$Res> {
  _$SenderIdObjCopyWithImpl(this._value, this._then);

  final SenderIdObj _value;
  // ignore: unused_field
  final $Res Function(SenderIdObj) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? user_name = freezed,
    Object? p_image = freezed,
    Object? ring_name = freezed,
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
      ring_name: ring_name == freezed
          ? _value.ring_name
          : ring_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$SenderIdObjCopyWith<$Res>
    implements $SenderIdObjCopyWith<$Res> {
  factory _$SenderIdObjCopyWith(
          _SenderIdObj value, $Res Function(_SenderIdObj) then) =
      __$SenderIdObjCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id, String? user_name, String? p_image, String? ring_name});
}

/// @nodoc
class __$SenderIdObjCopyWithImpl<$Res> extends _$SenderIdObjCopyWithImpl<$Res>
    implements _$SenderIdObjCopyWith<$Res> {
  __$SenderIdObjCopyWithImpl(
      _SenderIdObj _value, $Res Function(_SenderIdObj) _then)
      : super(_value, (v) => _then(v as _SenderIdObj));

  @override
  _SenderIdObj get _value => super._value as _SenderIdObj;

  @override
  $Res call({
    Object? id = freezed,
    Object? user_name = freezed,
    Object? p_image = freezed,
    Object? ring_name = freezed,
  }) {
    return _then(_SenderIdObj(
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
      ring_name: ring_name == freezed
          ? _value.ring_name
          : ring_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SenderIdObj implements _SenderIdObj {
  _$_SenderIdObj({this.id, this.user_name, this.p_image, this.ring_name});

  factory _$_SenderIdObj.fromJson(Map<String, dynamic> json) =>
      _$$_SenderIdObjFromJson(json);

  @override
  final String? id;
  @override
  final String? user_name;
  @override
  final String? p_image;
  @override
  final String? ring_name;

  @override
  String toString() {
    return 'SenderIdObj(_id: $id, user_name: $user_name, p_image: $p_image, ring_name: $ring_name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SenderIdObj &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user_name, user_name) ||
                other.user_name == user_name) &&
            (identical(other.p_image, p_image) || other.p_image == p_image) &&
            (identical(other.ring_name, ring_name) ||
                other.ring_name == ring_name));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, user_name, p_image, ring_name);

  @JsonKey(ignore: true)
  @override
  _$SenderIdObjCopyWith<_SenderIdObj> get copyWith =>
      __$SenderIdObjCopyWithImpl<_SenderIdObj>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SenderIdObjToJson(this);
  }
}

abstract class _SenderIdObj implements SenderIdObj {
  factory _SenderIdObj(
      {String? id,
      String? user_name,
      String? p_image,
      String? ring_name}) = _$_SenderIdObj;

  factory _SenderIdObj.fromJson(Map<String, dynamic> json) =
      _$_SenderIdObj.fromJson;

  @override
  String? get id;
  @override
  String? get user_name;
  @override
  String? get p_image;
  @override
  String? get ring_name;
  @override
  @JsonKey(ignore: true)
  _$SenderIdObjCopyWith<_SenderIdObj> get copyWith =>
      throw _privateConstructorUsedError;
}
