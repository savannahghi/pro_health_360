import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/exception_tag.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class AcceptDeclineCommunitiesInviteAction extends ReduxAction<AppState> {
  final bool hasAcceptedInvite;
  final String communityID;
  final BuildContext context;

  AcceptDeclineCommunitiesInviteAction({
    required this.hasAcceptedInvite,
    required this.communityID,
    required this.context,
  });
  @override
  Future<AppState?> reduce() async {
    final String memberId = state.clientState!.id!;
    final Map<String, dynamic> variables = <String, dynamic>{
      'memberID': memberId,
      'communityID': communityID,
    };
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;
    final Response response;

    /// fetch the data from the api
    if (hasAcceptedInvite) {
      response = await _client.query(
        acceptInvitationMutation,
        variables,
      );
    } else {
      response = await _client.query(
        rejectInvitationMutation,
        variables,
      );
    }

    final Map<String, dynamic> responseMap = _client.toMap(response);
    final String? error = parseError(responseMap);

    if (error != null) {
      reportErrorToSentry(
        context,
        error,
        hint: 'Error accepting or rejecting invite',
      );
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text(genericErrorOccurred),
          ),
        );
      throw MyAfyaException(
        cause: acceptRejectCommunitiesTag,
        message: somethingWentWrongText,
      );
    }
    if (responseMap['data'] != null &&
        responseMap['data']['acceptInvitation'] != null &&
        responseMap['data']['acceptInvitation'] is bool &&
        responseMap['data']['acceptInvitation'] != false) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text(invitationAcceptedSuccessfully),
          ),
        );
      Navigator.of(context).pushNamed(AppRoutes.userProfilePage);
    } else if (responseMap['data'] != null &&
        responseMap['data']['rejectInvitation'] != null &&
        responseMap['data']['rejectInvitation'] is bool &&
        responseMap['data']['rejectInvitation'] != false) {
      Navigator.of(context).pushNamed(AppRoutes.userProfilePage);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text(communitiesRejectionSuccessful),
          ),
        );
    } else {
      Navigator.of(context).pushNamed(AppRoutes.userProfilePage);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text(genericErrorOccurred),
          ),
        );
    }
  }
}
