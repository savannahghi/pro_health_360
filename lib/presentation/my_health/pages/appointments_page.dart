// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:pro_health_360/presentation/my_health/widgets/past_appointments.dart';
import 'package:pro_health_360/presentation/my_health/widgets/upcoming_appointments.dart';

class AppointmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavIndex: 3,
      appBar: const CustomAppBar(
        title: appointmentsPageTitle,
        bottomNavIndex: 3,
      ),
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
                const Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      UpcomingAppointments(),
                      PastAppointments()
                    ],
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
