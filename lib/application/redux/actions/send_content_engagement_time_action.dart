// Dart imports:
import 'dart:async';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content_engagement_state.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// [SendContentEngagementTimeAction] is a Redux Action that sends the amount of time a user has
///  viewed some specific cone
class SendContentEngagementTimeAction extends ReduxAction<AppState> {
  SendContentEngagementTimeAction({
    required this.client,
  });

  final IGraphQlClient client;

  @override
  Future<AppState> reduce() async {
    final ContentEngagementState contentEngagementState =
        state.contentState!.contentEngagementState!;
    final String? userID = state.clientState?.user?.userId;
    final int contentId = contentEngagementState.contentId!;
    final DateTime contentOpenedAt =
        DateTime.parse(contentEngagementState.contentOpenedAt!);
    final String differenceInSeconds =
        DateTime.now().difference(contentOpenedAt).inSeconds.toString();

    final Map<String, dynamic> variables = <String, dynamic>{
      'input': <String, dynamic>{
        'userID': userID,
        'type': 'CONTENT',
        'event': <String, dynamic>{
          'contentIds': contentId,
          'duration': differenceInSeconds,
        }
      }
    };

    final http.Response result = await client.query(
      contentViewDurationMutation,
      variables,
    );

    final Map<String, dynamic> body = client.toMap(result);
    client.close();

    final String? errors = client.parseError(body);

    if (errors != null) {
      Sentry.captureException(
        UserException(errors),
      );
      throw const UserException('sending content feedback time');
    }

    return state;
  }
}
