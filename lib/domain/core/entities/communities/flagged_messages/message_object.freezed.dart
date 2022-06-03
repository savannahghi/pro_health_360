// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'message_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageObject _$MessageObjectFromJson(Map<String, dynamic> json) {
  return _MessageObject.fromJson(json);
}

/// @nodoc
class _$MessageObjectTearOff {
  const _$MessageObjectTearOff();

  _MessageObject call({@JsonKey(name: 'message') Message? message}) {
    return _MessageObject(
      message: message,
    );
  }

  MessageObject fromJson(Map<String, Object?> json) {
    return MessageObject.fromJson(json);
  }
}

/// @nodoc
const $MessageObject = _$MessageObjectTearOff();

/// @nodoc
mixin _$MessageObject {
  @JsonKey(name: 'message')
  Message? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageObjectCopyWith<MessageObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageObjectCopyWith<$Res> {
  factory $MessageObjectCopyWith(
          MessageObject value, $Res Function(MessageObject) then) =
      _$MessageObjectCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'message') Message? message});
}

/// @nodoc
class _$MessageObjectCopyWithImpl<$Res>
    implements $MessageObjectCopyWith<$Res> {
  _$MessageObjectCopyWithImpl(this._value, this._then);

  final MessageObject _value;
  // ignore: unused_field
  final $Res Function(MessageObject) _then;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message?,
    ));
  }
}

/// @nodoc
abstract class _$MessageObjectCopyWith<$Res>
    implements $MessageObjectCopyWith<$Res> {
  factory _$MessageObjectCopyWith(
          _MessageObject value, $Res Function(_MessageObject) then) =
      __$MessageObjectCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'message') Message? message});
}

/// @nodoc
class __$MessageObjectCopyWithImpl<$Res>
    extends _$MessageObjectCopyWithImpl<$Res>
    implements _$MessageObjectCopyWith<$Res> {
  __$MessageObjectCopyWithImpl(
      _MessageObject _value, $Res Function(_MessageObject) _then)
      : super(_value, (v) => _then(v as _MessageObject));

  @override
  _MessageObject get _value => super._value as _MessageObject;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_MessageObject(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessageObject implements _MessageObject {
  _$_MessageObject({@JsonKey(name: 'message') this.message});

  factory _$_MessageObject.fromJson(Map<String, dynamic> json) =>
      _$$_MessageObjectFromJson(json);

  @override
  @JsonKey(name: 'message')
  final Message? message;

  @override
  String toString() {
    return 'MessageObject(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessageObject &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$MessageObjectCopyWith<_MessageObject> get copyWith =>
      __$MessageObjectCopyWithImpl<_MessageObject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageObjectToJson(this);
  }
}

abstract class _MessageObject implements MessageObject {
  factory _MessageObject({@JsonKey(name: 'message') Message? message}) =
      _$_MessageObject;

  factory _MessageObject.fromJson(Map<String, dynamic> json) =
      _$_MessageObject.fromJson;

  @override
  @JsonKey(name: 'message')
  Message? get message;
  @override
  @JsonKey(ignore: true)
  _$MessageObjectCopyWith<_MessageObject> get copyWith =>
      throw _privateConstructorUsedError;
}
