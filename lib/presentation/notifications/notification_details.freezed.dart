// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'notification_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationDetails _$NotificationDetailsFromJson(Map<String, dynamic> json) {
  return _NotificationDetails.fromJson(json);
}

/// @nodoc
class _$NotificationDetailsTearOff {
  const _$NotificationDetailsTearOff();

  _NotificationDetails call(
      {@JsonKey(name: 'svgPath')
          required String svgPath,
      @JsonKey(name: 'description')
          required String description,
      @JsonKey(name: 'date')
          required String date,
      @JsonKey(name: 'calendar')
          bool? calendar,
      @JsonKey(name: 'isAlternateNotification')
          bool? isAlternateNotification}) {
    return _NotificationDetails(
      svgPath: svgPath,
      description: description,
      date: date,
      calendar: calendar,
      isAlternateNotification: isAlternateNotification,
    );
  }

  NotificationDetails fromJson(Map<String, Object> json) {
    return NotificationDetails.fromJson(json);
  }
}

/// @nodoc
const $NotificationDetails = _$NotificationDetailsTearOff();

/// @nodoc
mixin _$NotificationDetails {
  @JsonKey(name: 'svgPath')
  String get svgPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'calendar')
  bool? get calendar => throw _privateConstructorUsedError;
  @JsonKey(name: 'isAlternateNotification')
  bool? get isAlternateNotification => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationDetailsCopyWith<NotificationDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDetailsCopyWith<$Res> {
  factory $NotificationDetailsCopyWith(
          NotificationDetails value, $Res Function(NotificationDetails) then) =
      _$NotificationDetailsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'svgPath') String svgPath,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'calendar') bool? calendar,
      @JsonKey(name: 'isAlternateNotification') bool? isAlternateNotification});
}

/// @nodoc
class _$NotificationDetailsCopyWithImpl<$Res>
    implements $NotificationDetailsCopyWith<$Res> {
  _$NotificationDetailsCopyWithImpl(this._value, this._then);

  final NotificationDetails _value;
  // ignore: unused_field
  final $Res Function(NotificationDetails) _then;

  @override
  $Res call({
    Object? svgPath = freezed,
    Object? description = freezed,
    Object? date = freezed,
    Object? calendar = freezed,
    Object? isAlternateNotification = freezed,
  }) {
    return _then(_value.copyWith(
      svgPath: svgPath == freezed
          ? _value.svgPath
          : svgPath // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      calendar: calendar == freezed
          ? _value.calendar
          : calendar // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAlternateNotification: isAlternateNotification == freezed
          ? _value.isAlternateNotification
          : isAlternateNotification // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$NotificationDetailsCopyWith<$Res>
    implements $NotificationDetailsCopyWith<$Res> {
  factory _$NotificationDetailsCopyWith(_NotificationDetails value,
          $Res Function(_NotificationDetails) then) =
      __$NotificationDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'svgPath') String svgPath,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'calendar') bool? calendar,
      @JsonKey(name: 'isAlternateNotification') bool? isAlternateNotification});
}

/// @nodoc
class __$NotificationDetailsCopyWithImpl<$Res>
    extends _$NotificationDetailsCopyWithImpl<$Res>
    implements _$NotificationDetailsCopyWith<$Res> {
  __$NotificationDetailsCopyWithImpl(
      _NotificationDetails _value, $Res Function(_NotificationDetails) _then)
      : super(_value, (v) => _then(v as _NotificationDetails));

  @override
  _NotificationDetails get _value => super._value as _NotificationDetails;

  @override
  $Res call({
    Object? svgPath = freezed,
    Object? description = freezed,
    Object? date = freezed,
    Object? calendar = freezed,
    Object? isAlternateNotification = freezed,
  }) {
    return _then(_NotificationDetails(
      svgPath: svgPath == freezed
          ? _value.svgPath
          : svgPath // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      calendar: calendar == freezed
          ? _value.calendar
          : calendar // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAlternateNotification: isAlternateNotification == freezed
          ? _value.isAlternateNotification
          : isAlternateNotification // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationDetails implements _NotificationDetails {
  _$_NotificationDetails(
      {@JsonKey(name: 'svgPath') required this.svgPath,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'date') required this.date,
      @JsonKey(name: 'calendar') this.calendar,
      @JsonKey(name: 'isAlternateNotification') this.isAlternateNotification});

  factory _$_NotificationDetails.fromJson(Map<String, dynamic> json) =>
      _$_$_NotificationDetailsFromJson(json);

  @override
  @JsonKey(name: 'svgPath')
  final String svgPath;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'date')
  final String date;
  @override
  @JsonKey(name: 'calendar')
  final bool? calendar;
  @override
  @JsonKey(name: 'isAlternateNotification')
  final bool? isAlternateNotification;

  @override
  String toString() {
    return 'NotificationDetails(svgPath: $svgPath, description: $description, date: $date, calendar: $calendar, isAlternateNotification: $isAlternateNotification)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NotificationDetails &&
            (identical(other.svgPath, svgPath) ||
                const DeepCollectionEquality()
                    .equals(other.svgPath, svgPath)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.calendar, calendar) ||
                const DeepCollectionEquality()
                    .equals(other.calendar, calendar)) &&
            (identical(
                    other.isAlternateNotification, isAlternateNotification) ||
                const DeepCollectionEquality().equals(
                    other.isAlternateNotification, isAlternateNotification)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(svgPath) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(calendar) ^
      const DeepCollectionEquality().hash(isAlternateNotification);

  @JsonKey(ignore: true)
  @override
  _$NotificationDetailsCopyWith<_NotificationDetails> get copyWith =>
      __$NotificationDetailsCopyWithImpl<_NotificationDetails>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NotificationDetailsToJson(this);
  }
}

abstract class _NotificationDetails implements NotificationDetails {
  factory _NotificationDetails(
      {@JsonKey(name: 'svgPath')
          required String svgPath,
      @JsonKey(name: 'description')
          required String description,
      @JsonKey(name: 'date')
          required String date,
      @JsonKey(name: 'calendar')
          bool? calendar,
      @JsonKey(name: 'isAlternateNotification')
          bool? isAlternateNotification}) = _$_NotificationDetails;

  factory _NotificationDetails.fromJson(Map<String, dynamic> json) =
      _$_NotificationDetails.fromJson;

  @override
  @JsonKey(name: 'svgPath')
  String get svgPath => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'date')
  String get date => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'calendar')
  bool? get calendar => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'isAlternateNotification')
  bool? get isAlternateNotification => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NotificationDetailsCopyWith<_NotificationDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
