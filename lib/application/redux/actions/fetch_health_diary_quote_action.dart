import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/redux/actions/update_health_diary_state.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/health_diary/quote.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchHealthDiaryQuoteAction extends ReduxAction<AppState> {
  FetchHealthDiaryQuoteAction({required this.client});

  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchHealthDiaryQuoteFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(
      UpdateHealthDiaryStateActon(
        errorFetchingDiaryEntries: false,
        timeoutFetchingEntries: false,
      ),
    );
    dispatch(WaitAction<AppState>.add(fetchHealthDiaryQuoteFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'limit': 10,
    };

    /// fetch the data from the api
    final Response response = await client.query(
      getHealthDiaryQuoteQuery,
      variables,
    );

    final Map<String, dynamic> payLoad = client.toMap(response);
    final String? error = parseError(payLoad);

    if (error != null) {
      Sentry.captureException(UserException(error));

      if (error == 'timeout') {
        dispatch(UpdateHealthDiaryStateActon(timeoutFetchingEntries: true));
        return null;
      }

      dispatch(UpdateHealthDiaryStateActon(errorFetchingDiaryEntries: true));
      return null;
    }

    final QuoteRelay quoteState = QuoteRelay.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );

    if (quoteState.quotes?.isNotEmpty ?? false) {
      dispatch(UpdateHealthDiaryStateActon(quoteState: quoteState));
    }

    return state;
  }
}
