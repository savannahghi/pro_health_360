import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/src/response.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/medical_data/medical_data_response.dart';
import 'package:myafyahub/domain/core/entities/medical_data/medical_data_state.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchMedicalDataAction extends ReduxAction<AppState> {
  final IGraphQlClient httpClient;
  FetchMedicalDataAction({required this.httpClient});

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchMedicalDataFlag));
  }

  @override
  void after() {
    super.after();
    dispatch(WaitAction<AppState>.remove(fetchMedicalDataFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final String patientID = state.clientState?.fhirPatientID ?? '';
    final Map<String, dynamic> variables = <String, dynamic>{
      'patientID': patientID == UNKNOWN ? '' : patientID,
    };

    final Response response =
        await httpClient.query(medicalDataQuery, variables);

    final ProcessedResponse processed = processHttpResponse(response);

    if (processed.ok) {
      final Map<String, dynamic> mapped = httpClient.toMap(response);

      final String? error = httpClient.parseError(mapped);

      if (error != null) {
        throw UserException(getErrorMessage());
      }

      final MedicalDataResponse medicalDataResponse =
          MedicalDataResponse.fromJson(
        mapped['data'] as Map<String, dynamic>,
      );

      final MedicalDataState newState =
          MedicalDataState(medicalData: medicalDataResponse.medicalData);

      final AppState appState = state.copyWith(
        clientState: state.clientState?.copyWith(medicalDataState: newState),
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
