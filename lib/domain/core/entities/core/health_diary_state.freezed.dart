// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'health_diary_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HealthDiaryState _$HealthDiaryStateFromJson(Map<String, dynamic> json) {
  return _HealthDiaryState.fromJson(json);
}

/// @nodoc
class _$HealthDiaryStateTearOff {
  const _$HealthDiaryStateTearOff();

  _HealthDiaryState call(
      {@JsonKey(name: 'getClientHealthDiaryEntries')
          List<HealthDiaryEntry?>? entries,
      bool? errorFetchingDiaryEntries,
      bool? timeoutFetchingDiaryEntries,
      bool? shouldShareHealthRecord,
      bool? shouldNotShareHealthRecord}) {
    return _HealthDiaryState(
      entries: entries,
      errorFetchingDiaryEntries: errorFetchingDiaryEntries,
      timeoutFetchingDiaryEntries: timeoutFetchingDiaryEntries,
      shouldShareHealthRecord: shouldShareHealthRecord,
      shouldNotShareHealthRecord: shouldNotShareHealthRecord,
    );
  }

  HealthDiaryState fromJson(Map<String, Object> json) {
    return HealthDiaryState.fromJson(json);
  }
}

/// @nodoc
const $HealthDiaryState = _$HealthDiaryStateTearOff();

/// @nodoc
mixin _$HealthDiaryState {
  @JsonKey(name: 'getClientHealthDiaryEntries')
  List<HealthDiaryEntry?>? get entries => throw _privateConstructorUsedError;
  bool? get errorFetchingDiaryEntries => throw _privateConstructorUsedError;
  bool? get timeoutFetchingDiaryEntries => throw _privateConstructorUsedError;
  bool? get shouldShareHealthRecord => throw _privateConstructorUsedError;
  bool? get shouldNotShareHealthRecord => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HealthDiaryStateCopyWith<HealthDiaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthDiaryStateCopyWith<$Res> {
  factory $HealthDiaryStateCopyWith(
          HealthDiaryState value, $Res Function(HealthDiaryState) then) =
      _$HealthDiaryStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'getClientHealthDiaryEntries')
          List<HealthDiaryEntry?>? entries,
      bool? errorFetchingDiaryEntries,
      bool? timeoutFetchingDiaryEntries,
      bool? shouldShareHealthRecord,
      bool? shouldNotShareHealthRecord});
}

