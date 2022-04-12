
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/src/response.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/viral_load/viral_load_response.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchViralLoadDataAction extends ReduxAction<AppState> {
  FetchViralLoadDataAction({required this.httpClient});

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
    final String patientID = state.clientState?.fhirPatientID ?? '';

    final Map<String, dynamic> variables = <String, dynamic>{
      'params': <String, dynamic>{
        'patient': patientID == UNKNOWN ? '' : patientID,
        'code': '856',
        '_count': '1',
        '_sort': '-date',
      }
    };

    final Response response =
        await httpClient.query(searchObservationsQuery, variables);

    final ProcessedResponse processed = processHttpResponse(response);

    if (processed.ok) {
      final Map<String, dynamic> mapped = httpClient.toMap(response);

      final String? error = httpClient.parseError(mapped);

      if (error != null) {
        throw UserException(getErrorMessage());
      }

      final ViralLoadResponse viralLoadResponse = ViralLoadResponse.fromJson(
        mapped['data'] as Map<String, dynamic>,
      );

      final AppState appState = state.copyWith(
        clientState:
            state.clientState?.copyWith(viralLoadData: viralLoadResponse.data),
      );

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
