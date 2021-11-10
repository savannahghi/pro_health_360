// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:misc_utilities/misc.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/facebook_events_object.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/engagement/home/pages/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    MyAfyaHubFacebookEvents().logger.logEvent(name: 'view_home_page');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homepageContentKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: DoubleBackToCloseApp(
        snackBar: snackbar(content: pressToExitText, durationSeconds: 3),
        child: const HomeWidget(),
      ),
    );
  }
}
