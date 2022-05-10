// Dart imports:
// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
// Project imports:
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/FAQS/update_faqs_content_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';

class FetchFAQSContentAction extends ReduxAction<AppState> {
  FetchFAQSContentAction({
    required this.context,
  });

  final BuildContext context;

  @override
  void before() {
    super.before();

    dispatch(WaitAction<AppState>.add(getFAQsFlag));
    dispatch(
      UpdateFAQsContentAction(
        errorFetchingFAQs: false,
        timeoutFetchingFAQs: false,
      ),
    );
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(getFAQsFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;
    final Map<String, dynamic> variables = <String, dynamic>{
      'categoryID': 10002,
      'Limit': '20',
    };

    final http.Response result = await _client.query(
      getContentQuery,
      variables,
    );

    final Map<String, dynamic> body = _client.toMap(result);

    final String? error = parseError(body);

    if (error != null) {
      reportErrorToSentry(
        context,
        error,
        hint: errorFetchingFAQsString,
      );

      if (error == 'timeout') {
        dispatch(UpdateFAQsContentAction(timeoutFetchingFAQs: true));
        return null;
      }

      dispatch(UpdateFAQsContentAction(errorFetchingFAQs: true));
      return null;
    }

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    final FeedContent profileFAQsData = FeedContent.fromJson(
      responseMap['data'] as Map<String, dynamic>,
    );

    if (profileFAQsData.feedContent != null) {
      final List<Content>? items = profileFAQsData.feedContent?.items;

      if (items != null && items.isNotEmpty) {
        dispatch(
          UpdateFAQsContentAction(
            profileFAQs: items,
          ),
        );
      } else {
        dispatch(
          UpdateFAQsContentAction(
            profileFAQs: <Content>[],
            errorFetchingFAQs: false,
            timeoutFetchingFAQs: false,
          ),
        );
      }
    }

    return state;
  }
}
