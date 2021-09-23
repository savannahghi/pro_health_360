import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_themes/text_themes.dart';

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final GlobalKey<IntroductionScreenState> introKey =
      GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, BWRoutes.landing, (Route<dynamic> route) => false);
  }

  Widget _buildFullScreenImage(String assetName) {
    return SvgPicture.asset(
      assetName,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.topCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    final TextStyle bodyStyle =
        TextThemes.normalSize16Text().copyWith(fontSize: 18);
    final TextStyle titleStyle =
        TextThemes.veryBoldSize22Text(primaryColor).copyWith(fontSize: 28);

    final PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: titleStyle,
      bodyTextStyle: bodyStyle,
      imagePadding: EdgeInsets.zero,
      pageColor: AppColors.introductionBackgroundColor,
      contentMargin: const EdgeInsets.symmetric(horizontal: 16),
      fullScreen: true,
      bodyFlex: 2,
      imageFlex: 3,
    );
    return Container(
      color: AppColors.introductionBackgroundColor,
      padding: const EdgeInsets.only(top: 15),
      child: SafeArea(
        child: IntroductionScreen(
            key: introKey,
            globalBackgroundColor: AppColors.introductionBackgroundColor,
            pages: <PageViewModel>[
              PageViewModel(
                title: introSliderFiveTitle,
                body: introSliderFiveDesc,
                image: _buildFullScreenImage(slideFiveImg),
                decoration: pageDecoration,
              ),
            ],
            onDone: () => _onIntroEnd(context),
            showSkipButton: true,
            skipFlex: 0,
            nextFlex: 0,
            skip: Text(
              introSkip,
              style: bodyStyle.copyWith(color: primaryColor),
            ),
            next: Icon(
              Icons.arrow_forward,
              color: primaryColor,
            ),
            done:
                Text(introDone, style: bodyStyle.copyWith(color: primaryColor)),
            curve: Curves.fastLinearToSlowEaseIn,
            controlsMargin: const EdgeInsets.all(16),
            controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            dotsDecorator: DotsDecorator(
              activeColor: primaryColor,
              size: const Size(10.0, 10.0),
              color: const Color(0xFFBDBDBD),
              activeSize: const Size(22.0, 10.0),
              activeShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            )),
      ),
    );
  }
}
