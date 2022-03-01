// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppState _$$_AppStateFromJson(Map<String, dynamic> json) => _$_AppState(
      credentials: json['credentials'] == null
          ? null
          : AuthCredentials.fromJson(
              json['credentials'] as Map<String, dynamic>),
      onboardingState: json['onboardingState'] == null
          ? null
          : OnboardingState.fromJson(
              json['onboardingState'] as Map<String, dynamic>),
      homeState: json['homeState'] == null
          ? null
          : HomeState.fromJson(json['homeState'] as Map<String, dynamic>),
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
      connectivityState: json['connectivityState'] == null
          ? null
          : ConnectivityState.fromJson(
              json['connectivityState'] as Map<String, dynamic>),
      contentState: json['contentState'] == null
          ? null
          : ContentState.fromJson(json['contentState'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AppStateToJson(_$_AppState instance) =>
    <String, dynamic>{
      'credentials': instance.credentials,
      'onboardingState': instance.onboardingState,
      'homeState': instance.homeState,
      'bottomNavigationState': instance.bottomNavigationState,
      'miscState': instance.miscState,
      'clientState': instance.clientState,
      'connectivityState': instance.connectivityState,
      'contentState': instance.contentState,
    };
