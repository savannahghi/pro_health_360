// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ban_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExtraData _$ExtraDataFromJson(Map<String, dynamic> json) {
  return _ExtraData.fromJson(json);
}

/// @nodoc
class _$ExtraDataTearOff {
  const _$ExtraDataTearOff();

  _ExtraData call(
      {@JsonKey(name: 'bannedInCommunity') bool bannedInCommunity = false}) {
    return _ExtraData(
      bannedInCommunity: bannedInCommunity,
    );
  }

  ExtraData fromJson(Map<String, Object?> json) {
    return ExtraData.fromJson(json);
  }
}

/// @nodoc
const $ExtraData = _$ExtraDataTearOff();

/// @nodoc
mixin _$ExtraData {
  @JsonKey(name: 'bannedInCommunity')
  bool get bannedInCommunity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExtraDataCopyWith<ExtraData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtraDataCopyWith<$Res> {
  factory $ExtraDataCopyWith(ExtraData value, $Res Function(ExtraData) then) =
      _$ExtraDataCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'bannedInCommunity') bool bannedInCommunity});
}

/// @nodoc
class _$ExtraDataCopyWithImpl<$Res> implements $ExtraDataCopyWith<$Res> {
  _$ExtraDataCopyWithImpl(this._value, this._then);

  final ExtraData _value;
  // ignore: unused_field
  final $Res Function(ExtraData) _then;

  @override
  $Res call({
    Object? bannedInCommunity = freezed,
  }) {
    return _then(_value.copyWith(
      bannedInCommunity: bannedInCommunity == freezed
          ? _value.bannedInCommunity
          : bannedInCommunity // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ExtraDataCopyWith<$Res> implements $ExtraDataCopyWith<$Res> {
  factory _$ExtraDataCopyWith(
          _ExtraData value, $Res Function(_ExtraData) then) =
      __$ExtraDataCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'bannedInCommunity') bool bannedInCommunity});
}

/// @nodoc
class __$ExtraDataCopyWithImpl<$Res> extends _$ExtraDataCopyWithImpl<$Res>
    implements _$ExtraDataCopyWith<$Res> {
  __$ExtraDataCopyWithImpl(_ExtraData _value, $Res Function(_ExtraData) _then)
      : super(_value, (v) => _then(v as _ExtraData));

  @override
  _ExtraData get _value => super._value as _ExtraData;

  @override
  $Res call({
    Object? bannedInCommunity = freezed,
  }) {
    return _then(_ExtraData(
      bannedInCommunity: bannedInCommunity == freezed
          ? _value.bannedInCommunity
          : bannedInCommunity // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExtraData implements _ExtraData {
  _$_ExtraData(
      {@JsonKey(name: 'bannedInCommunity') this.bannedInCommunity = false});

  factory _$_ExtraData.fromJson(Map<String, dynamic> json) =>
      _$$_ExtraDataFromJson(json);

  @override
  @JsonKey(name: 'bannedInCommunity')
  final bool bannedInCommunity;

  @override
  String toString() {
    return 'ExtraData(bannedInCommunity: $bannedInCommunity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExtraData &&
            const DeepCollectionEquality()
                .equals(other.bannedInCommunity, bannedInCommunity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(bannedInCommunity));

  @JsonKey(ignore: true)
  @override
  _$ExtraDataCopyWith<_ExtraData> get copyWith =>
      __$ExtraDataCopyWithImpl<_ExtraData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExtraDataToJson(this);
  }
}

abstract class _ExtraData implements ExtraData {
  factory _ExtraData(
          {@JsonKey(name: 'bannedInCommunity') bool bannedInCommunity}) =
      _$_ExtraData;

  factory _ExtraData.fromJson(Map<String, dynamic> json) =
      _$_ExtraData.fromJson;

  @override
  @JsonKey(name: 'bannedInCommunity')
  bool get bannedInCommunity;
  @override
  @JsonKey(ignore: true)
  _$ExtraDataCopyWith<_ExtraData> get copyWith =>
      throw _privateConstructorUsedError;
}
