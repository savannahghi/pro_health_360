// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/application/redux/states/onboarding_state.dart';
import 'package:myafyahub/application/redux/states/user_state.dart';
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';
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
    OnboardingState? onboardingState,
    BottomNavigationState? bottomNavigationState,
    MiscState? miscState,
    @JsonKey(ignore: true) Wait? wait,
  }) = _MainAppState;

  factory MainAppState.fromJson(Map<String, dynamic> json) =>
      _$MainAppStateFromJson(json);

  factory MainAppState.initial() => MainAppState(
        onboardingState: OnboardingState.initial(),
        miscState: MiscState.initial(),
        bottomNavigationState: BottomNavigationState.initial(),
        wait: Wait(),
      );
}

@freezed
class FeedState with _$FeedState {
  factory FeedState() = _FeedState;

  factory FeedState.fromJson(Map<String, dynamic> json) =>
      _$FeedStateFromJson(json);

  factory FeedState.initial() => FeedState();
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
