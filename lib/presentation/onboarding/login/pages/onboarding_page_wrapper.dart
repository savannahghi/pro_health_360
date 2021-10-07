// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/small_appbar.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/number_constants.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class OnboardingPageWrapper extends StatelessWidget {
  const OnboardingPageWrapper({
    Key? key,
    required this.child,
    required this.title,
    required this.svgPath,
    required this.description,
    this.previousRoute,
    this.hasAppBar = false,
  }) : super(key: key);

  final Widget child;
  final String description;
  final bool hasAppBar;
  final String svgPath;
  final String title;
  final String? previousRoute;

  @override
  Widget build(BuildContext context) {
    final bool? isFirstTimeChangePin = StoreProvider.state<AppState>(context)!
        .userProfileState!
        .auth!
        .isChangePin;

    return Scaffold(
      appBar: hasAppBar ? SILSmallAppBar(title: title) : null,
      body: Center(
        child: SingleChildScrollView(
          key: onboardingSingleChildKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              children: <Widget>[
                if (!isSmallScreenAndOnLandscape(context: context))
                  Container(
                    key: onboardingContainerKey,
                    width: number150,
                    height: number150,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lightPurpleBackgroundColor),
                    child: Center(
                      child: SvgPicture.asset(svgPath, width: 80, height: 80),
                    ),
                  ),
                if (title != '') ...<Widget>[
                  largeVerticalSizedBox,
                  Text(
                    title,
                    style: TextThemes.mediumSize20Text(),
                  ),
                ],
                if (description != '') ...<Widget>[
                  size15VerticalSizedBox,
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextThemes.boldSize14Text(Colors.grey),
                  )
                ],
                largeVerticalSizedBox,
                size15VerticalSizedBox,
                child,
                size15VerticalSizedBox,
                if (previousRoute != null && isFirstTimeChangePin != true)
                  SILNoBorderButton(
                    buttonKey: onboardingNoBorderButtonKey,
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, previousRoute!),
                    text: OnboardingStrings.of(context)!.previousText(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
