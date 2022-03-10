// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/core/groups_state.dart';
// Project imports:
import 'package:myafyahub/domain/core/entities/login/user_pin.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'communities/channel_members_state.dart';

part 'misc_state.freezed.dart';
part 'misc_state.g.dart';

@freezed
class MiscState with _$MiscState {
  factory MiscState({
    String? initialRoute,
    UserPin? userPin,
    List<dynamic>? libraryListItems,
    FAQsContentState? profileFAQsContentState,
    String? healthPagePINInputTime,
    int? pinInputTries,
    String? maxTryTime,
    bool? pinVerified,
    bool? resumeTimer,
    GroupState? groupState,
    ChannelMembersState? channelMembersState,
  }) = _MiscState;

  factory MiscState.fromJson(Map<String, dynamic> json) =>
      _$MiscStateFromJson(json);

  factory MiscState.initial() => MiscState(
        initialRoute: AppRoutes.phoneLogin,
        userPin: UserPin(),
        libraryListItems: <dynamic>[],
        profileFAQsContentState: FAQsContentState.initial(),
        healthPagePINInputTime: UNKNOWN,
        pinInputTries: 0,
        maxTryTime: UNKNOWN,
        pinVerified: false,
        resumeTimer: false,
        groupState: GroupState.initial(),
        channelMembersState: ChannelMembersState(),
      );
}
