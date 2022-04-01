// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myafyahub/application/core/services/utils.dart';
// Package imports:
import 'package:myafyahub/domain/core/entities/appointments/appointment.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';
import 'package:unicons/unicons.dart';

/// [AppointmentListItem] Displays the notifications with Icons and a short description
class AppointmentListItem extends StatelessWidget {
  const AppointmentListItem({
    required this.appointment,
    required this.appointmentListTye,
    this.rescheduleCallBack,
  });

  final Appointment appointment;
  final AppointmentListTye appointmentListTye;
  final VoidCallback? rescheduleCallBack;

  @override
  Widget build(BuildContext context) {
    final Widget date = humanizeDate(
      dateTextStyle: normalSize12Text(AppColors.greyTextColor),
      loadedDate: appointment.date!,
      showTime: true,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // The leading icon
        Container(
          key: notificationIconContainerKey,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: appointment.pendingReschedule
                ? AppColors.coralColor.withOpacity(0.14)
                : AppColors.primaryColor.withOpacity(0.14),
          ),
          child: SvgPicture.asset(
            appointment.pendingReschedule
                ? appointmentRescheduledIconSvgPath
                : appointmentCalendarIconSvgPath,
          ),
        ),
        smallHorizontalSizedBox,

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                appointment.type ?? '',
                style: normalSize15Text(AppColors.secondaryColor),
              ),
              verySmallVerticalSizedBox,
              if (appointment.pendingReschedule)
                Text(
                  beingRescheduledString,
                  style: normalSize13Text(AppColors.coralColor),
                )
              else
                date,
              smallVerticalSizedBox,
              if (appointmentListTye == AppointmentListTye.Past)
                AppointmentStatusIndicator(
                  appointmentStatus: appointment.status!,
                ),
              if (appointmentListTye == AppointmentListTye.Upcoming &&
                  !appointment.pendingReschedule)
                MyAfyaHubPrimaryButton(
                  buttonKey: rescheduleButtonKey,
                  buttonColor: AppColors.primaryColor.withOpacity(0.14),
                  text: rescheduleText,
                  textStyle: normalSize15Text(AppColors.primaryColor),
                  onPressed: rescheduleCallBack,
                ),
            ],
          ),
        )
      ],
    );
  }
}

class AppointmentStatusIndicator extends StatelessWidget {
  const AppointmentStatusIndicator({Key? key, required this.appointmentStatus})
      : super(key: key);
  final AppointmentStatus appointmentStatus;

  @override
  Widget build(BuildContext context) {
    // A function that determines the icons and the text
    return Row(
      children: <Widget>[
        const Icon(
          UniconsSolid.check_circle,
          color: AppColors.greenHappyColor,
        ),
        verySmallHorizontalSizedBox,
        Text(
          'Completed',
          style: normalSize13Text(AppColors.greenHappyColor),
        ),
      ],
    );
  }
}
