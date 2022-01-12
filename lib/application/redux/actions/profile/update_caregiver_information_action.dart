import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:misc_utilities/misc.dart';
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/profile/caregiver_information.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class UpdateCaregiverInfoAction extends ReduxAction<AppState> {
  UpdateCaregiverInfoAction({
    required this.caregiverInformation,
    required this.graphQlClient,
  });

  final CaregiverInformation caregiverInformation;
  final IGraphQlClient graphQlClient;

  @override
  Future<AppState?> reduce() async {
    final Response result = await graphQlClient.query(
      updateClientCaregiver,
      caregiverInformation.toJson(),
    );

    final Map<String, dynamic> payLoad = graphQlClient.toMap(result);
    final String? error = parseError(payLoad);

    // TODO: Save to state after fetching
    // final CaregiverQueryResponse caregiverQueryResponse =
    //     CaregiverQueryResponse.fromJson(payLoad);

    if (error != null) {
      Sentry.captureException(
        error,
        hint: 'Error while updating caregiver information',
      );

      return null;
    }
  }
}
