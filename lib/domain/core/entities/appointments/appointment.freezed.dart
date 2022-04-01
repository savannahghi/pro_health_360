// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'appointment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Appointment _$AppointmentFromJson(Map<String, dynamic> json) {
  return _Appointment.fromJson(json);
}

/// @nodoc
class _$AppointmentTearOff {
  const _$AppointmentTearOff();

  _Appointment call(
      {@JsonKey(name: 'ID')
          required String? id,
      @JsonKey(name: 'type')
          required String? type,
      @JsonKey(name: 'reason')
          required String? reason,
      @JsonKey(name: 'status', defaultValue: AppointmentStatus.UNKNOWN)
          AppointmentStatus? status,
      @JsonKey(name: 'date')
          required String? date,
      @JsonKey(name: 'start')
          required String? start,
      @JsonKey(name: 'end')
          required String? end,
      @JsonKey(name: 'hasRescheduledAppointment', defaultValue: false)
          required bool pendingReschedule}) {
    return _Appointment(
      id: id,
      type: type,
      reason: reason,
      status: status,
      date: date,
      start: start,
      end: end,
      pendingReschedule: pendingReschedule,
    );
  }

  Appointment fromJson(Map<String, Object?> json) {
    return Appointment.fromJson(json);
  }
}

/// @nodoc
const $Appointment = _$AppointmentTearOff();

/// @nodoc
mixin _$Appointment {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'reason')
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', defaultValue: AppointmentStatus.UNKNOWN)
  AppointmentStatus? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'start')
  String? get start => throw _privateConstructorUsedError;
  @JsonKey(name: 'end')
  String? get end => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasRescheduledAppointment', defaultValue: false)
  bool get pendingReschedule => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppointmentCopyWith<Appointment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentCopyWith<$Res> {
  factory $AppointmentCopyWith(
          Appointment value, $Res Function(Appointment) then) =
      _$AppointmentCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'type')
          String? type,
      @JsonKey(name: 'reason')
          String? reason,
      @JsonKey(name: 'status', defaultValue: AppointmentStatus.UNKNOWN)
          AppointmentStatus? status,
      @JsonKey(name: 'date')
          String? date,
      @JsonKey(name: 'start')
          String? start,
      @JsonKey(name: 'end')
          String? end,
      @JsonKey(name: 'hasRescheduledAppointment', defaultValue: false)
          bool pendingReschedule});
}

/// @nodoc
class _$AppointmentCopyWithImpl<$Res> implements $AppointmentCopyWith<$Res> {
  _$AppointmentCopyWithImpl(this._value, this._then);

  final Appointment _value;
  // ignore: unused_field
  final $Res Function(Appointment) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? reason = freezed,
    Object? status = freezed,
    Object? date = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? pendingReschedule = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String?,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String?,
      pendingReschedule: pendingReschedule == freezed
          ? _value.pendingReschedule
          : pendingReschedule // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AppointmentCopyWith<$Res>
    implements $AppointmentCopyWith<$Res> {
  factory _$AppointmentCopyWith(
          _Appointment value, $Res Function(_Appointment) then) =
      __$AppointmentCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID')
          String? id,
      @JsonKey(name: 'type')
          String? type,
      @JsonKey(name: 'reason')
          String? reason,
      @JsonKey(name: 'status', defaultValue: AppointmentStatus.UNKNOWN)
          AppointmentStatus? status,
      @JsonKey(name: 'date')
          String? date,
      @JsonKey(name: 'start')
          String? start,
      @JsonKey(name: 'end')
          String? end,
      @JsonKey(name: 'hasRescheduledAppointment', defaultValue: false)
          bool pendingReschedule});
}

