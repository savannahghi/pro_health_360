// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/home/widgets/bottom_nav_bar.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    this.appBar = const CustomAppBar(),
    required this.body,
  }) : super(key: key);

  final Widget appBar;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: appBar,
      ),
      body: body,
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
