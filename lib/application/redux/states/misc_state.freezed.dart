// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'misc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MiscState _$MiscStateFromJson(Map<String, dynamic> json) {
  return _MiscState.fromJson(json);
}

/// @nodoc
class _$MiscStateTearOff {
  const _$MiscStateTearOff();

  _MiscState call(
      {@JsonKey(defaultValue: AppRoutes.phoneLogin)
          required String initialRoute,
      List<dynamic>? libraryListItems,
      FAQsContentState? profileFAQsContentState,
      String? healthPagePINInputTime,
      int? pinInputTries,
      String? maxTryTime,
      bool? pinVerified,
      bool? resumeTimer,
      GroupState? groupState,
      ChannelMembersState? channelMembersState,
      ScreeningToolsState? screeningToolsState,
      @JsonKey(name: 'fetchClientAppointments')
          AppointmentState? appointmentState,
      String? inactiveTime,
      bool? resumeWithPin,
      List<Survey>? availableSurveysList}) {
    return _MiscState(
      initialRoute: initialRoute,
      libraryListItems: libraryListItems,
      profileFAQsContentState: profileFAQsContentState,
      healthPagePINInputTime: healthPagePINInputTime,
      pinInputTries: pinInputTries,
      maxTryTime: maxTryTime,
      pinVerified: pinVerified,
      resumeTimer: resumeTimer,
      groupState: groupState,
      channelMembersState: channelMembersState,
      screeningToolsState: screeningToolsState,
      appointmentState: appointmentState,
      inactiveTime: inactiveTime,
      resumeWithPin: resumeWithPin,
      availableSurveysList: availableSurveysList,
    );
  }

  MiscState fromJson(Map<String, Object?> json) {
    return MiscState.fromJson(json);
  }
}

/// @nodoc
const $MiscState = _$MiscStateTearOff();

/// @nodoc
mixin _$MiscState {
  @JsonKey(defaultValue: AppRoutes.phoneLogin)
  String get initialRoute => throw _privateConstructorUsedError;
  List<dynamic>? get libraryListItems => throw _privateConstructorUsedError;
  FAQsContentState? get profileFAQsContentState =>
      throw _privateConstructorUsedError;
  String? get healthPagePINInputTime => throw _privateConstructorUsedError;
  int? get pinInputTries => throw _privateConstructorUsedError;
  String? get maxTryTime => throw _privateConstructorUsedError;
  bool? get pinVerified => throw _privateConstructorUsedError;
  bool? get resumeTimer => throw _privateConstructorUsedError;
  GroupState? get groupState => throw _privateConstructorUsedError;
  ChannelMembersState? get channelMembersState =>
      throw _privateConstructorUsedError;
  ScreeningToolsState? get screeningToolsState =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'fetchClientAppointments')
  AppointmentState? get appointmentState => throw _privateConstructorUsedError;
  String? get inactiveTime => throw _privateConstructorUsedError;
  bool? get resumeWithPin => throw _privateConstructorUsedError;
  List<Survey>? get availableSurveysList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MiscStateCopyWith<MiscState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MiscStateCopyWith<$Res> {
  factory $MiscStateCopyWith(MiscState value, $Res Function(MiscState) then) =
      _$MiscStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(defaultValue: AppRoutes.phoneLogin)
          String initialRoute,
      List<dynamic>? libraryListItems,
      FAQsContentState? profileFAQsContentState,
      String? healthPagePINInputTime,
      int? pinInputTries,
      String? maxTryTime,
      bool? pinVerified,
      bool? resumeTimer,
      GroupState? groupState,
      ChannelMembersState? channelMembersState,
      ScreeningToolsState? screeningToolsState,
      @JsonKey(name: 'fetchClientAppointments')
          AppointmentState? appointmentState,
      String? inactiveTime,
      bool? resumeWithPin,
      List<Survey>? availableSurveysList});

  $FAQsContentStateCopyWith<$Res>? get profileFAQsContentState;
  $GroupStateCopyWith<$Res>? get groupState;
  $ChannelMembersStateCopyWith<$Res>? get channelMembersState;
  $ScreeningToolsStateCopyWith<$Res>? get screeningToolsState;
  $AppointmentStateCopyWith<$Res>? get appointmentState;
}

