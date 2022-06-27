// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/my_health/fetch_appointments_action.dart';
import 'package:pro_health_360/application/redux/actions/my_health/update_appointment_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/appointments/appointments_view_model.dart';
import 'package:pro_health_360/domain/core/entities/appointments/appointment.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/my_health/widgets/appointment_list_item.dart';

class PastAppointments extends StatelessWidget {
  const PastAppointments();

  @override
  Widget build(BuildContext context) {
    final ScrollController _listController = ScrollController();
    return StoreConnector<AppState, AppointmentsViewModel>(
      converter: (Store<AppState> store) =>
          AppointmentsViewModel.fromStore(store.state),
      onInit: (Store<AppState> store) async {
        _listController.addListener(() {
          final double maxScroll = _listController.position.maxScrollExtent;
          final double currentScroll = _listController.position.pixels;
          if (maxScroll <= currentScroll &&
              !store.state.wait!.isWaitingFor(fetchAppointmentsFlag) &&
              store.state.miscState!.appointmentState!.hasNextPage!) {
            store.dispatch(
              FetchAppointmentsAction(
                client: AppWrapperBase.of(context)!.graphQLClient,
                comparison: 'GREATER_THAN_OR_EQUAL_TO',
              ),
            );
          }
        });
        await store.dispatch(
          UpdateAppointmentStateAction(
            appointments: <Appointment>[],
            currentPage: 1,
            hasNextPage: true,
          ),
        );
        store.dispatch(
          FetchAppointmentsAction(
            client: AppWrapperBase.of(context)!.graphQLClient,
            comparison: 'LESS_THAN',
            page: 1,
          ),
        );
      },
      builder: (BuildContext context, AppointmentsViewModel vm) {
        final List<Appointment> appointments =
            vm.appointmentState?.appointments ?? <Appointment>[];
        if (vm.wait!.isWaitingFor('${fetchAppointmentsFlag}1')) {
          return const PlatformLoader();
        } else if (vm.appointmentState?.errorFetchingAppointments ?? false) {
          return GenericErrorWidget(
            actionKey: helpNoDataWidgetKey,
            recoverCallback: () {
              StoreProvider.dispatch<AppState>(
                context,
                FetchAppointmentsAction(
                  client: AppWrapperBase.of(context)!.graphQLClient,
                  comparison: 'LESS_THAN_OR_EQUAL_TO',
                  page: 1,
                ),
              );
            },
            messageTitle: messageTitleGenericErrorWidget,
            messageBody: <TextSpan>[
              TextSpan(
                text: getErrorMessage(fetchingAppointmentsString),
                style: normalSize16Text(AppColors.greyTextColor),
              ),
            ],
          );
        } else {
          return appointments.isNotEmpty
              ? Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        itemCount: appointments.length,
                        controller: _listController,
                        itemBuilder: (BuildContext context, int index) {
                          final Appointment currentAppointmentDetails =
                              appointments.elementAt(index);

                          return Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: AppointmentListItem(
                              appointment: currentAppointmentDetails,
                              appointmentListTye: AppointmentListTye.Past,
                            ),
                          );
                        },
                      ),
                    ),
                    if (vm.wait?.isWaitingFor(fetchAppointmentsFlag) ?? false)
                      const PlatformLoader()
                  ],
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
