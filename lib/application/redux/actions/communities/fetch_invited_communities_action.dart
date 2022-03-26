import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/redux/actions/communities/update_invited_communities_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/communities/pending_invites_response.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchInvitedCommunitiesAction extends ReduxAction<AppState> {
  FetchInvitedCommunitiesAction({required this.client});

  final IGraphQlClient client;

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchInvitedCommunitiesFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchInvitedCommunitiesFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final String memberId = state.clientState!.id!;
    final Map<String, dynamic> variables = <String, dynamic>{
      'memberID': memberId,
      'input': <String, dynamic>{'limit': 20},
    };

    final Response response =
        await client.query(listUserInvitedCommunitiesQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> responseMap = client.toMap(response);
      final String? error = parseError(responseMap);

      if (error != null) {
        Sentry.captureException(
          const UserException(errorFetchingInvitesText),
          hint: variables,
        );

        throw const UserException(errorFetchingInvitesText);
      }

      final PendingInvitesResponse pendingInvites =
          PendingInvitesResponse.fromJson(
        responseMap['data'] as Map<String, dynamic>,
      );

      dispatch(
        UpdateInvitedCommunitiesStateAction(
          communitiesList: pendingInvites.communities,
        ),
      );
    } else {
      Sentry.captureException(
        const UserException(somethingWentWrongText),
        hint: variables,
      );

      throw const UserException(somethingWentWrongText);
    }
  }

  @override
  Object? wrapError(dynamic error) {
    if (error.runtimeType == UserException) {
      return error;
    }

    Sentry.captureException(error);
    return const UserException(somethingWentWrongText);
  }
}
