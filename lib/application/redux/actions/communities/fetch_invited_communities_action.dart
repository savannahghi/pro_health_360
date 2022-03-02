import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/communities/update_invited_communities_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/community.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/exception_tag.dart';

class FetchInvitedCommunitiesAction extends ReduxAction<AppState> {
  final BuildContext context;

  FetchInvitedCommunitiesAction({required this.context});

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchInvitedCommunitiesFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(fetchInvitedCommunitiesFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final String memberId = state.clientState!.id!;
    final Map<String, dynamic> variables = <String, dynamic>{
      'memberID': memberId,
      'input': <String, dynamic>{'limit': 20},
    };

    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    /// fetch the data from the api
    final Response response = await _client.query(
      listUserInvitedCommunitiesQuery,
      variables,
    );

    final Map<String, dynamic> responseMap = _client.toMap(response);
    final String? error = parseError(responseMap);

    if (error != null) {
      reportErrorToSentry(
        context,
        error,
        hint: 'Error while fetching clinic information',
      );

      throw MyAfyaException(
        cause: invitedCommunitiesTag,
        message: somethingWentWrongText,
      );
    }

    if (responseMap['data']['listPendingInvites'] != null &&
        responseMap['data']['listPendingInvites'] is List &&
        (responseMap['data']['listPendingInvites'] as List<dynamic>)
            .isNotEmpty) {
      final List<dynamic> communitiesMap =
          responseMap['data']['listPendingInvites'] as List<dynamic>;
      final List<Community> communitiesList = <Community>[];
      for (final dynamic community in communitiesMap) {
        communitiesList.add(
          Community.fromJson(community as Map<String, dynamic>),
        );
      }

      dispatch(
        UpdateInvitedCommunitiesStateAction(communitiesList: communitiesList),
      );
    }
  }
}
