// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'appointments_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppointmentState _$AppointmentStateFromJson(Map<String, dynamic> json) {
  return _AppointmentState.fromJson(json);
}

/// @nodoc
class _$AppointmentStateTearOff {
  const _$AppointmentStateTearOff();

  _AppointmentState call(
      {@JsonKey(name: 'appointments') List<Appointment>? appointments,
      bool? errorFetchingAppointments}) {
    return _AppointmentState(
      appointments: appointments,
      errorFetchingAppointments: errorFetchingAppointments,
    );
  }

  AppointmentState fromJson(Map<String, Object?> json) {
    return AppointmentState.fromJson(json);
  }
}

/// @nodoc
const $AppointmentState = _$AppointmentStateTearOff();

/// @nodoc
mixin _$AppointmentState {
  @JsonKey(name: 'appointments')
  List<Appointment>? get appointments => throw _privateConstructorUsedError;
  bool? get errorFetchingAppointments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppointmentStateCopyWith<AppointmentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentStateCopyWith<$Res> {
  factory $AppointmentStateCopyWith(
          AppointmentState value, $Res Function(AppointmentState) then) =
      _$AppointmentStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'appointments') List<Appointment>? appointments,
      bool? errorFetchingAppointments});
}

/// @nodoc
class _$AppointmentStateCopyWithImpl<$Res>
    implements $AppointmentStateCopyWith<$Res> {
  _$AppointmentStateCopyWithImpl(this._value, this._then);

  final AppointmentState _value;
  // ignore: unused_field
  final $Res Function(AppointmentState) _then;

  @override
  $Res call({
    Object? appointments = freezed,
    Object? errorFetchingAppointments = freezed,
  }) {
    return _then(_value.copyWith(
      appointments: appointments == freezed
          ? _value.appointments
          : appointments // ignore: cast_nullable_to_non_nullable
              as List<Appointment>?,
      errorFetchingAppointments: errorFetchingAppointments == freezed
          ? _value.errorFetchingAppointments
          : errorFetchingAppointments // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$AppointmentStateCopyWith<$Res>
    implements $AppointmentStateCopyWith<$Res> {
  factory _$AppointmentStateCopyWith(
          _AppointmentState value, $Res Function(_AppointmentState) then) =
      __$AppointmentStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'appointments') List<Appointment>? appointments,
      bool? errorFetchingAppointments});
}

/// @nodoc
class __$AppointmentStateCopyWithImpl<$Res>
    extends _$AppointmentStateCopyWithImpl<$Res>
    implements _$AppointmentStateCopyWith<$Res> {
  __$AppointmentStateCopyWithImpl(
      _AppointmentState _value, $Res Function(_AppointmentState) _then)
      : super(_value, (v) => _then(v as _AppointmentState));

  @override
  _AppointmentState get _value => super._value as _AppointmentState;

  @override
  $Res call({
    Object? appointments = freezed,
    Object? errorFetchingAppointments = freezed,
  }) {
    return _then(_AppointmentState(
      appointments: appointments == freezed
          ? _value.appointments
          : appointments // ignore: cast_nullable_to_non_nullable
              as List<Appointment>?,
      errorFetchingAppointments: errorFetchingAppointments == freezed
          ? _value.errorFetchingAppointments
          : errorFetchingAppointments // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppointmentState implements _AppointmentState {
  _$_AppointmentState(
      {@JsonKey(name: 'appointments') this.appointments,
      this.errorFetchingAppointments});

  factory _$_AppointmentState.fromJson(Map<String, dynamic> json) =>
      _$$_AppointmentStateFromJson(json);

  @override
  @JsonKey(name: 'appointments')
  final List<Appointment>? appointments;
  @override
  final bool? errorFetchingAppointments;

  @override
  String toString() {
    return 'AppointmentState(appointments: $appointments, errorFetchingAppointments: $errorFetchingAppointments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppointmentState &&
            const DeepCollectionEquality()
                .equals(other.appointments, appointments) &&
            const DeepCollectionEquality().equals(
                other.errorFetchingAppointments, errorFetchingAppointments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(appointments),
      const DeepCollectionEquality().hash(errorFetchingAppointments));

  @JsonKey(ignore: true)
  @override
  _$AppointmentStateCopyWith<_AppointmentState> get copyWith =>
      __$AppointmentStateCopyWithImpl<_AppointmentState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppointmentStateToJson(this);
  }
}

abstract class _AppointmentState implements AppointmentState {
  factory _AppointmentState(
      {@JsonKey(name: 'appointments') List<Appointment>? appointments,
      bool? errorFetchingAppointments}) = _$_AppointmentState;

  factory _AppointmentState.fromJson(Map<String, dynamic> json) =
      _$_AppointmentState.fromJson;

  @override
  @JsonKey(name: 'appointments')
  List<Appointment>? get appointments;
  @override
  bool? get errorFetchingAppointments;
  @override
  @JsonKey(ignore: true)
  _$AppointmentStateCopyWith<_AppointmentState> get copyWith =>
      throw _privateConstructorUsedError;
}
