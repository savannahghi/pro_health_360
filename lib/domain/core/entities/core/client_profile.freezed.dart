// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'client_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientProfile _$ClientProfileFromJson(Map<String, dynamic> json) {
  return _ClientProfile.fromJson(json);
}

/// @nodoc
class _$ClientProfileTearOff {
  const _$ClientProfileTearOff();

  _ClientProfile call(
      {@JsonKey(name: 'user') User? user,
      @JsonKey(name: 'active') bool? active,
      @JsonKey(name: 'lastMoodRecordedDate') String? lastMoodRecordedDate}) {
    return _ClientProfile(
      user: user,
      active: active,
      lastMoodRecordedDate: lastMoodRecordedDate,
    );
  }

  ClientProfile fromJson(Map<String, Object> json) {
    return ClientProfile.fromJson(json);
  }
}

/// @nodoc
const $ClientProfile = _$ClientProfileTearOff();

/// @nodoc
mixin _$ClientProfile {
  @JsonKey(name: 'user')
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'active')
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastMoodRecordedDate')
  String? get lastMoodRecordedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientProfileCopyWith<ClientProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientProfileCopyWith<$Res> {
  factory $ClientProfileCopyWith(
          ClientProfile value, $Res Function(ClientProfile) then) =
      _$ClientProfileCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'user') User? user,
      @JsonKey(name: 'active') bool? active,
      @JsonKey(name: 'lastMoodRecordedDate') String? lastMoodRecordedDate});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$ClientProfileCopyWithImpl<$Res>
    implements $ClientProfileCopyWith<$Res> {
  _$ClientProfileCopyWithImpl(this._value, this._then);

  final ClientProfile _value;
  // ignore: unused_field
  final $Res Function(ClientProfile) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? active = freezed,
    Object? lastMoodRecordedDate = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastMoodRecordedDate: lastMoodRecordedDate == freezed
          ? _value.lastMoodRecordedDate
          : lastMoodRecordedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$ClientProfileCopyWith<$Res>
    implements $ClientProfileCopyWith<$Res> {
  factory _$ClientProfileCopyWith(
          _ClientProfile value, $Res Function(_ClientProfile) then) =
      __$ClientProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'user') User? user,
      @JsonKey(name: 'active') bool? active,
      @JsonKey(name: 'lastMoodRecordedDate') String? lastMoodRecordedDate});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$ClientProfileCopyWithImpl<$Res>
    extends _$ClientProfileCopyWithImpl<$Res>
    implements _$ClientProfileCopyWith<$Res> {
  __$ClientProfileCopyWithImpl(
      _ClientProfile _value, $Res Function(_ClientProfile) _then)
      : super(_value, (v) => _then(v as _ClientProfile));

  @override
  _ClientProfile get _value => super._value as _ClientProfile;

  @override
  $Res call({
    Object? user = freezed,
    Object? active = freezed,
    Object? lastMoodRecordedDate = freezed,
  }) {
    return _then(_ClientProfile(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastMoodRecordedDate: lastMoodRecordedDate == freezed
          ? _value.lastMoodRecordedDate
          : lastMoodRecordedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClientProfile implements _ClientProfile {
  _$_ClientProfile(
      {@JsonKey(name: 'user') this.user,
      @JsonKey(name: 'active') this.active,
      @JsonKey(name: 'lastMoodRecordedDate') this.lastMoodRecordedDate});

  factory _$_ClientProfile.fromJson(Map<String, dynamic> json) =>
      _$_$_ClientProfileFromJson(json);

  @override
  @JsonKey(name: 'user')
  final User? user;
  @override
  @JsonKey(name: 'active')
  final bool? active;
  @override
  @JsonKey(name: 'lastMoodRecordedDate')
  final String? lastMoodRecordedDate;

  @override
  String toString() {
    return 'ClientProfile(user: $user, active: $active, lastMoodRecordedDate: $lastMoodRecordedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ClientProfile &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.lastMoodRecordedDate, lastMoodRecordedDate) ||
                const DeepCollectionEquality()
                    .equals(other.lastMoodRecordedDate, lastMoodRecordedDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(lastMoodRecordedDate);

  @JsonKey(ignore: true)
  @override
  _$ClientProfileCopyWith<_ClientProfile> get copyWith =>
      __$ClientProfileCopyWithImpl<_ClientProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ClientProfileToJson(this);
  }
}

abstract class _ClientProfile implements ClientProfile {
  factory _ClientProfile(
      {@JsonKey(name: 'user')
          User? user,
      @JsonKey(name: 'active')
          bool? active,
      @JsonKey(name: 'lastMoodRecordedDate')
          String? lastMoodRecordedDate}) = _$_ClientProfile;

  factory _ClientProfile.fromJson(Map<String, dynamic> json) =
      _$_ClientProfile.fromJson;

  @override
  @JsonKey(name: 'user')
  User? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'active')
  bool? get active => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'lastMoodRecordedDate')
  String? get lastMoodRecordedDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ClientProfileCopyWith<_ClientProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
