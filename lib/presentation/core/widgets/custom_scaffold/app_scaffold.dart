// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/home/widgets/bottom_nav_bar.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    this.appBar = const CustomAppBar(),
    this.backgroundColor,
    required this.body,
    this.bottomNavIndex = 0,
  }) : super(key: key);

  final Color? backgroundColor;
  final Widget appBar;
  final Widget? body;
  final int bottomNavIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: appBar,
      ),
      body: body,
      bottomNavigationBar: BottomNavBar(
        bottomNavIndex: bottomNavIndex,
      ),
    );
  }
}