/// @nodoc
class _$HealthDiaryStateCopyWithImpl<$Res>
    implements $HealthDiaryStateCopyWith<$Res> {
  _$HealthDiaryStateCopyWithImpl(this._value, this._then);

  final HealthDiaryState _value;
  // ignore: unused_field
  final $Res Function(HealthDiaryState) _then;

  @override
  $Res call({
    Object? entries = freezed,
    Object? errorFetchingDiaryEntries = freezed,
    Object? timeoutFetchingDiaryEntries = freezed,
    Object? shouldShareHealthRecord = freezed,
    Object? shouldNotShareHealthRecord = freezed,
  }) {
    return _then(_value.copyWith(
      entries: entries == freezed
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<HealthDiaryEntry?>?,
      errorFetchingDiaryEntries: errorFetchingDiaryEntries == freezed
          ? _value.errorFetchingDiaryEntries
          : errorFetchingDiaryEntries // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutFetchingDiaryEntries: timeoutFetchingDiaryEntries == freezed
          ? _value.timeoutFetchingDiaryEntries
          : timeoutFetchingDiaryEntries // ignore: cast_nullable_to_non_nullable
              as bool?,
      shouldShareHealthRecord: shouldShareHealthRecord == freezed
          ? _value.shouldShareHealthRecord
          : shouldShareHealthRecord // ignore: cast_nullable_to_non_nullable
              as bool?,
      shouldNotShareHealthRecord: shouldNotShareHealthRecord == freezed
          ? _value.shouldNotShareHealthRecord
          : shouldNotShareHealthRecord // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$HealthDiaryStateCopyWith<$Res>
    implements $HealthDiaryStateCopyWith<$Res> {
  factory _$HealthDiaryStateCopyWith(
          _HealthDiaryState value, $Res Function(_HealthDiaryState) then) =
      __$HealthDiaryStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'getClientHealthDiaryEntries')
          List<HealthDiaryEntry?>? entries,
      bool? errorFetchingDiaryEntries,
      bool? timeoutFetchingDiaryEntries,
      bool? shouldShareHealthRecord,
      bool? shouldNotShareHealthRecord});
}

/// @nodoc
class __$HealthDiaryStateCopyWithImpl<$Res>
    extends _$HealthDiaryStateCopyWithImpl<$Res>
    implements _$HealthDiaryStateCopyWith<$Res> {
  __$HealthDiaryStateCopyWithImpl(
      _HealthDiaryState _value, $Res Function(_HealthDiaryState) _then)
      : super(_value, (v) => _then(v as _HealthDiaryState));

  @override
  _HealthDiaryState get _value => super._value as _HealthDiaryState;

  @override
  $Res call({
    Object? entries = freezed,
    Object? errorFetchingDiaryEntries = freezed,
    Object? timeoutFetchingDiaryEntries = freezed,
    Object? shouldShareHealthRecord = freezed,
    Object? shouldNotShareHealthRecord = freezed,
  }) {
    return _then(_HealthDiaryState(
      entries: entries == freezed
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<HealthDiaryEntry?>?,
      errorFetchingDiaryEntries: errorFetchingDiaryEntries == freezed
          ? _value.errorFetchingDiaryEntries
          : errorFetchingDiaryEntries // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutFetchingDiaryEntries: timeoutFetchingDiaryEntries == freezed
          ? _value.timeoutFetchingDiaryEntries
          : timeoutFetchingDiaryEntries // ignore: cast_nullable_to_non_nullable
              as bool?,
      shouldShareHealthRecord: shouldShareHealthRecord == freezed
          ? _value.shouldShareHealthRecord
          : shouldShareHealthRecord // ignore: cast_nullable_to_non_nullable
              as bool?,
      shouldNotShareHealthRecord: shouldNotShareHealthRecord == freezed
          ? _value.shouldNotShareHealthRecord
          : shouldNotShareHealthRecord // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HealthDiaryState implements _HealthDiaryState {
  _$_HealthDiaryState(
      {@JsonKey(name: 'getClientHealthDiaryEntries') this.entries,
      this.errorFetchingDiaryEntries,
      this.timeoutFetchingDiaryEntries,
      this.shouldShareHealthRecord,
      this.shouldNotShareHealthRecord});

  factory _$_HealthDiaryState.fromJson(Map<String, dynamic> json) =>
      _$_$_HealthDiaryStateFromJson(json);

  @override
  @JsonKey(name: 'getClientHealthDiaryEntries')
  final List<HealthDiaryEntry?>? entries;
  @override
  final bool? errorFetchingDiaryEntries;
  @override
  final bool? timeoutFetchingDiaryEntries;
  @override
  final bool? shouldShareHealthRecord;
  @override
  final bool? shouldNotShareHealthRecord;

  @override
  String toString() {
    return 'HealthDiaryState(entries: $entries, errorFetchingDiaryEntries: $errorFetchingDiaryEntries, timeoutFetchingDiaryEntries: $timeoutFetchingDiaryEntries, shouldShareHealthRecord: $shouldShareHealthRecord, shouldNotShareHealthRecord: $shouldNotShareHealthRecord)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HealthDiaryState &&
            (identical(other.entries, entries) ||
                const DeepCollectionEquality()
                    .equals(other.entries, entries)) &&
            (identical(other.errorFetchingDiaryEntries,
                    errorFetchingDiaryEntries) ||
                const DeepCollectionEquality().equals(
                    other.errorFetchingDiaryEntries,
                    errorFetchingDiaryEntries)) &&
            (identical(other.timeoutFetchingDiaryEntries,
                    timeoutFetchingDiaryEntries) ||
                const DeepCollectionEquality().equals(
                    other.timeoutFetchingDiaryEntries,
                    timeoutFetchingDiaryEntries)) &&
            (identical(
                    other.shouldShareHealthRecord, shouldShareHealthRecord) ||
                const DeepCollectionEquality().equals(
                    other.shouldShareHealthRecord, shouldShareHealthRecord)) &&
            (identical(other.shouldNotShareHealthRecord,
                    shouldNotShareHealthRecord) ||
                const DeepCollectionEquality().equals(
                    other.shouldNotShareHealthRecord,
                    shouldNotShareHealthRecord)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(entries) ^
      const DeepCollectionEquality().hash(errorFetchingDiaryEntries) ^
      const DeepCollectionEquality().hash(timeoutFetchingDiaryEntries) ^
      const DeepCollectionEquality().hash(shouldShareHealthRecord) ^
      const DeepCollectionEquality().hash(shouldNotShareHealthRecord);

  @JsonKey(ignore: true)
  @override
  _$HealthDiaryStateCopyWith<_HealthDiaryState> get copyWith =>
      __$HealthDiaryStateCopyWithImpl<_HealthDiaryState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HealthDiaryStateToJson(this);
  }
}

abstract class _HealthDiaryState implements HealthDiaryState {
  factory _HealthDiaryState(
      {@JsonKey(name: 'getClientHealthDiaryEntries')
          List<HealthDiaryEntry?>? entries,
      bool? errorFetchingDiaryEntries,
      bool? timeoutFetchingDiaryEntries,
      bool? shouldShareHealthRecord,
      bool? shouldNotShareHealthRecord}) = _$_HealthDiaryState;

  factory _HealthDiaryState.fromJson(Map<String, dynamic> json) =
      _$_HealthDiaryState.fromJson;

  @override
  @JsonKey(name: 'getClientHealthDiaryEntries')
  List<HealthDiaryEntry?>? get entries => throw _privateConstructorUsedError;
  @override
  bool? get errorFetchingDiaryEntries => throw _privateConstructorUsedError;
  @override
  bool? get timeoutFetchingDiaryEntries => throw _privateConstructorUsedError;
  @override
  bool? get shouldShareHealthRecord => throw _privateConstructorUsedError;
  @override
  bool? get shouldNotShareHealthRecord => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HealthDiaryStateCopyWith<_HealthDiaryState> get copyWith =>
      throw _privateConstructorUsedError;
}
