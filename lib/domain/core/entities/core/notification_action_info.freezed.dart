// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_action_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NotificationActionInfoTearOff {
  const _$NotificationActionInfoTearOff();

  _NotificationActionInfo call(
      {required String? actionTitle,
      required String? route,
      dynamic arguments = null}) {
    return _NotificationActionInfo(
      actionTitle: actionTitle,
      route: route,
      arguments: arguments,
    );
  }
}

/// @nodoc
const $NotificationActionInfo = _$NotificationActionInfoTearOff();

/// @nodoc
mixin _$NotificationActionInfo {
// The title string on the action button
  String? get actionTitle =>
      throw _privateConstructorUsedError; // The route to navigate to
  String? get route =>
      throw _privateConstructorUsedError; // Any route arguments that may need to be passed while navigating
  dynamic get arguments => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationActionInfoCopyWith<NotificationActionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationActionInfoCopyWith<$Res> {
  factory $NotificationActionInfoCopyWith(NotificationActionInfo value,
          $Res Function(NotificationActionInfo) then) =
      _$NotificationActionInfoCopyWithImpl<$Res>;
  $Res call({String? actionTitle, String? route, dynamic arguments});
}

/// @nodoc
class _$NotificationActionInfoCopyWithImpl<$Res>
    implements $NotificationActionInfoCopyWith<$Res> {
  _$NotificationActionInfoCopyWithImpl(this._value, this._then);

  final NotificationActionInfo _value;
  // ignore: unused_field
  final $Res Function(NotificationActionInfo) _then;

  @override
  $Res call({
    Object? actionTitle = freezed,
    Object? route = freezed,
    Object? arguments = freezed,
  }) {
    return _then(_value.copyWith(
      actionTitle: actionTitle == freezed
          ? _value.actionTitle
          : actionTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      route: route == freezed
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      arguments: arguments == freezed
          ? _value.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$NotificationActionInfoCopyWith<$Res>
    implements $NotificationActionInfoCopyWith<$Res> {
  factory _$NotificationActionInfoCopyWith(_NotificationActionInfo value,
          $Res Function(_NotificationActionInfo) then) =
      __$NotificationActionInfoCopyWithImpl<$Res>;
  @override
  $Res call({String? actionTitle, String? route, dynamic arguments});
}

/// @nodoc
class __$NotificationActionInfoCopyWithImpl<$Res>
    extends _$NotificationActionInfoCopyWithImpl<$Res>
    implements _$NotificationActionInfoCopyWith<$Res> {
  __$NotificationActionInfoCopyWithImpl(_NotificationActionInfo _value,
      $Res Function(_NotificationActionInfo) _then)
      : super(_value, (v) => _then(v as _NotificationActionInfo));

  @override
  _NotificationActionInfo get _value => super._value as _NotificationActionInfo;

  @override
  $Res call({
    Object? actionTitle = freezed,
    Object? route = freezed,
    Object? arguments = freezed,
  }) {
    return _then(_NotificationActionInfo(
      actionTitle: actionTitle == freezed
          ? _value.actionTitle
          : actionTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      route: route == freezed
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      arguments: arguments == freezed
          ? _value.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_NotificationActionInfo implements _NotificationActionInfo {
  _$_NotificationActionInfo(
      {required this.actionTitle, required this.route, this.arguments = null});

  @override // The title string on the action button
  final String? actionTitle;
  @override // The route to navigate to
  final String? route;
  @JsonKey()
  @override // Any route arguments that may need to be passed while navigating
  final dynamic arguments;

  @override
  String toString() {
    return 'NotificationActionInfo(actionTitle: $actionTitle, route: $route, arguments: $arguments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationActionInfo &&
            const DeepCollectionEquality()
                .equals(other.actionTitle, actionTitle) &&
            const DeepCollectionEquality().equals(other.route, route) &&
            const DeepCollectionEquality().equals(other.arguments, arguments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(actionTitle),
      const DeepCollectionEquality().hash(route),
      const DeepCollectionEquality().hash(arguments));

  @JsonKey(ignore: true)
  @override
  _$NotificationActionInfoCopyWith<_NotificationActionInfo> get copyWith =>
      __$NotificationActionInfoCopyWithImpl<_NotificationActionInfo>(
          this, _$identity);
}

abstract class _NotificationActionInfo implements NotificationActionInfo {
  factory _NotificationActionInfo(
      {required String? actionTitle,
      required String? route,
      dynamic arguments}) = _$_NotificationActionInfo;

  @override // The title string on the action button
  String? get actionTitle;
  @override // The route to navigate to
  String? get route;
  @override // Any route arguments that may need to be passed while navigating
  dynamic get arguments;
  @override
  @JsonKey(ignore: true)
  _$NotificationActionInfoCopyWith<_NotificationActionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
