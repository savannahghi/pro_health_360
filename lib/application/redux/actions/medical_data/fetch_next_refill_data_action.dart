import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/src/response.dart';
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/medical_data/next_refill_response.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchNextRefillDataAction extends ReduxAction<AppState> {
  FetchNextRefillDataAction({required this.httpClient});

  final IGraphQlClient httpClient;

  @override
  void after() {
    super.after();
    dispatch(WaitAction<AppState>.remove(fetchViralLoadDataFlag));
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchViralLoadDataFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final String? clientID = state.clientState!.id;

    final Map<String, dynamic> variables = <String, dynamic>{
      'clientID': clientID
    };

    final Response response =
        await httpClient.query(nextRefillQuery, variables);

    final ProcessedResponse processed = processHttpResponse(response);

    if (processed.ok) {
      final Map<String, dynamic> mapped = httpClient.toMap(response);

      final String? error = httpClient.parseError(mapped);

      if (error != null) {
        throw UserException(getErrorMessage());
      }

      final NextRefillResponse nextRefillResponse =
          NextRefillResponse.fromJson(mapped);

      AppState appState = state;

      if (nextRefillResponse.data != null) {
        appState = state.copyWith(
          clientState: state.clientState
              ?.copyWith(nextRefillData: nextRefillResponse.data),
        );
      }

      return appState;
    } else {
      throw UserException(getErrorMessage());
    }
  }

  @override
  Object? wrapError(dynamic error) {
    if (error.runtimeType == UserException) {
      return error;
    }

    Sentry.captureException(error);
    return UserException(getErrorMessage());
  }
}
