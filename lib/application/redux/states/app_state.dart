// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/application/redux/states/client_state.dart';
import 'package:myafyahub/application/redux/states/onboarding_state.dart';
import 'package:myafyahub/application/redux/states/user_state.dart';
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';
import 'package:myafyahub/domain/core/entities/core/client_profile.dart';
import 'package:myafyahub/domain/core/entities/home/bottom_nav_state.dart';
import 'package:user_feed/user_feed.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/connectivity_state.dart';
import 'package:myafyahub/application/redux/states/misc_state.dart';
import 'package:myafyahub/domain/core/value_objects/extensions.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

// TODO(abiud): rework this state after architecture rewrite
// AppState assembles all features states into one that can the pushed during creation
// to create on global app store
@freezed
class AppState with _$AppState {
  factory AppState({
    AuthCredentials? credentials,
    UserState? userState,
    ConnectivityState? connectivityState,
    FeedResponsePayload? userFeedState,
    MiscState? miscState,
    @JsonKey(ignore: true) Wait? wait,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  factory AppState.initial({
    AuthCredentials? credentials,
    UserState? userState,
    ConnectivityState? connectivityState,
    FeedResponsePayload? feedResponsePayload,
    MiscState? miscState,
  }) =>
      AppState(
        credentials: credentials ?? AuthCredentials.initial(),
        userState: userState ?? UserState.initial(),
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
    AuthCredentials? credentials,
    OnboardingState? onboardingState,
    BottomNavigationState? bottomNavigationState,
    MiscState? miscState,
    ClientState? clientState,
    @JsonKey(ignore: true) Wait? wait,
  }) = _MainAppState;

  factory MainAppState.fromJson(Map<String, dynamic> json) =>
      _$MainAppStateFromJson(json);

  factory MainAppState.initial() => MainAppState(
        credentials: AuthCredentials.initial(),
        clientState: ClientState.initial(),
        onboardingState: OnboardingState.initial(),
        miscState: MiscState.initial(),
        bottomNavigationState: BottomNavigationState.initial(),
        wait: Wait(),
      );
}
