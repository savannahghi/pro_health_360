import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/redux/actions/update_health_diary_state.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/health_diary/health_diary_entry.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchHealthDiaryAction extends ReduxAction<AppState> {
  FetchHealthDiaryAction({required this.client});

  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchHealthDiaryFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(fetchHealthDiaryFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final String? clientID = state.clientState!.id;

    final Map<String, dynamic> variables = <String, dynamic>{
      'clientID': clientID
    };

    /// fetch the data from the api
    final Response response = await client.query(
      getHealthDiaryEntriesQuery,
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

    final HealthDiaryEdge healthDiaryContent = HealthDiaryEdge.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );

    if (healthDiaryContent.entries != null) {
      final List<HealthDiaryEntry>? entries = healthDiaryContent.entries;

      dispatch(UpdateHealthDiaryStateActon(diaryEntries: entries));
    }

    return state;
  }
}
