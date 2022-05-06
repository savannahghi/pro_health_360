import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/src/response.dart';
import 'package:intl/intl.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/health_timeline_state.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/fhir_resource.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/health_timeline_response.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchHealthTimelineAction extends ReduxAction<AppState> {
  final IGraphQlClient httpClient;

  FetchHealthTimelineAction({required this.httpClient});

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchHealthTimelineFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchHealthTimelineFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final int? offset = state.clientState?.healthTimelineState?.offset;
    final Map<String, dynamic> variables = <String, dynamic>{
      'input': <String, dynamic>{
        'patientID': state.clientState?.fhirPatientID,
        'offset': offset,
        'limit': 10,
      }
    };

    final Response response =
        await httpClient.query(patientTimelineQuery, variables);

    final ProcessedResponse processed = processHttpResponse(response);

    if (processed.ok) {
      final Map<String, dynamic> mapped = httpClient.toMap(response);

      final String? error = httpClient.parseError(mapped);

      if (error != null) {
        throw UserException(getErrorMessage());
      }

      final HealthTimelineResponse healthTimelineResponse =
          HealthTimelineResponse.fromJson(
        mapped['data']['patientHealthTimeline'] as Map<String, dynamic>,
      );

      final Map<String, List<FhirResource>> items =
          <String, List<FhirResource>>{};

      final List<FhirResource> responseItems =
          healthTimelineResponse.patientTimeline;

      for (int i = 0; i < responseItems.length; i++) {
        final FhirResource responseItem = responseItems[i];
        final DateTime? date =
            DateTime.tryParse(responseItem.timelineDate ?? '')?.toLocal();

        if (date != null) {
          final String formattedDate = DateFormat('yyyy-MM-dd').format(date);
          if (items.containsKey(formattedDate)) {
            items[formattedDate]?.add(responseItem);
          } else {
            items[formattedDate] = <FhirResource>[responseItem];
          }
        }
      }

      final HealthTimelineState newState =
          HealthTimelineState(healthTimelineItems: items);

      final AppState appState = state.copyWith(
        clientState: state.clientState?.copyWith(healthTimelineState: newState),
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
