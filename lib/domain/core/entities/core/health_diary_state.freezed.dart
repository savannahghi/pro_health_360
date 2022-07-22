// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'health_diary_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HealthDiaryState _$HealthDiaryStateFromJson(Map<String, dynamic> json) {
  return _HealthDiaryState.fromJson(json);
}

/// @nodoc
mixin _$HealthDiaryState {
  @JsonKey(name: 'getClientHealthDiaryEntries')
  List<HealthDiaryEntry?>? get entries => throw _privateConstructorUsedError;
  QuoteRelay? get quoteState => throw _privateConstructorUsedError;
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
      QuoteRelay? quoteState,
      bool? errorFetchingDiaryEntries,
      bool? timeoutFetchingDiaryEntries,
      bool? shouldShareHealthRecord,
      bool? shouldNotShareHealthRecord});

  $QuoteRelayCopyWith<$Res>? get quoteState;
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
    Object? quoteState = freezed,
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
      quoteState: quoteState == freezed
          ? _value.quoteState
          : quoteState // ignore: cast_nullable_to_non_nullable
              as QuoteRelay?,
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

  @override
  $QuoteRelayCopyWith<$Res>? get quoteState {
    if (_value.quoteState == null) {
      return null;
    }

    return $QuoteRelayCopyWith<$Res>(_value.quoteState!, (value) {
      return _then(_value.copyWith(quoteState: value));
    });
  }
}

/// @nodoc
abstract class _$$_HealthDiaryStateCopyWith<$Res>
    implements $HealthDiaryStateCopyWith<$Res> {
  factory _$$_HealthDiaryStateCopyWith(
          _$_HealthDiaryState value, $Res Function(_$_HealthDiaryState) then) =
      __$$_HealthDiaryStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'getClientHealthDiaryEntries')
          List<HealthDiaryEntry?>? entries,
      QuoteRelay? quoteState,
      bool? errorFetchingDiaryEntries,
      bool? timeoutFetchingDiaryEntries,
      bool? shouldShareHealthRecord,
      bool? shouldNotShareHealthRecord});

  @override
  $QuoteRelayCopyWith<$Res>? get quoteState;
}

/// @nodoc
class __$$_HealthDiaryStateCopyWithImpl<$Res>
    extends _$HealthDiaryStateCopyWithImpl<$Res>
    implements _$$_HealthDiaryStateCopyWith<$Res> {
  __$$_HealthDiaryStateCopyWithImpl(
      _$_HealthDiaryState _value, $Res Function(_$_HealthDiaryState) _then)
      : super(_value, (v) => _then(v as _$_HealthDiaryState));

  @override
  _$_HealthDiaryState get _value => super._value as _$_HealthDiaryState;

  @override
  $Res call({
    Object? entries = freezed,
    Object? quoteState = freezed,
    Object? errorFetchingDiaryEntries = freezed,
    Object? timeoutFetchingDiaryEntries = freezed,
    Object? shouldShareHealthRecord = freezed,
    Object? shouldNotShareHealthRecord = freezed,
  }) {
    return _then(_$_HealthDiaryState(
      entries: entries == freezed
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<HealthDiaryEntry?>?,
      quoteState: quoteState == freezed
          ? _value.quoteState
          : quoteState // ignore: cast_nullable_to_non_nullable
              as QuoteRelay?,
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
      {@JsonKey(name: 'getClientHealthDiaryEntries')
          final List<HealthDiaryEntry?>? entries,
      this.quoteState,
      this.errorFetchingDiaryEntries,
      this.timeoutFetchingDiaryEntries,
      this.shouldShareHealthRecord,
      this.shouldNotShareHealthRecord})
      : _entries = entries;

  factory _$_HealthDiaryState.fromJson(Map<String, dynamic> json) =>
      _$$_HealthDiaryStateFromJson(json);

  final List<HealthDiaryEntry?>? _entries;
  @override
  @JsonKey(name: 'getClientHealthDiaryEntries')
  List<HealthDiaryEntry?>? get entries {
    final value = _entries;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final QuoteRelay? quoteState;
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
    return 'HealthDiaryState(entries: $entries, quoteState: $quoteState, errorFetchingDiaryEntries: $errorFetchingDiaryEntries, timeoutFetchingDiaryEntries: $timeoutFetchingDiaryEntries, shouldShareHealthRecord: $shouldShareHealthRecord, shouldNotShareHealthRecord: $shouldNotShareHealthRecord)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HealthDiaryState &&
            const DeepCollectionEquality().equals(other._entries, _entries) &&
            const DeepCollectionEquality()
                .equals(other.quoteState, quoteState) &&
            const DeepCollectionEquality().equals(
                other.errorFetchingDiaryEntries, errorFetchingDiaryEntries) &&
            const DeepCollectionEquality().equals(
                other.timeoutFetchingDiaryEntries,
                timeoutFetchingDiaryEntries) &&
            const DeepCollectionEquality().equals(
                other.shouldShareHealthRecord, shouldShareHealthRecord) &&
            const DeepCollectionEquality().equals(
                other.shouldNotShareHealthRecord, shouldNotShareHealthRecord));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_entries),
      const DeepCollectionEquality().hash(quoteState),
      const DeepCollectionEquality().hash(errorFetchingDiaryEntries),
      const DeepCollectionEquality().hash(timeoutFetchingDiaryEntries),
      const DeepCollectionEquality().hash(shouldShareHealthRecord),
      const DeepCollectionEquality().hash(shouldNotShareHealthRecord));

  @JsonKey(ignore: true)
  @override
  _$$_HealthDiaryStateCopyWith<_$_HealthDiaryState> get copyWith =>
      __$$_HealthDiaryStateCopyWithImpl<_$_HealthDiaryState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HealthDiaryStateToJson(this);
  }
}

abstract class _HealthDiaryState implements HealthDiaryState {
  factory _HealthDiaryState(
      {@JsonKey(name: 'getClientHealthDiaryEntries')
          final List<HealthDiaryEntry?>? entries,
      final QuoteRelay? quoteState,
      final bool? errorFetchingDiaryEntries,
      final bool? timeoutFetchingDiaryEntries,
      final bool? shouldShareHealthRecord,
      final bool? shouldNotShareHealthRecord}) = _$_HealthDiaryState;

  factory _HealthDiaryState.fromJson(Map<String, dynamic> json) =
      _$_HealthDiaryState.fromJson;

  @override
  @JsonKey(name: 'getClientHealthDiaryEntries')
  List<HealthDiaryEntry?>? get entries;
  @override
  QuoteRelay? get quoteState;
  @override
  bool? get errorFetchingDiaryEntries;
  @override
  bool? get timeoutFetchingDiaryEntries;
  @override
  bool? get shouldShareHealthRecord;
  @override
  bool? get shouldNotShareHealthRecord;
  @override
  @JsonKey(ignore: true)
  _$$_HealthDiaryStateCopyWith<_$_HealthDiaryState> get copyWith =>
      throw _privateConstructorUsedError;
}
