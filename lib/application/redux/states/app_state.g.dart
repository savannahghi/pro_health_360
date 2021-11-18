// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppState _$_$_AppStateFromJson(Map<String, dynamic> json) {
  return _$_AppState(
    credentials: json['credentials'] == null
        ? null
        : AuthCredentials.fromJson(json['credentials'] as Map<String, dynamic>),
    userState: json['userState'] == null
        ? null
        : UserState.fromJson(json['userState'] as Map<String, dynamic>),
    connectivityState: json['connectivityState'] == null
        ? null
        : ConnectivityState.fromJson(
            json['connectivityState'] as Map<String, dynamic>),
    userFeedState: json['userFeedState'] == null
        ? null
        : FeedResponsePayload.fromJson(
            json['userFeedState'] as Map<String, dynamic>),
    miscState: json['miscState'] == null
        ? null
        : MiscState.fromJson(json['miscState'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_AppStateToJson(_$_AppState instance) =>
    <String, dynamic>{
      'credentials': instance.credentials,
      'userState': instance.userState,
      'connectivityState': instance.connectivityState,
      'userFeedState': instance.userFeedState,
      'miscState': instance.miscState,
    };

_$_MainAppState _$_$_MainAppStateFromJson(Map<String, dynamic> json) {
  return _$_MainAppState(
    credentials: json['credentials'] == null
        ? null
        : AuthCredentials.fromJson(json['credentials'] as Map<String, dynamic>),
    onboardingState: json['onboardingState'] == null
        ? null
        : OnboardingState.fromJson(
            json['onboardingState'] as Map<String, dynamic>),
    bottomNavigationState: json['bottomNavigationState'] == null
        ? null
        : BottomNavigationState.fromJson(
            json['bottomNavigationState'] as Map<String, dynamic>),
    miscState: json['miscState'] == null
        ? null
        : MiscState.fromJson(json['miscState'] as Map<String, dynamic>),
    clientState: json['clientState'] == null
        ? null
        : ClientState.fromJson(json['clientState'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_MainAppStateToJson(_$_MainAppState instance) =>
    <String, dynamic>{
      'credentials': instance.credentials,
      'onboardingState': instance.onboardingState,
      'bottomNavigationState': instance.bottomNavigationState,
      'miscState': instance.miscState,
      'clientState': instance.clientState,
    };
