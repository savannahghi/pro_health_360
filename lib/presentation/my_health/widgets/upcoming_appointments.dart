// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
import 'package:myafyahub/presentation/my_health/widgets/reschedule_appointment_action_dialog.dart';

class UpcomingAppointments extends StatelessWidget {
  const UpcomingAppointments();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppointmentsViewModel>(
      converter: (Store<AppState> store) =>
          AppointmentsViewModel.fromStore(store.state),
      onInit: (Store<AppState> store) {
        store.dispatch(
          FetchAppointmentsAction(
            client: AppWrapperBase.of(context)!.graphQLClient,
            comparison: 'GREATER_THAN_OR_EQUAL_TO',
          ),
        );
      },
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
                        rescheduleCallBack: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return RescheduleAppointmentActionDialog(
                              appointmentId: currentAppointmentDetails.id ?? '',
                            );
                          },
                        ),
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
