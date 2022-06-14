import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/my_health/fetch_appointments_action.dart';
import 'package:myafyahub/application/redux/actions/my_health/reschedule_appointment_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/constants.dart';

class RescheduleAppointmentActionDialog extends StatefulWidget {
  const RescheduleAppointmentActionDialog({
    required this.appointmentId,
  });
  final String appointmentId;

  @override
  State<RescheduleAppointmentActionDialog> createState() =>
      _RescheduleAppointmentActionDialogState();
}

class _RescheduleAppointmentActionDialogState
    extends State<RescheduleAppointmentActionDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController rescheduleDateTextController =
      TextEditingController();
  late DateTime date;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                pickDateString,
                style: veryBoldSize20Text(),
              ),
              mediumVerticalSizedBox,
              DatePickerField(
                gestureDateKey: rescheduleDateKey,
                initialAllowedDate: DateTime.now(),
                controller: rescheduleDateTextController,
                validator: appointmentDateValidator,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.date_range),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(8.0),
                ),
                style: const TextStyle(color: AppColors.greyTextColor),
                onChanged: (String? value) {
                  if (value != null) {
                    date = DateFormat(datePickerFormat).parseLoose(value);
                  }
                },
              ),
              mediumVerticalSizedBox,
              StoreConnector<AppState, AppStateViewModel>(
                converter: (Store<AppState> store) =>
                    AppStateViewModel.fromStore(store),
                builder: (BuildContext context, AppStateViewModel vm) {
                  return SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: vm.wait!.isWaitingFor(
                      '${rescheduleAppointmentFlag}_${widget.appointmentId}',
                    )
                        ? const PlatformLoader()
                        : MyAfyaHubPrimaryButton(
                            buttonKey: rescheduleButtonKey,
                            text: rescheduleText,
                            textStyle: boldSize16Text(AppColors.whiteColor),
                            textColor: AppColors.whiteColor,
                            onPressed: () {
                              final bool? isFormValid =
                                  _formKey.currentState?.validate();

                              if (isFormValid ?? false) {
                                StoreProvider.dispatch<AppState>(
                                  context,
                                  RescheduleAppointmentAction(
                                    date: getFormattedAppointDate(date),
                                    client: AppWrapperBase.of(context)!
                                        .graphQLClient,
                                    appointmentId: widget.appointmentId,
                                    onSuccess: () {
                                      ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              appointmentRescheduledMessageString,
                                            ),
                                            duration: Duration(
                                              seconds: kShortSnackBarDuration,
                                            ),
                                          ),
                                        );
                                      StoreProvider.dispatch<AppState>(
                                        context,
                                        FetchAppointmentsAction(
                                          client: AppWrapperBase.of(context)!
                                              .graphQLClient,
                                          comparison:
                                              'GREATER_THAN_OR_EQUAL_TO',
                                        ),
                                      );
                                    },
                                    onError: () => ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(
                                        SnackBar(
                                          content: Text(getErrorMessage()),
                                          duration: const Duration(
                                            seconds: kShortSnackBarDuration,
                                          ),
                                        ),
                                      ),
                                    onDone: () => Navigator.of(context).pop(),
                                  ),
                                );
                              }
                            },
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
