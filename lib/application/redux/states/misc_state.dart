// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pro_health_360/application/redux/states/screening_tools_state.dart';
import 'package:pro_health_360/domain/core/entities/appointments/appointments_state.dart';
import 'package:pro_health_360/domain/core/entities/core/groups_state.dart';
import 'package:pro_health_360/domain/core/entities/surveys/survey.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import 'communities/channel_members_state.dart';

part 'misc_state.freezed.dart';
part 'misc_state.g.dart';

@freezed
class MiscState with _$MiscState {
  factory MiscState({
    @JsonKey(defaultValue: AppRoutes.phoneLogin) required String initialRoute,
    List<dynamic>? libraryListItems,
    FAQsContentState? profileFAQsContentState,
    String? healthPagePINInputTime,
    int? pinInputTries,
    String? maxTryTime,
    bool? pinVerified,
    bool? resumeTimer,
    GroupState? groupState,
    ChannelMembersState? channelMembersState,
    ScreeningToolsState? screeningToolsState,
    @JsonKey(name: 'fetchClientAppointments')
        AppointmentState? appointmentState,
    String? inactiveTime,
    bool? resumeWithPin,
    List<Survey>? availableSurveysList,
    // track the number of time a wrong PIN has been input on the resume with PIN workflow
    int? resumeWithPINRetries,
    // selected survey to be opened
    Survey? selectedSurvey,
  }) = _MiscState;

  factory MiscState.fromJson(Map<String, dynamic> json) =>
      _$MiscStateFromJson(json);

  factory MiscState.initial() => MiscState(
        initialRoute: AppRoutes.phoneLogin,
        libraryListItems: <dynamic>[],
        profileFAQsContentState: FAQsContentState.initial(),
        healthPagePINInputTime: UNKNOWN,
        pinInputTries: 0,
        maxTryTime: UNKNOWN,
        pinVerified: false,
        resumeTimer: false,
        groupState: GroupState.initial(),
        channelMembersState: ChannelMembersState(),
        appointmentState: AppointmentState.initial(),
        screeningToolsState: ScreeningToolsState.initial(),
        inactiveTime: UNKNOWN,
        resumeWithPin: false,
        availableSurveysList: <Survey>[],
        resumeWithPINRetries: 0,
      );
}