/// @nodoc
class _$MiscStateCopyWithImpl<$Res> implements $MiscStateCopyWith<$Res> {
  _$MiscStateCopyWithImpl(this._value, this._then);

  final MiscState _value;
  // ignore: unused_field
  final $Res Function(MiscState) _then;

  @override
  $Res call({
    Object? initialRoute = freezed,
    Object? libraryListItems = freezed,
    Object? profileFAQsContentState = freezed,
    Object? healthPagePINInputTime = freezed,
    Object? pinInputTries = freezed,
    Object? maxTryTime = freezed,
    Object? pinVerified = freezed,
    Object? resumeTimer = freezed,
    Object? groupState = freezed,
    Object? channelMembersState = freezed,
    Object? screeningToolsState = freezed,
    Object? appointmentState = freezed,
    Object? inactiveTime = freezed,
    Object? resumeWithPin = freezed,
    Object? availableSurveysList = freezed,
  }) {
    return _then(_value.copyWith(
      initialRoute: initialRoute == freezed
          ? _value.initialRoute
          : initialRoute // ignore: cast_nullable_to_non_nullable
              as String,
      libraryListItems: libraryListItems == freezed
          ? _value.libraryListItems
          : libraryListItems // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      profileFAQsContentState: profileFAQsContentState == freezed
          ? _value.profileFAQsContentState
          : profileFAQsContentState // ignore: cast_nullable_to_non_nullable
              as FAQsContentState?,
      healthPagePINInputTime: healthPagePINInputTime == freezed
          ? _value.healthPagePINInputTime
          : healthPagePINInputTime // ignore: cast_nullable_to_non_nullable
              as String?,
      pinInputTries: pinInputTries == freezed
          ? _value.pinInputTries
          : pinInputTries // ignore: cast_nullable_to_non_nullable
              as int?,
      maxTryTime: maxTryTime == freezed
          ? _value.maxTryTime
          : maxTryTime // ignore: cast_nullable_to_non_nullable
              as String?,
      pinVerified: pinVerified == freezed
          ? _value.pinVerified
          : pinVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      resumeTimer: resumeTimer == freezed
          ? _value.resumeTimer
          : resumeTimer // ignore: cast_nullable_to_non_nullable
              as bool?,
      groupState: groupState == freezed
          ? _value.groupState
          : groupState // ignore: cast_nullable_to_non_nullable
              as GroupState?,
      channelMembersState: channelMembersState == freezed
          ? _value.channelMembersState
          : channelMembersState // ignore: cast_nullable_to_non_nullable
              as ChannelMembersState?,
      screeningToolsState: screeningToolsState == freezed
          ? _value.screeningToolsState
          : screeningToolsState // ignore: cast_nullable_to_non_nullable
              as ScreeningToolsState?,
      appointmentState: appointmentState == freezed
          ? _value.appointmentState
          : appointmentState // ignore: cast_nullable_to_non_nullable
              as AppointmentState?,
      inactiveTime: inactiveTime == freezed
          ? _value.inactiveTime
          : inactiveTime // ignore: cast_nullable_to_non_nullable
              as String?,
      resumeWithPin: resumeWithPin == freezed
          ? _value.resumeWithPin
          : resumeWithPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      availableSurveysList: availableSurveysList == freezed
          ? _value.availableSurveysList
          : availableSurveysList // ignore: cast_nullable_to_non_nullable
              as List<Survey>?,
    ));
  }

  @override
  $FAQsContentStateCopyWith<$Res>? get profileFAQsContentState {
    if (_value.profileFAQsContentState == null) {
      return null;
    }

    return $FAQsContentStateCopyWith<$Res>(_value.profileFAQsContentState!,
        (value) {
      return _then(_value.copyWith(profileFAQsContentState: value));
    });
  }

  @override
  $GroupStateCopyWith<$Res>? get groupState {
    if (_value.groupState == null) {
      return null;
    }

    return $GroupStateCopyWith<$Res>(_value.groupState!, (value) {
      return _then(_value.copyWith(groupState: value));
    });
  }

