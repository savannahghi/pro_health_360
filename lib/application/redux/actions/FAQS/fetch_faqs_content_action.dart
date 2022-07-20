// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Flutter imports:
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
// Project imports:
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/redux/actions/FAQS/update_faqs_content_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';

class FetchFAQSContentAction extends ReduxAction<AppState> {
  FetchFAQSContentAction({
    required this.client,
  });

  final IGraphQlClient client;

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(getFAQsFlag));
    dispatch(
      UpdateFAQsContentAction(
        errorFetchingFAQs: false,
        timeoutFetchingFAQs: false,
      ),
    );
    super.before();
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(getFAQsFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'flavour': Flavour.consumer.name,
    };

    final http.Response result = await client.query(
      getFAQsQuery,
      variables,
    );

    final Map<String, dynamic> body = client.toMap(result);

    final String? error = parseError(body);

    if (error != null) {
      if (error == 'timeout') {
        dispatch(UpdateFAQsContentAction(timeoutFetchingFAQs: true));
        return null;
      }

      dispatch(UpdateFAQsContentAction(errorFetchingFAQs: true));
      return null;
    }

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    final FAQContent profileFAQsData = FAQContent.fromJson(
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
