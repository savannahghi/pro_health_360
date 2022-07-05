// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notifications_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationsResponse _$NotificationsResponseFromJson(
    Map<String, dynamic> json) {
  return _NotificationsResponse.fromJson(json);
}

/// @nodoc
mixin _$NotificationsResponse {
  @JsonKey(name: 'fetchNotifications')
  NotificationsData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationsResponseCopyWith<NotificationsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsResponseCopyWith<$Res> {
  factory $NotificationsResponseCopyWith(NotificationsResponse value,
          $Res Function(NotificationsResponse) then) =
      _$NotificationsResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'fetchNotifications') NotificationsData data});

  $NotificationsDataCopyWith<$Res> get data;
}

/// @nodoc
class _$NotificationsResponseCopyWithImpl<$Res>
    implements $NotificationsResponseCopyWith<$Res> {
  _$NotificationsResponseCopyWithImpl(this._value, this._then);

  final NotificationsResponse _value;
  // ignore: unused_field
  final $Res Function(NotificationsResponse) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NotificationsData,
    ));
  }

  @override
  $NotificationsDataCopyWith<$Res> get data {
    return $NotificationsDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$$_NotificationsResponseCopyWith<$Res>
    implements $NotificationsResponseCopyWith<$Res> {
  factory _$$_NotificationsResponseCopyWith(_$_NotificationsResponse value,
          $Res Function(_$_NotificationsResponse) then) =
      __$$_NotificationsResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'fetchNotifications') NotificationsData data});

  @override
  $NotificationsDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$_NotificationsResponseCopyWithImpl<$Res>
    extends _$NotificationsResponseCopyWithImpl<$Res>
    implements _$$_NotificationsResponseCopyWith<$Res> {
  __$$_NotificationsResponseCopyWithImpl(_$_NotificationsResponse _value,
      $Res Function(_$_NotificationsResponse) _then)
      : super(_value, (v) => _then(v as _$_NotificationsResponse));

  @override
  _$_NotificationsResponse get _value =>
      super._value as _$_NotificationsResponse;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_NotificationsResponse(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NotificationsData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationsResponse implements _NotificationsResponse {
  _$_NotificationsResponse(
      {@JsonKey(name: 'fetchNotifications') required this.data});

  factory _$_NotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationsResponseFromJson(json);

  @override
  @JsonKey(name: 'fetchNotifications')
  final NotificationsData data;

  @override
  String toString() {
    return 'NotificationsResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationsResponse &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_NotificationsResponseCopyWith<_$_NotificationsResponse> get copyWith =>
      __$$_NotificationsResponseCopyWithImpl<_$_NotificationsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationsResponseToJson(this);
  }
}

abstract class _NotificationsResponse implements NotificationsResponse {
  factory _NotificationsResponse(
      {@JsonKey(name: 'fetchNotifications')
          required final NotificationsData data}) = _$_NotificationsResponse;

  factory _NotificationsResponse.fromJson(Map<String, dynamic> json) =
      _$_NotificationsResponse.fromJson;

  @override
  @JsonKey(name: 'fetchNotifications')
  NotificationsData get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationsResponseCopyWith<_$_NotificationsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationsData _$NotificationsDataFromJson(Map<String, dynamic> json) {
  return _NotificationsData.fromJson(json);
}

/// @nodoc
mixin _$NotificationsData {
  @JsonKey(name: 'notifications')
  List<NotificationDetails> get notifications =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationsDataCopyWith<NotificationsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsDataCopyWith<$Res> {
  factory $NotificationsDataCopyWith(
          NotificationsData value, $Res Function(NotificationsData) then) =
      _$NotificationsDataCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'notifications')
          List<NotificationDetails> notifications});
}

/// @nodoc
class _$NotificationsDataCopyWithImpl<$Res>
    implements $NotificationsDataCopyWith<$Res> {
  _$NotificationsDataCopyWithImpl(this._value, this._then);

  final NotificationsData _value;
  // ignore: unused_field
  final $Res Function(NotificationsData) _then;

  @override
  $Res call({
    Object? notifications = freezed,
  }) {
    return _then(_value.copyWith(
      notifications: notifications == freezed
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationDetails>,
    ));
  }
}

/// @nodoc
abstract class _$$_NotificationsDataCopyWith<$Res>
    implements $NotificationsDataCopyWith<$Res> {
  factory _$$_NotificationsDataCopyWith(_$_NotificationsData value,
          $Res Function(_$_NotificationsData) then) =
      __$$_NotificationsDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'notifications')
          List<NotificationDetails> notifications});
}

/// @nodoc
class __$$_NotificationsDataCopyWithImpl<$Res>
    extends _$NotificationsDataCopyWithImpl<$Res>
    implements _$$_NotificationsDataCopyWith<$Res> {
  __$$_NotificationsDataCopyWithImpl(
      _$_NotificationsData _value, $Res Function(_$_NotificationsData) _then)
      : super(_value, (v) => _then(v as _$_NotificationsData));

  @override
  _$_NotificationsData get _value => super._value as _$_NotificationsData;

  @override
  $Res call({
    Object? notifications = freezed,
  }) {
    return _then(_$_NotificationsData(
      notifications: notifications == freezed
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationDetails>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationsData implements _NotificationsData {
  _$_NotificationsData(
      {@JsonKey(name: 'notifications')
          required final List<NotificationDetails> notifications})
      : _notifications = notifications;

  factory _$_NotificationsData.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationsDataFromJson(json);

  final List<NotificationDetails> _notifications;
  @override
  @JsonKey(name: 'notifications')
  List<NotificationDetails> get notifications {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  String toString() {
    return 'NotificationsData(notifications: $notifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationsData &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_notifications));

  @JsonKey(ignore: true)
  @override
  _$$_NotificationsDataCopyWith<_$_NotificationsData> get copyWith =>
      __$$_NotificationsDataCopyWithImpl<_$_NotificationsData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationsDataToJson(this);
  }
}

abstract class _NotificationsData implements NotificationsData {
  factory _NotificationsData(
          {@JsonKey(name: 'notifications')
              required final List<NotificationDetails> notifications}) =
      _$_NotificationsData;

  factory _NotificationsData.fromJson(Map<String, dynamic> json) =
      _$_NotificationsData.fromJson;

  @override
  @JsonKey(name: 'notifications')
  List<NotificationDetails> get notifications =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationsDataCopyWith<_$_NotificationsData> get copyWith =>
      throw _privateConstructorUsedError;
}
