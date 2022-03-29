// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:myafyahub/application/redux/actions/my_health/fetch_appointments_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/appointments/appointments_view_model.dart';
import 'package:myafyahub/domain/core/entities/appointments/appointment.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/my_health/widgets/appointment_list_item.dart';

class UpcomingAppointments extends StatefulWidget {
  @override
  State<UpcomingAppointments> createState() => _UpcomingAppointmentsState();
}

class _UpcomingAppointmentsState extends State<UpcomingAppointments> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((Duration timeStamp) async {
      StoreProvider.dispatch<AppState>(
        context,
        FetchAppointmentsAction(
          client: AppWrapperBase.of(context)!.graphQLClient,
          comparison: 'GREATER_THAN_OR_EQUAL_TO',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppointmentsViewModel>(
      converter: (Store<AppState> store) =>
          AppointmentsViewModel.fromStore(store.state),
      builder: (BuildContext context, AppointmentsViewModel vm) {
        final List<Appointment> appointments =
            vm.appointmentState?.appointments ?? <Appointment>[];
        if (vm.wait!.isWaitingFor(fetchAppointmentsFlag)) {
          return const PlatformLoader();
        } else if (vm.appointmentState?.errorFetchingAppointments ?? false) {
          return GenericErrorWidget(
            actionKey: helpNoDataWidgetKey,
            recoverCallback: () {
              StoreProvider.dispatch<AppState>(
                context,
                FetchAppointmentsAction(
                  client: AppWrapperBase.of(context)!.graphQLClient,
                  comparison: 'GREATER_THAN_OR_EQUAL_TO',
                ),
              );
            },
            messageTitle: messageTitleGenericErrorWidget,
            messageBody: <TextSpan>[
              TextSpan(
                text: getErrorMessage(fetchingAppointmentsString),
                style: normalSize16Text(
                  AppColors.greyTextColor,
                ),
              ),
            ],
          );
        } else {
          return appointments.isNotEmpty
              ? ListView.builder(
                  itemCount: appointments.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Appointment currentAppointmentDetails =
                        appointments.elementAt(index);

                    return Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: AppointmentListItem(
                        appointment: currentAppointmentDetails,
                        appointmentListTye: AppointmentListTye.Upcoming,
                      ),
                    );
                  },
                )
              : GenericErrorWidget(
                  headerIconSvgUrl: zeroAppointmentsImageSvgPath,
                  actionKey: helpNoDataWidgetKey,
                  actionText: okThanksText,
                  recoverCallback: () {
                    Navigator.of(context).pop();
                  },
                  messageTitle: noAppointmentsString,
                  messageBody: <TextSpan>[
                    TextSpan(
                      text: noAppointmentsBodyString,
                      style: normalSize16Text(
                        AppColors.greyTextColor,
                      ),
                    ),
                  ],
                );
        }
      },
    );
  }
}
