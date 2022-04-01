import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/redux/actions/my_health/update_appointment_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';

class RescheduleAppointmentAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final String appointmentId;
  final VoidCallback? onSuccess;
  final VoidCallback? onError;

  RescheduleAppointmentAction({
    required this.client,
    required this.appointmentId,
    this.onSuccess,
    this.onError,
  });

  @override
  void before() {
    super.before();
    dispatch(UpdateAppointmentStateAction(errorFetchingAppointments: false));
    dispatch(
      WaitAction<AppState>.add(
        '${rescheduleAppointmentFlag}_$appointmentId',
      ),
    );
  }

  @override
  void after() {
    dispatch(
      WaitAction<AppState>.remove(
        '${rescheduleAppointmentFlag}_$appointmentId',
      ),
    );
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'appointmentID': appointmentId,
    };

    final Response response = await client.query(
      rescheduleAppointmentMutation,
      variables,
    );
    client.close();

    final Map<String, dynamic> payLoad = client.toMap(response);
    final String? error = parseError(payLoad);

    if (error != null) {
      onError?.call();
      return null;
    }
    final bool? appointmentRescheduled =
        payLoad['data']['rescheduleAppointment'] as bool?;

    if (appointmentRescheduled ?? false) {
      onSuccess?.call();
    } else {
      onError?.call();
    }
    return null;
  }
}
