// Dart imports:
import 'dart:async';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/core/services/analytics_service.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content_engagement_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_events.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

/// [SendContentEngagementTimeAction] is a Redux Action that sends the amount of
///  time a user has viewed some specific content. It saves this as an event to
///  Firebase for analytics
class SendContentEngagementTimeAction extends ReduxAction<AppState> {
  SendContentEngagementTimeAction();

  @override
  Future<AppState?> reduce() async {
    final ContentEngagementState contentEngagementState =
        state.contentState!.contentEngagementState!;

    final int contentId = contentEngagementState.contentId!;

    final DateTime contentOpenedAt =
        DateTime.parse(contentEngagementState.contentOpenedAt!);
    final String differenceInSeconds =
        DateTime.now().difference(contentOpenedAt).inSeconds.toString();

    final Map<String, dynamic> params = <String, dynamic>{
      'contentID': contentId,
      'duration': differenceInSeconds,
    };

    /// Log this as an event
    await AnalyticsService().logEvent(
      name: contentInteractionTimeEvent,
      eventType: AnalyticsEventType.CONTENT_INTERACTION,
      parameters: params,
    );

    return state;
  }
}
