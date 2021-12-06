// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'saved_content_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SavedContentState _$SavedContentStateFromJson(Map<String, dynamic> json) {
  return _SavedContentState.fromJson(json);
}

/// @nodoc
class _$SavedContentStateTearOff {
  const _$SavedContentStateTearOff();

  _SavedContentState call(
      {@JsonKey(name: 'items') List<Content?>? savedContentItems,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent}) {
    return _SavedContentState(
      savedContentItems: savedContentItems,
      errorFetchingContent: errorFetchingContent,
      timeoutFetchingContent: timeoutFetchingContent,
    );
  }

  SavedContentState fromJson(Map<String, Object> json) {
    return SavedContentState.fromJson(json);
  }
}

/// @nodoc
const $SavedContentState = _$SavedContentStateTearOff();

/// @nodoc
mixin _$SavedContentState {
  @JsonKey(name: 'items')
  List<Content?>? get savedContentItems => throw _privateConstructorUsedError;
  bool? get errorFetchingContent => throw _privateConstructorUsedError;
  bool? get timeoutFetchingContent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedContentStateCopyWith<SavedContentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedContentStateCopyWith<$Res> {
  factory $SavedContentStateCopyWith(
          SavedContentState value, $Res Function(SavedContentState) then) =
      _$SavedContentStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'items') List<Content?>? savedContentItems,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent});
}

/// @nodoc
class _$SavedContentStateCopyWithImpl<$Res>
    implements $SavedContentStateCopyWith<$Res> {
  _$SavedContentStateCopyWithImpl(this._value, this._then);

  final SavedContentState _value;
  // ignore: unused_field
  final $Res Function(SavedContentState) _then;

  @override
  $Res call({
    Object? savedContentItems = freezed,
    Object? errorFetchingContent = freezed,
    Object? timeoutFetchingContent = freezed,
  }) {
    return _then(_value.copyWith(
      savedContentItems: savedContentItems == freezed
          ? _value.savedContentItems
          : savedContentItems // ignore: cast_nullable_to_non_nullable
              as List<Content?>?,
      errorFetchingContent: errorFetchingContent == freezed
          ? _value.errorFetchingContent
          : errorFetchingContent // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutFetchingContent: timeoutFetchingContent == freezed
          ? _value.timeoutFetchingContent
          : timeoutFetchingContent // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$SavedContentStateCopyWith<$Res>
    implements $SavedContentStateCopyWith<$Res> {
  factory _$SavedContentStateCopyWith(
          _SavedContentState value, $Res Function(_SavedContentState) then) =
      __$SavedContentStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'items') List<Content?>? savedContentItems,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent});
}

/// @nodoc
class __$SavedContentStateCopyWithImpl<$Res>
    extends _$SavedContentStateCopyWithImpl<$Res>
    implements _$SavedContentStateCopyWith<$Res> {
  __$SavedContentStateCopyWithImpl(
      _SavedContentState _value, $Res Function(_SavedContentState) _then)
      : super(_value, (v) => _then(v as _SavedContentState));

  @override
  _SavedContentState get _value => super._value as _SavedContentState;

  @override
  $Res call({
    Object? savedContentItems = freezed,
    Object? errorFetchingContent = freezed,
    Object? timeoutFetchingContent = freezed,
  }) {
    return _then(_SavedContentState(
      savedContentItems: savedContentItems == freezed
          ? _value.savedContentItems
          : savedContentItems // ignore: cast_nullable_to_non_nullable
              as List<Content?>?,
      errorFetchingContent: errorFetchingContent == freezed
          ? _value.errorFetchingContent
          : errorFetchingContent // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeoutFetchingContent: timeoutFetchingContent == freezed
          ? _value.timeoutFetchingContent
          : timeoutFetchingContent // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SavedContentState implements _SavedContentState {
  _$_SavedContentState(
      {@JsonKey(name: 'items') this.savedContentItems,
      this.errorFetchingContent,
      this.timeoutFetchingContent});

  factory _$_SavedContentState.fromJson(Map<String, dynamic> json) =>
      _$_$_SavedContentStateFromJson(json);

  @override
  @JsonKey(name: 'items')
  final List<Content?>? savedContentItems;
  @override
  final bool? errorFetchingContent;
  @override
  final bool? timeoutFetchingContent;

  @override
  String toString() {
    return 'SavedContentState(savedContentItems: $savedContentItems, errorFetchingContent: $errorFetchingContent, timeoutFetchingContent: $timeoutFetchingContent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SavedContentState &&
            (identical(other.savedContentItems, savedContentItems) ||
                const DeepCollectionEquality()
                    .equals(other.savedContentItems, savedContentItems)) &&
            (identical(other.errorFetchingContent, errorFetchingContent) ||
                const DeepCollectionEquality().equals(
                    other.errorFetchingContent, errorFetchingContent)) &&
            (identical(other.timeoutFetchingContent, timeoutFetchingContent) ||
                const DeepCollectionEquality().equals(
                    other.timeoutFetchingContent, timeoutFetchingContent)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(savedContentItems) ^
      const DeepCollectionEquality().hash(errorFetchingContent) ^
      const DeepCollectionEquality().hash(timeoutFetchingContent);

  @JsonKey(ignore: true)
  @override
  _$SavedContentStateCopyWith<_SavedContentState> get copyWith =>
      __$SavedContentStateCopyWithImpl<_SavedContentState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SavedContentStateToJson(this);
  }
}

abstract class _SavedContentState implements SavedContentState {
  factory _SavedContentState(
      {@JsonKey(name: 'items') List<Content?>? savedContentItems,
      bool? errorFetchingContent,
      bool? timeoutFetchingContent}) = _$_SavedContentState;

  factory _SavedContentState.fromJson(Map<String, dynamic> json) =
      _$_SavedContentState.fromJson;

  @override
  @JsonKey(name: 'items')
  List<Content?>? get savedContentItems => throw _privateConstructorUsedError;
  @override
  bool? get errorFetchingContent => throw _privateConstructorUsedError;
  @override
  bool? get timeoutFetchingContent => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SavedContentStateCopyWith<_SavedContentState> get copyWith =>
      throw _privateConstructorUsedError;
}