  @override
  $ChannelMembersStateCopyWith<$Res>? get channelMembersState {
    if (_value.channelMembersState == null) {
      return null;
    }

    return $ChannelMembersStateCopyWith<$Res>(_value.channelMembersState!,
        (value) {
      return _then(_value.copyWith(channelMembersState: value));
    });
  }

  @override
  $ScreeningToolsStateCopyWith<$Res>? get screeningToolsState {
    if (_value.screeningToolsState == null) {
      return null;
    }

    return $ScreeningToolsStateCopyWith<$Res>(_value.screeningToolsState!,
        (value) {
      return _then(_value.copyWith(screeningToolsState: value));
    });
  }

  @override
  $AppointmentStateCopyWith<$Res>? get appointmentState {
    if (_value.appointmentState == null) {
      return null;
    }

    return $AppointmentStateCopyWith<$Res>(_value.appointmentState!, (value) {
      return _then(_value.copyWith(appointmentState: value));
    });
  }
}

/// @nodoc
abstract class _$MiscStateCopyWith<$Res> implements $MiscStateCopyWith<$Res> {
  factory _$MiscStateCopyWith(
          _MiscState value, $Res Function(_MiscState) then) =
      __$MiscStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(defaultValue: AppRoutes.phoneLogin)
          String initialRoute,
      List<dynamic>? libraryListItems,
      FAQsContentState? profileFAQsContentState,
      String? healthPagePINInputTime,
      int? pinInputTries,
      String? maxTryTime,
      bool? pinVerified,
      bool? resumeTimer,
      GroupState? groupState,
      ChannelMembersState? channelMembersState,
      ScreeningToolsState? screeningToolsState,
      @JsonKey(name: 'fetchClientAppointments')
          AppointmentState? appointmentState,
      String? inactiveTime,
      bool? resumeWithPin,
      List<Survey>? availableSurveysList});

  @override
  $FAQsContentStateCopyWith<$Res>? get profileFAQsContentState;
  @override
  $GroupStateCopyWith<$Res>? get groupState;
  @override
  $ChannelMembersStateCopyWith<$Res>? get channelMembersState;
  @override
  $ScreeningToolsStateCopyWith<$Res>? get screeningToolsState;
  @override
  $AppointmentStateCopyWith<$Res>? get appointmentState;
}

