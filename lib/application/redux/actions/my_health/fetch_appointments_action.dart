import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/redux/actions/my_health/update_appointment_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/misc_state.dart';
import 'package:myafyahub/domain/core/entities/appointments/appointment.dart';

class FetchAppointmentsAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final String comparison;

  FetchAppointmentsAction({required this.client, required this.comparison});

  @override
  void before() {
    super.before();
    dispatch(UpdateAppointmentStateAction(errorFetchingAppointments: false));
    dispatch(WaitAction<AppState>.add(fetchAppointmentsFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchAppointmentsFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final String clientID = state.clientState?.id ?? '';
    final String date = DateTime.now().toString();
    final Map<String, dynamic> variables = <String, dynamic>{
      'clientID': clientID,
      'paginationInput': <String, dynamic>{'Limit': 20, 'CurrentPage': 1},
      'filters': <dynamic>[
        <String, dynamic>{
          'fieldName': 'date',
          'fieldType': 'TIMESTAMP',
          'comparisonOperation': comparison,
          'fieldValue': date
        }
      ]
    };

    final Response response = await client.query(
      listAppointmentsQuery,
      variables,
    );
    client.close();

    final Map<String, dynamic> payLoad = client.toMap(response);
    final String? error = parseError(payLoad);

    if (error != null) {
      dispatch(UpdateAppointmentStateAction(errorFetchingAppointments: true));
      return state;
    }
    final MiscState miscState = MiscState.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );

    final List<Appointment> appointments =
        miscState.appointmentState?.appointments ?? <Appointment>[];

    dispatch(
      UpdateAppointmentStateAction(appointments: appointments),
    );

    return state;
  }
}