/// @nodoc
class __$AppointmentCopyWithImpl<$Res> extends _$AppointmentCopyWithImpl<$Res>
    implements _$AppointmentCopyWith<$Res> {
  __$AppointmentCopyWithImpl(
      _Appointment _value, $Res Function(_Appointment) _then)
      : super(_value, (v) => _then(v as _Appointment));

  @override
  _Appointment get _value => super._value as _Appointment;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? reason = freezed,
    Object? status = freezed,
    Object? date = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? pendingReschedule = freezed,
  }) {
    return _then(_Appointment(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String?,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String?,
      pendingReschedule: pendingReschedule == freezed
          ? _value.pendingReschedule
          : pendingReschedule // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Appointment implements _Appointment {
  _$_Appointment(
      {@JsonKey(name: 'ID')
          required this.id,
      @JsonKey(name: 'type')
          required this.type,
      @JsonKey(name: 'reason')
          required this.reason,
      @JsonKey(name: 'status', defaultValue: AppointmentStatus.UNKNOWN)
          this.status,
      @JsonKey(name: 'date')
          required this.date,
      @JsonKey(name: 'start')
          required this.start,
      @JsonKey(name: 'end')
          required this.end,
      @JsonKey(name: 'hasRescheduledAppointment', defaultValue: false)
          required this.pendingReschedule});

  factory _$_Appointment.fromJson(Map<String, dynamic> json) =>
      _$$_AppointmentFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'reason')
  final String? reason;
  @override
  @JsonKey(name: 'status', defaultValue: AppointmentStatus.UNKNOWN)
  final AppointmentStatus? status;
  @override
  @JsonKey(name: 'date')
  final String? date;
  @override
  @JsonKey(name: 'start')
  final String? start;
  @override
  @JsonKey(name: 'end')
  final String? end;
  @override
  @JsonKey(name: 'hasRescheduledAppointment', defaultValue: false)
  final bool pendingReschedule;

  @override
  String toString() {
    return 'Appointment(id: $id, type: $type, reason: $reason, status: $status, date: $date, start: $start, end: $end, pendingReschedule: $pendingReschedule)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Appointment &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.reason, reason) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.start, start) &&
            const DeepCollectionEquality().equals(other.end, end) &&
            const DeepCollectionEquality()
                .equals(other.pendingReschedule, pendingReschedule));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(reason),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(start),
      const DeepCollectionEquality().hash(end),
      const DeepCollectionEquality().hash(pendingReschedule));

  @JsonKey(ignore: true)
  @override
  _$AppointmentCopyWith<_Appointment> get copyWith =>
      __$AppointmentCopyWithImpl<_Appointment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppointmentToJson(this);
  }
}

abstract class _Appointment implements Appointment {
  factory _Appointment(
      {@JsonKey(name: 'ID')
          required String? id,
      @JsonKey(name: 'type')
          required String? type,
      @JsonKey(name: 'reason')
          required String? reason,
      @JsonKey(name: 'status', defaultValue: AppointmentStatus.UNKNOWN)
          AppointmentStatus? status,
      @JsonKey(name: 'date')
          required String? date,
      @JsonKey(name: 'start')
          required String? start,
      @JsonKey(name: 'end')
          required String? end,
      @JsonKey(name: 'hasRescheduledAppointment', defaultValue: false)
          required bool pendingReschedule}) = _$_Appointment;

  factory _Appointment.fromJson(Map<String, dynamic> json) =
      _$_Appointment.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'reason')
  String? get reason;
  @override
  @JsonKey(name: 'status', defaultValue: AppointmentStatus.UNKNOWN)
  AppointmentStatus? get status;
  @override
  @JsonKey(name: 'date')
  String? get date;
  @override
  @JsonKey(name: 'start')
  String? get start;
  @override
  @JsonKey(name: 'end')
  String? get end;
  @override
  @JsonKey(name: 'hasRescheduledAppointment', defaultValue: false)
  bool get pendingReschedule;
  @override
  @JsonKey(ignore: true)
  _$AppointmentCopyWith<_Appointment> get copyWith =>
      throw _privateConstructorUsedError;
}
