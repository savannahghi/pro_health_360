import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/redux/actions/update_client_profile_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/profile/caregiver_information.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class UpdateCaregiverInfoAction extends ReduxAction<AppState> {
  UpdateCaregiverInfoAction({
    required this.caregiverInformation,
    required this.client,
    this.onSuccess,
  });

  final CaregiverInformation caregiverInformation;
  final IGraphQlClient client;
  final void Function()? onSuccess;

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'caregiverInput': caregiverInformation
          .copyWith(clientID: state.clientState?.id)
          .toJson()
    };

    final Response response = await client.query(
      updateClientCaregiverMutation,
      variables,
    );

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);

      final String? errors = client.parseError(body);

      if (errors != null) {
        Sentry.captureException(
          UserException(errors),
        );

        throw UserException(
          getErrorMessage('updating caregiver information'),
        );
      }

      final Map<String, dynamic>? data = body['data'] as Map<String, dynamic>?;

      if (data?['createOrUpdateClientCaregiver'] == true) {
        dispatch(UpdateClientProfileAction());
        onSuccess?.call();
      } else {
        Sentry.captureException(UserException(processedResponse.message));
        throw UserException(processedResponse.message);
      }
    } else {
      throw UserException(processedResponse.message);
    }

    return null;
  }
}
