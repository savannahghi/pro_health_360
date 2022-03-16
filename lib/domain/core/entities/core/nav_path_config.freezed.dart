// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nav_path_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppNavConfigTearOff {
  const _$AppNavConfigTearOff();

  _AppNavConfig call(
      {required String nextRoute,
      required String previousRoute,
      dynamic arguments = null}) {
    return _AppNavConfig(
      nextRoute: nextRoute,
      previousRoute: previousRoute,
      arguments: arguments,
    );
  }
}

/// @nodoc
const $AppNavConfig = _$AppNavConfigTearOff();

/// @nodoc
mixin _$AppNavConfig {
// The next route to navigate to
  String get nextRoute =>
      throw _privateConstructorUsedError; // The previous route to navigate to
  String get previousRoute =>
      throw _privateConstructorUsedError; // Any route arguments that may need to be passed while navigating
  dynamic get arguments => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppNavConfigCopyWith<AppNavConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppNavConfigCopyWith<$Res> {
  factory $AppNavConfigCopyWith(
          AppNavConfig value, $Res Function(AppNavConfig) then) =
      _$AppNavConfigCopyWithImpl<$Res>;
  $Res call({String nextRoute, String previousRoute, dynamic arguments});
}

/// @nodoc
class _$AppNavConfigCopyWithImpl<$Res> implements $AppNavConfigCopyWith<$Res> {
  _$AppNavConfigCopyWithImpl(this._value, this._then);

  final AppNavConfig _value;
  // ignore: unused_field
  final $Res Function(AppNavConfig) _then;

  @override
  $Res call({
    Object? nextRoute = freezed,
    Object? previousRoute = freezed,
    Object? arguments = freezed,
  }) {
    return _then(_value.copyWith(
      nextRoute: nextRoute == freezed
          ? _value.nextRoute
          : nextRoute // ignore: cast_nullable_to_non_nullable
              as String,
      previousRoute: previousRoute == freezed
          ? _value.previousRoute
          : previousRoute // ignore: cast_nullable_to_non_nullable
              as String,
      arguments: arguments == freezed
          ? _value.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$AppNavConfigCopyWith<$Res>
    implements $AppNavConfigCopyWith<$Res> {
  factory _$AppNavConfigCopyWith(
          _AppNavConfig value, $Res Function(_AppNavConfig) then) =
      __$AppNavConfigCopyWithImpl<$Res>;
  @override
  $Res call({String nextRoute, String previousRoute, dynamic arguments});
}

/// @nodoc
class __$AppNavConfigCopyWithImpl<$Res> extends _$AppNavConfigCopyWithImpl<$Res>
    implements _$AppNavConfigCopyWith<$Res> {
  __$AppNavConfigCopyWithImpl(
      _AppNavConfig _value, $Res Function(_AppNavConfig) _then)
      : super(_value, (v) => _then(v as _AppNavConfig));

  @override
  _AppNavConfig get _value => super._value as _AppNavConfig;

  @override
  $Res call({
    Object? nextRoute = freezed,
    Object? previousRoute = freezed,
    Object? arguments = freezed,
  }) {
    return _then(_AppNavConfig(
      nextRoute: nextRoute == freezed
          ? _value.nextRoute
          : nextRoute // ignore: cast_nullable_to_non_nullable
              as String,
      previousRoute: previousRoute == freezed
          ? _value.previousRoute
          : previousRoute // ignore: cast_nullable_to_non_nullable
              as String,
      arguments: arguments == freezed
          ? _value.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_AppNavConfig implements _AppNavConfig {
  _$_AppNavConfig(
      {required this.nextRoute,
      required this.previousRoute,
      this.arguments = null});

  @override // The next route to navigate to
  final String nextRoute;
  @override // The previous route to navigate to
  final String previousRoute;
  @JsonKey()
  @override // Any route arguments that may need to be passed while navigating
  final dynamic arguments;

  @override
  String toString() {
    return 'AppNavConfig(nextRoute: $nextRoute, previousRoute: $previousRoute, arguments: $arguments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppNavConfig &&
            const DeepCollectionEquality().equals(other.nextRoute, nextRoute) &&
            const DeepCollectionEquality()
                .equals(other.previousRoute, previousRoute) &&
            const DeepCollectionEquality().equals(other.arguments, arguments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(nextRoute),
      const DeepCollectionEquality().hash(previousRoute),
      const DeepCollectionEquality().hash(arguments));

  @JsonKey(ignore: true)
  @override
  _$AppNavConfigCopyWith<_AppNavConfig> get copyWith =>
      __$AppNavConfigCopyWithImpl<_AppNavConfig>(this, _$identity);
}

abstract class _AppNavConfig implements AppNavConfig {
  factory _AppNavConfig(
      {required String nextRoute,
      required String previousRoute,
      dynamic arguments}) = _$_AppNavConfig;

  @override // The next route to navigate to
  String get nextRoute;
  @override // The previous route to navigate to
  String get previousRoute;
  @override // Any route arguments that may need to be passed while navigating
  dynamic get arguments;
  @override
  @JsonKey(ignore: true)
  _$AppNavConfigCopyWith<_AppNavConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
