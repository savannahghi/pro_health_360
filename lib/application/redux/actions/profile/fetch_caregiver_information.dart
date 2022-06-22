import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'package:pro_health_360/application/redux/actions/update_client_profile_action.dart';
import 'package:pro_health_360/domain/core/entities/profile/caregiver_information.dart';
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';

class FetchCaregiverInformationAction extends ReduxAction<AppState> {
  FetchCaregiverInformationAction({
    required this.client,
  });

  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchCaregiverInfoFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(fetchCaregiverInfoFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'clientID': state.clientState!.id,
    };
    final Response response =
        await client.query(getClientCaregiverQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(
          UserException(errors),
        );

        throw UserException(
          getErrorMessage('fetching caregiver information'),
        );
      }
      if (body['data']?['getClientCaregiver'] != null) {
        final CaregiverInformation caregiverInformation =
            CaregiverInformation.fromJson(
          body['data']['getClientCaregiver'] as Map<String, dynamic>,
        );

        dispatch(
          UpdateClientProfileAction(
            caregiverInformation: caregiverInformation,
            hasCaregiverInfo: true,
          ),
        );
      } else {
        // when client has no caregiver information
        dispatch(
          UpdateClientProfileAction(
            hasCaregiverInfo: false,
            caregiverInformation: CaregiverInformation.initial(),
          ),
        );
      }
    } else {
      throw UserException(processedResponse.message);
    }
  }
}
