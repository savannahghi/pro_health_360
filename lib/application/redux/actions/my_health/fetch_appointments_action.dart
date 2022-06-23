import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/redux/actions/my_health/update_appointment_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/misc_state.dart';
import 'package:pro_health_360/domain/core/entities/appointments/appointment.dart';

class FetchAppointmentsAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final String comparison;
  final int? page;

  FetchAppointmentsAction({
    required this.client,
    required this.comparison,
    this.page,
  });

  @override
  void before() {
    super.before();
    dispatch(UpdateAppointmentStateAction(errorFetchingAppointments: false));
    dispatch(WaitAction<AppState>.add('$fetchAppointmentsFlag${page ?? ''}'));
  }

  @override
  void after() {
    dispatch(
      WaitAction<AppState>.remove('$fetchAppointmentsFlag${page ?? ''}'),
    );
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final String clientID = state.clientState?.id ?? '';
    final int currentPage = state.miscState?.appointmentState?.currentPage ?? 1;
    final String date = DateTime.now().toString();
    final Map<String, dynamic> variables = <String, dynamic>{
      'clientID': clientID,
      'paginationInput': <String, dynamic>{
        'Limit': 20,
        'CurrentPage': page ?? currentPage,
      },
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
      dispatch(
        UpdateAppointmentStateAction(
          errorFetchingAppointments: true,
        ),
      );
      return state;
    }
    final MiscState miscState = MiscState.fromJson(
      payLoad['data'] as Map<String, dynamic>,
    );

    List<Appointment> appointments =
        state.miscState?.appointmentState?.appointments ?? <Appointment>[];
    final List<Appointment> newAppointments =
        miscState.appointmentState?.appointments ?? <Appointment>[];
    if (currentPage == 1) {
      appointments = newAppointments;
    } else {
      appointments += newAppointments;
    }
    final int newCurrentPage = page != null
        ? page! + 1
        : newAppointments.length < 20
            ? currentPage
            : currentPage + 1;
    dispatch(
      UpdateAppointmentStateAction(
        appointments: appointments,
        currentPage: newCurrentPage,
        hasNextPage: newCurrentPage > currentPage,
      ),
    );

    return state;
  }
}
