// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomeState _$HomeStateFromJson(Map<String, dynamic> json) {
  return _HomeState.fromJson(json);
}

/// @nodoc
mixin _$HomeState {
  bool? get canRecordMood => throw _privateConstructorUsedError;
  bool? get createHealthDiaryEntry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call({bool? canRecordMood, bool? createHealthDiaryEntry});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? canRecordMood = freezed,
    Object? createHealthDiaryEntry = freezed,
  }) {
    return _then(_value.copyWith(
      canRecordMood: canRecordMood == freezed
          ? _value.canRecordMood
          : canRecordMood // ignore: cast_nullable_to_non_nullable
              as bool?,
      createHealthDiaryEntry: createHealthDiaryEntry == freezed
          ? _value.createHealthDiaryEntry
          : createHealthDiaryEntry // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  $Res call({bool? canRecordMood, bool? createHealthDiaryEntry});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, (v) => _then(v as _$_HomeState));

  @override
  _$_HomeState get _value => super._value as _$_HomeState;

  @override
  $Res call({
    Object? canRecordMood = freezed,
    Object? createHealthDiaryEntry = freezed,
  }) {
    return _then(_$_HomeState(
      canRecordMood: canRecordMood == freezed
          ? _value.canRecordMood
          : canRecordMood // ignore: cast_nullable_to_non_nullable
              as bool?,
      createHealthDiaryEntry: createHealthDiaryEntry == freezed
          ? _value.createHealthDiaryEntry
          : createHealthDiaryEntry // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HomeState implements _HomeState {
  _$_HomeState({this.canRecordMood, this.createHealthDiaryEntry});

  factory _$_HomeState.fromJson(Map<String, dynamic> json) =>
      _$$_HomeStateFromJson(json);

  @override
  final bool? canRecordMood;
  @override
  final bool? createHealthDiaryEntry;

  @override
  String toString() {
    return 'HomeState(canRecordMood: $canRecordMood, createHealthDiaryEntry: $createHealthDiaryEntry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            const DeepCollectionEquality()
                .equals(other.canRecordMood, canRecordMood) &&
            const DeepCollectionEquality()
                .equals(other.createHealthDiaryEntry, createHealthDiaryEntry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(canRecordMood),
      const DeepCollectionEquality().hash(createHealthDiaryEntry));

  @JsonKey(ignore: true)
  @override
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomeStateToJson(this);
  }
}

abstract class _HomeState implements HomeState {
  factory _HomeState(
      {final bool? canRecordMood,
      final bool? createHealthDiaryEntry}) = _$_HomeState;

  factory _HomeState.fromJson(Map<String, dynamic> json) =
      _$_HomeState.fromJson;

  @override
  bool? get canRecordMood;
  @override
  bool? get createHealthDiaryEntry;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
