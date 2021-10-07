// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_feed/user_feed.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/connectivity_state.dart';
import 'package:myafyahub/application/redux/states/misc_state.dart';
import 'package:myafyahub/application/redux/states/user_profile_state.dart';
import 'package:myafyahub/domain/core/value_objects/extensions.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

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
