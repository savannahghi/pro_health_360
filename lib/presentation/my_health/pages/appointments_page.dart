// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:myafyahub/presentation/my_health/widgets/past_appointments.dart';

class AppointmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: appointmentsPageTitle),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: DefaultTabController(
          length: 2,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TabBar(
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(7), // Creates border
                      color: AppColors.primaryColor,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: AppColors.secondaryColor,
                    tabs: <Widget>[
                      Tab(
                        child: Text(
                          upcomingAppointmentsText,
                          textAlign: TextAlign.center,
                          style: boldSize16Text(),
                        ),
                      ),
                      Tab(
                        child: Text(
                          pastAppointmentsText,
                          textAlign: TextAlign.center,
                          style: boldSize16Text(),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[PastAppointments(), PastAppointments()],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
