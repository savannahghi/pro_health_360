// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/onboarding/landing_page/landing_page_actions.dart';

/// [LandingPage] page is where a user selects if they want to `Login`,
/// `Sign Up`
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OnboardingStrings onboardingStrings = OnboardingStrings.of(context)!;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(landingBackgroundImg),
          ),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.transparent,
                AppColors.whiteColor.withOpacity(0.6),
                AppColors.whiteColor
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                    veryLargeVerticalSizedBox,
                    largeVerticalSizedBox,
                    Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor.withOpacity(0.5),
                          shape: BoxShape.circle),
                      child: SvgPicture.asset(transparentLogo),
                    ),
                    veryLargeVerticalSizedBox,

                    /// ------
                    Text(
                      landingPageTitle,
                      style: TextThemes.veryHeavySize20Text(
                              Theme.of(context).primaryColor)
                          .copyWith(fontSize: 22),
                    ),
                    smallVerticalSizedBox,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        onboardingStrings.landingPageSubtitleText(),
                        textAlign: TextAlign.center,
                        style: TextThemes.normalSize16Text(),
                      ),
                    ),
                    veryLargeVerticalSizedBox,

                    veryLargeVerticalSizedBox,
                    const LandingPageActions()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