/// @nodoc
class __$MiscStateCopyWithImpl<$Res> extends _$MiscStateCopyWithImpl<$Res>
    implements _$MiscStateCopyWith<$Res> {
  __$MiscStateCopyWithImpl(_MiscState _value, $Res Function(_MiscState) _then)
      : super(_value, (v) => _then(v as _MiscState));

  @override
  _MiscState get _value => super._value as _MiscState;

  @override
  $Res call({
    Object? initialRoute = freezed,
    Object? libraryListItems = freezed,
    Object? profileFAQsContentState = freezed,
    Object? healthPagePINInputTime = freezed,
    Object? pinInputTries = freezed,
    Object? maxTryTime = freezed,
    Object? pinVerified = freezed,
    Object? resumeTimer = freezed,
    Object? groupState = freezed,
    Object? channelMembersState = freezed,
    Object? screeningToolsState = freezed,
    Object? appointmentState = freezed,
    Object? inactiveTime = freezed,
    Object? resumeWithPin = freezed,
    Object? availableSurveysList = freezed,
  }) {
    return _then(_MiscState(
      initialRoute: initialRoute == freezed
          ? _value.initialRoute
          : initialRoute // ignore: cast_nullable_to_non_nullable
              as String,
      libraryListItems: libraryListItems == freezed
          ? _value.libraryListItems
          : libraryListItems // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      profileFAQsContentState: profileFAQsContentState == freezed
          ? _value.profileFAQsContentState
          : profileFAQsContentState // ignore: cast_nullable_to_non_nullable
              as FAQsContentState?,
      healthPagePINInputTime: healthPagePINInputTime == freezed
          ? _value.healthPagePINInputTime
          : healthPagePINInputTime // ignore: cast_nullable_to_non_nullable
              as String?,
      pinInputTries: pinInputTries == freezed
          ? _value.pinInputTries
          : pinInputTries // ignore: cast_nullable_to_non_nullable
              as int?,
      maxTryTime: maxTryTime == freezed
          ? _value.maxTryTime
          : maxTryTime // ignore: cast_nullable_to_non_nullable
              as String?,
      pinVerified: pinVerified == freezed
          ? _value.pinVerified
          : pinVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      resumeTimer: resumeTimer == freezed
          ? _value.resumeTimer
          : resumeTimer // ignore: cast_nullable_to_non_nullable
              as bool?,
      groupState: groupState == freezed
          ? _value.groupState
          : groupState // ignore: cast_nullable_to_non_nullable
              as GroupState?,
      channelMembersState: channelMembersState == freezed
          ? _value.channelMembersState
          : channelMembersState // ignore: cast_nullable_to_non_nullable
              as ChannelMembersState?,
      screeningToolsState: screeningToolsState == freezed
          ? _value.screeningToolsState
          : screeningToolsState // ignore: cast_nullable_to_non_nullable
              as ScreeningToolsState?,
      appointmentState: appointmentState == freezed
          ? _value.appointmentState
          : appointmentState // ignore: cast_nullable_to_non_nullable
              as AppointmentState?,
      inactiveTime: inactiveTime == freezed
          ? _value.inactiveTime
          : inactiveTime // ignore: cast_nullable_to_non_nullable
              as String?,
      resumeWithPin: resumeWithPin == freezed
          ? _value.resumeWithPin
          : resumeWithPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      availableSurveysList: availableSurveysList == freezed
          ? _value.availableSurveysList
          : availableSurveysList // ignore: cast_nullable_to_non_nullable
              as List<Survey>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MiscState implements _MiscState {
  _$_MiscState(
      {@JsonKey(defaultValue: AppRoutes.phoneLogin) required this.initialRoute,
      this.libraryListItems,
      this.profileFAQsContentState,
      this.healthPagePINInputTime,
      this.pinInputTries,
      this.maxTryTime,
      this.pinVerified,
      this.resumeTimer,
      this.groupState,
      this.channelMembersState,
      this.screeningToolsState,
      @JsonKey(name: 'fetchClientAppointments') this.appointmentState,
      this.inactiveTime,
      this.resumeWithPin,
      this.availableSurveysList});

  factory _$_MiscState.fromJson(Map<String, dynamic> json) =>
      _$$_MiscStateFromJson(json);

  @override
  @JsonKey(defaultValue: AppRoutes.phoneLogin)
  final String initialRoute;
  @override
  final List<dynamic>? libraryListItems;
  @override
  final FAQsContentState? profileFAQsContentState;
  @override
  final String? healthPagePINInputTime;
  @override
  final int? pinInputTries;
  @override
  final String? maxTryTime;
  @override
  final bool? pinVerified;
  @override
  final bool? resumeTimer;
  @override
  final GroupState? groupState;
  @override
  final ChannelMembersState? channelMembersState;
  @override
  final ScreeningToolsState? screeningToolsState;
  @override
  @JsonKey(name: 'fetchClientAppointments')
  final AppointmentState? appointmentState;
  @override
  final String? inactiveTime;
  @override
  final bool? resumeWithPin;
  @override
  final List<Survey>? availableSurveysList;

  @override
  String toString() {
    return 'MiscState(initialRoute: $initialRoute, libraryListItems: $libraryListItems, profileFAQsContentState: $profileFAQsContentState, healthPagePINInputTime: $healthPagePINInputTime, pinInputTries: $pinInputTries, maxTryTime: $maxTryTime, pinVerified: $pinVerified, resumeTimer: $resumeTimer, groupState: $groupState, channelMembersState: $channelMembersState, screeningToolsState: $screeningToolsState, appointmentState: $appointmentState, inactiveTime: $inactiveTime, resumeWithPin: $resumeWithPin, availableSurveysList: $availableSurveysList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MiscState &&
            const DeepCollectionEquality()
                .equals(other.initialRoute, initialRoute) &&
            const DeepCollectionEquality()
                .equals(other.libraryListItems, libraryListItems) &&
            const DeepCollectionEquality().equals(
                other.profileFAQsContentState, profileFAQsContentState) &&
            const DeepCollectionEquality()
                .equals(other.healthPagePINInputTime, healthPagePINInputTime) &&
            const DeepCollectionEquality()
                .equals(other.pinInputTries, pinInputTries) &&
            const DeepCollectionEquality()
                .equals(other.maxTryTime, maxTryTime) &&
            const DeepCollectionEquality()
                .equals(other.pinVerified, pinVerified) &&
            const DeepCollectionEquality()
                .equals(other.resumeTimer, resumeTimer) &&
            const DeepCollectionEquality()
                .equals(other.groupState, groupState) &&
            const DeepCollectionEquality()
                .equals(other.channelMembersState, channelMembersState) &&
            const DeepCollectionEquality()
                .equals(other.screeningToolsState, screeningToolsState) &&
            const DeepCollectionEquality()
                .equals(other.appointmentState, appointmentState) &&
            const DeepCollectionEquality()
                .equals(other.inactiveTime, inactiveTime) &&
            const DeepCollectionEquality()
                .equals(other.resumeWithPin, resumeWithPin) &&
            const DeepCollectionEquality()
                .equals(other.availableSurveysList, availableSurveysList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(initialRoute),
      const DeepCollectionEquality().hash(libraryListItems),
      const DeepCollectionEquality().hash(profileFAQsContentState),
      const DeepCollectionEquality().hash(healthPagePINInputTime),
      const DeepCollectionEquality().hash(pinInputTries),
      const DeepCollectionEquality().hash(maxTryTime),
      const DeepCollectionEquality().hash(pinVerified),
      const DeepCollectionEquality().hash(resumeTimer),
      const DeepCollectionEquality().hash(groupState),
      const DeepCollectionEquality().hash(channelMembersState),
      const DeepCollectionEquality().hash(screeningToolsState),
      const DeepCollectionEquality().hash(appointmentState),
      const DeepCollectionEquality().hash(inactiveTime),
      const DeepCollectionEquality().hash(resumeWithPin),
      const DeepCollectionEquality().hash(availableSurveysList));

  @JsonKey(ignore: true)
  @override
  _$MiscStateCopyWith<_MiscState> get copyWith =>
      __$MiscStateCopyWithImpl<_MiscState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MiscStateToJson(this);
  }
}

abstract class _MiscState implements MiscState {
  factory _MiscState(
      {@JsonKey(defaultValue: AppRoutes.phoneLogin)
          required String initialRoute,
      List<dynamic>? libraryListItems,
      FAQsContentState? profileFAQsContentState,
      String? healthPagePINInputTime,
      int? pinInputTries,
      String? maxTryTime,
      bool? pinVerified,
      bool? resumeTimer,
      GroupState? groupState,
      ChannelMembersState? channelMembersState,
      ScreeningToolsState? screeningToolsState,
      @JsonKey(name: 'fetchClientAppointments')
          AppointmentState? appointmentState,
      String? inactiveTime,
      bool? resumeWithPin,
      List<Survey>? availableSurveysList}) = _$_MiscState;

  factory _MiscState.fromJson(Map<String, dynamic> json) =
      _$_MiscState.fromJson;

  @override
  @JsonKey(defaultValue: AppRoutes.phoneLogin)
  String get initialRoute;
  @override
  List<dynamic>? get libraryListItems;
  @override
  FAQsContentState? get profileFAQsContentState;
  @override
  String? get healthPagePINInputTime;
  @override
  int? get pinInputTries;
  @override
  String? get maxTryTime;
  @override
  bool? get pinVerified;
  @override
  bool? get resumeTimer;
  @override
  GroupState? get groupState;
  @override
  ChannelMembersState? get channelMembersState;
  @override
  ScreeningToolsState? get screeningToolsState;
  @override
  @JsonKey(name: 'fetchClientAppointments')
  AppointmentState? get appointmentState;
  @override
  String? get inactiveTime;
  @override
  bool? get resumeWithPin;
  @override
  List<Survey>? get availableSurveysList;
  @override
  @JsonKey(ignore: true)
  _$MiscStateCopyWith<_MiscState> get copyWith =>
      throw _privateConstructorUsedError;
}
