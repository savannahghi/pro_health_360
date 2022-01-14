import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:misc_utilities/misc.dart';
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/caregiver_information.dart';
import 'package:myafyahub/application/redux/states/misc_state.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class UpdateCaregiverInfoAction extends ReduxAction<AppState> {
  UpdateCaregiverInfoAction({
    required this.caregiverInformation,
    required this.graphQlClient,
  });

  final CaregiverInformation caregiverInformation;
  final IGraphQlClient graphQlClient;

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(editInformationFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(editInformationFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final String? clientId = state.clientState?.id;

    final Response result = await graphQlClient.query(
      updateClientCaregiver,
      caregiverInformation.copyWith(clientID: clientId).toJson(),
    );

    final Map<String, dynamic> payload = graphQlClient.toMap(result);
    final String? error = parseError(payload);

    if (error != null) {
      Sentry.captureException(
        error,
        hint: 'Error while updating caregiver information',
      );

      throw SILException(
        cause: 'caregiver_information',
        message: 'Error while updating caregiver information',
      );
    }

    final Map<String, dynamic> payloadData =
        payload['data'] as Map<String, dynamic>;
    final bool isUpdated = payloadData['createOrUpdateClientCaregiver'] as bool;

    if (isUpdated) {
      final MiscState? newState =
          state.miscState?.copyWith(caregiverInformation: caregiverInformation);
      return state.copyWith(miscState: newState);
    } else {
      throw SILException(
        cause: 'caregiver_information',
        message: 'Error while updating caregiver information',
      );
    }
  }

  // @override
  // Object wrapError(dynamic error) async {
  //   if (error.runtimeType == SILException) {
  //     ScaffoldMessenger.of(context)
  //       ..hideCurrentSnackBar()
  //       ..showSnackBar(
  //         SnackBar(
  //           content: Text(error.message.toString()),
  //           duration: const Duration(seconds: kShortSnackBarDuration),
  //           action: dismissSnackBar(
  //             closeString,
  //             Colors.white,
  //             context,
  //           ),
  //         ),
  //       );
  //     return error;
  //   }
  //   return error;
  // }
}
