import 'package:afya_moja_core/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:misc_utilities/misc.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:myafyahub/presentation/health_diary/screening_tools/widgets/screening_tools_banner.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';

class ScreeningToolsListPage extends StatelessWidget {
  const ScreeningToolsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: screeningToolsPageTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            smallVerticalSizedBox,
            SvgPicture.asset(
              screeningToolsImage,
              height: 150,
            ),
            smallVerticalSizedBox,
            Center(
              child: Text(
                screeningToolsPageLongDescription,
                style: normalSize14Text(
                  AppColors.secondaryColor.withOpacity(0.6),
                ),
              ),
            ),
            smallVerticalSizedBox,
            ScreeningToolsBanner(
              title: violenceTitle,
              description: violenceDescription,
              onTap: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackbar(content: comingSoonText));
              },
            ),
            ScreeningToolsBanner(
              title: contraceptiveTitle,
              description: contraceptiveDescription,
              onTap: () => Navigator.pushNamed(
                context,
                AppRoutes.contraceptiveAssessmentPage,
              ),
            ),
            ScreeningToolsBanner(
              title: tuberculosisTitle,
              description: tuberculosisDescription,
              onTap: () => Navigator.pushNamed(
                context,
                AppRoutes.tuberculosisAssessmentPage,
              ),
            ),
            ScreeningToolsBanner(
              title: healthTitle,
              description: healthDescription,
              onTap: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackbar(content: comingSoonText));
              },
            ),
          ],
        ),
      ),
    );
  }
}
