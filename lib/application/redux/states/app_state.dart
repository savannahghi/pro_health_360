// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';
import 'package:myafyahub/domain/core/entities/core/client_profile.dart';
import 'package:myafyahub/domain/core/entities/home/bottom_nav_state.dart';
import 'package:user_feed/user_feed.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/connectivity_state.dart';
import 'package:myafyahub/application/redux/states/misc_state.dart';
import 'package:myafyahub/application/redux/states/user_profile_state.dart';
import 'package:myafyahub/domain/core/value_objects/extensions.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

// TODO(abiud): rework this state after architecture rewrite
// AppState assembles all features states into one that can the pushed during creation
// to create on global app store
@freezed
class AppState with _$AppState {
  factory AppState({
    UserProfileState? userProfileState,
    ConnectivityState? connectivityState,
    FeedResponsePayload? userFeedState,
    MiscState? miscState,
    @JsonKey(ignore: true) Wait? wait,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  factory AppState.initial({
    UserProfileState? userProfileState,
    ConnectivityState? connectivityState,
    FeedResponsePayload? feedResponsePayload,
    MiscState? miscState,
  }) =>
      AppState(
        userProfileState: userProfileState ?? UserProfileState.initial(),
        connectivityState: connectivityState ?? ConnectivityState.initial(),
        userFeedState: feedResponsePayload ?? FeedResponsePayloadEx.initial(),
        miscState: miscState ?? MiscState.initial(),
        wait: Wait(),
      );
}

// AppState assembles all features states into one that can the pushed during creation
// to create on global app store
@freezed
class MainAppState with _$MainAppState {
  factory MainAppState({
    OnboardingState? onboardingState,
    BottomNavigationState? bottomNavigationState,
    MiscState? miscState,
    ClientProfile? clientProfile,
    @JsonKey(ignore: true) Wait? wait,
  }) = _State;

  factory MainAppState.fromJson(Map<String, dynamic> json) =>
      _$MainAppStateFromJson(json);

  factory MainAppState.initial() => MainAppState(
        onboardingState: OnboardingState.initial(),
        miscState: MiscState.initial(),
        clientProfile: ClientProfile.initial(),
        bottomNavigationState: BottomNavigationState.initial(),
        wait: Wait(),
      );
}

@freezed
class UserState with _$UserState {
  factory UserState({
    ClientState? clientState,
    AuthState? authState,
    ConfidentialState? confidentialState,
  }) = _UserState;

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);

  factory UserState.initial() => UserState(
        clientState: ClientState.initial(),
        authState: AuthState.initial(),
        confidentialState: ConfidentialState.initial(),
      );
}

@freezed
class ClientState with _$ClientState {
  factory ClientState({ClientProfile? clientProfile}) = _ClientState;

  factory ClientState.fromJson(Map<String, dynamic> json) =>
      _$ClientStateFromJson(json);

  factory ClientState.initial() => ClientState(
        clientProfile: ClientProfile.initial(),
      );
}

@freezed
class UserProfile with _$UserProfile {
  factory UserProfile() = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  factory UserProfile.initial() => UserProfile();
}

@freezed
class AuthState with _$AuthState {
  factory AuthState({AuthCredentials? credentials}) = _AuthState;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);

  factory AuthState.initial() => AuthState(
        credentials: AuthCredentials.initial(),
      );
}

@freezed
class ConfidentialState with _$ConfidentialState {
  factory ConfidentialState() = _ConfidentialState;

  factory ConfidentialState.fromJson(Map<String, dynamic> json) =>
      _$ConfidentialStateFromJson(json);

  factory ConfidentialState.initial() => ConfidentialState();

  // TODO(abiud): add the following states
  // - SensitiveAccess
  // - LastSensitiveAccess
  // - SensitiveRoutes
}

@freezed
class NotificationState with _$NotificationState {
  factory NotificationState() = _NotificationState;

  factory NotificationState.fromJson(Map<String, dynamic> json) =>
      _$NotificationStateFromJson(json);

  factory NotificationState.initial() => NotificationState();
}

@freezed
class FeedState with _$FeedState {
  factory FeedState() = _FeedState;

  factory FeedState.fromJson(Map<String, dynamic> json) =>
      _$FeedStateFromJson(json);

  factory FeedState.initial() => FeedState();
}

@freezed
class OnboardingState with _$OnboardingState {
  factory OnboardingState() = _OnboardingState;

  factory OnboardingState.fromJson(Map<String, dynamic> json) =>
      _$OnboardingStateFromJson(json);

  factory OnboardingState.initial() => OnboardingState(

      ///   - Login state
      ///   - Terms and conditions
      ///   - create pin
      ///   - security questions
      ///   - nickname
      );
}

@freezed
class HomeState with _$HomeState {
  factory HomeState() = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);

  factory HomeState.initial() => HomeState(

      ///   - RecentContentState
      ///   - SuggestedGroupsState
      );
}

@freezed
class CommunitiesState with _$CommunitiesState {
  factory CommunitiesState() = _CommunitiesState;

  factory CommunitiesState.fromJson(Map<String, dynamic> json) =>
      _$CommunitiesStateFromJson(json);

  factory CommunitiesState.initial() => CommunitiesState(

      ///   - RecentContentState
      ///   - SuggestedGroupsState
      );
}
