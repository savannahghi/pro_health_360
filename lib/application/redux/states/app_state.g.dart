// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppState _$_$_AppStateFromJson(Map<String, dynamic> json) {
  return _$_AppState(
    userProfileState: json['userProfileState'] == null
        ? null
        : UserProfileState.fromJson(
            json['userProfileState'] as Map<String, dynamic>),
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
      'userProfileState': instance.userProfileState,
      'connectivityState': instance.connectivityState,
      'userFeedState': instance.userFeedState,
      'miscState': instance.miscState,
    };

_$_State _$_$_StateFromJson(Map<String, dynamic> json) {
  return _$_State(
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
    clientProfile: json['clientProfile'] == null
        ? null
        : ClientProfile.fromJson(json['clientProfile'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_StateToJson(_$_State instance) => <String, dynamic>{
      'onboardingState': instance.onboardingState,
      'bottomNavigationState': instance.bottomNavigationState,
      'miscState': instance.miscState,
      'clientProfile': instance.clientProfile,
    };

_$_UserState _$_$_UserStateFromJson(Map<String, dynamic> json) {
  return _$_UserState(
    clientState: json['clientState'] == null
        ? null
        : ClientState.fromJson(json['clientState'] as Map<String, dynamic>),
    authState: json['authState'] == null
        ? null
        : AuthState.fromJson(json['authState'] as Map<String, dynamic>),
    confidentialState: json['confidentialState'] == null
        ? null
        : ConfidentialState.fromJson(
            json['confidentialState'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_UserStateToJson(_$_UserState instance) =>
    <String, dynamic>{
      'clientState': instance.clientState,
      'authState': instance.authState,
      'confidentialState': instance.confidentialState,
    };

_$_ClientState _$_$_ClientStateFromJson(Map<String, dynamic> json) {
  return _$_ClientState(
    clientProfile: json['clientProfile'] == null
        ? null
        : ClientProfile.fromJson(json['clientProfile'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ClientStateToJson(_$_ClientState instance) =>
    <String, dynamic>{
      'clientProfile': instance.clientProfile,
    };

_$_UserProfile _$_$_UserProfileFromJson(Map<String, dynamic> json) {
  return _$_UserProfile();
}

Map<String, dynamic> _$_$_UserProfileToJson(_$_UserProfile instance) =>
    <String, dynamic>{};

_$_AuthState _$_$_AuthStateFromJson(Map<String, dynamic> json) {
  return _$_AuthState(
    credentials: json['credentials'] == null
        ? null
        : AuthCredentials.fromJson(json['credentials'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_AuthStateToJson(_$_AuthState instance) =>
    <String, dynamic>{
      'credentials': instance.credentials,
    };

_$_ConfidentialState _$_$_ConfidentialStateFromJson(Map<String, dynamic> json) {
  return _$_ConfidentialState();
}

Map<String, dynamic> _$_$_ConfidentialStateToJson(
        _$_ConfidentialState instance) =>
    <String, dynamic>{};

_$_NotificationState _$_$_NotificationStateFromJson(Map<String, dynamic> json) {
  return _$_NotificationState();
}

Map<String, dynamic> _$_$_NotificationStateToJson(
        _$_NotificationState instance) =>
    <String, dynamic>{};

_$_FeedState _$_$_FeedStateFromJson(Map<String, dynamic> json) {
  return _$_FeedState();
}

Map<String, dynamic> _$_$_FeedStateToJson(_$_FeedState instance) =>
    <String, dynamic>{};

_$_OnboardingState _$_$_OnboardingStateFromJson(Map<String, dynamic> json) {
  return _$_OnboardingState();
}

Map<String, dynamic> _$_$_OnboardingStateToJson(_$_OnboardingState instance) =>
    <String, dynamic>{};

_$_HomeState _$_$_HomeStateFromJson(Map<String, dynamic> json) {
  return _$_HomeState();
}

Map<String, dynamic> _$_$_HomeStateToJson(_$_HomeState instance) =>
    <String, dynamic>{};

_$_CommunitiesState _$_$_CommunitiesStateFromJson(Map<String, dynamic> json) {
  return _$_CommunitiesState();
}

Map<String, dynamic> _$_$_CommunitiesStateToJson(
        _$_CommunitiesState instance) =>
    <String, dynamic>{};
