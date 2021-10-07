// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_ui_components/coming_soon_page.dart';
import 'package:shared_ui_components/small_appbar.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class MedicalTestsLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SILSmallAppBar(
        title: getTestedTitle,
        backRoute: BWRoutes.home,
      ),
      body: SILComingSoonPage(
          title: getTestedTitle,
          imagePath: laboratoryCoverIconImgUrl,
          description: getTestedCopy,
          comingSoonText: getTestedComingSoonText),
    );
  }
}
