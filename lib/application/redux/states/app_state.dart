// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/application/redux/states/client_state.dart';
import 'package:myafyahub/application/redux/states/onboarding_state.dart';
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';
import 'package:myafyahub/domain/core/entities/home/bottom_nav_state.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/connectivity_state.dart';
import 'package:myafyahub/application/redux/states/misc_state.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

// AppState assembles all features states into one that can the pushed during creation
// to create on global app store
@freezed
class AppState with _$AppState {
  factory AppState({
    AuthCredentials? credentials,
    OnboardingState? onboardingState,
    BottomNavigationState? bottomNavigationState,
    MiscState? miscState,
    ClientState? clientState,
    ConnectivityState? connectivityState,
    @JsonKey(ignore: true) Wait? wait,
  }) = _MainAppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  factory AppState.initial() => AppState(
        credentials: AuthCredentials.initial(),
        clientState: ClientState.initial(),
        onboardingState: OnboardingState.initial(),
        miscState: MiscState.initial(),
        bottomNavigationState: BottomNavigationState.initial(),
        connectivityState: ConnectivityState.initial(),
        wait: Wait(),
      );
}
