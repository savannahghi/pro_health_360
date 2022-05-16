// Flutter imports:
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      fontFamily: 'Sora',
      primaryColor: AppColors.themeColors.primaryColor,
      primaryColorDark: AppColors.themeColors.primaryDark,
      colorScheme: ColorScheme.light(
        primary: AppColors.themeColors.primaryColor,
        secondary: AppColors.themeColors.accentColor,
      ),
      backgroundColor: AppColors.themeColors.backgroundColor,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: AppColors.themeColors.textSelectionColor,
      ),
    ).copyWith(
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AppColors.primaryColor,
          textStyle: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class AppColors {
  static const Color accentColor = Color(0xFFF79E25);
  static const Color blackColor = Color(0xFF000000);
  static const Color cyanColor = Color(0xFF98DDE7);
  static const Color darkGreenColor = Color(0xFF388E3C);
  static const Color darkGreyColor = Color(0xFF9B9B9B);
  static const Color darkOrangeColor = Color(0xFFFFA000);
  static const Color greenColor = Color(0xFF50C878);
  static const Color greyColor = Color(0x28FF8282);
  static const Color greyTextColor = Color(0xFF707070);
  static const Color greySeparatorColor = Color(0xfff3f5f9);
  static const Color inputFieldColor = Color(0xFFF0F3FE);
  static const Color lightBlueColor = Color(0xFFBCE0FA);
  static const Color lightGreyColor = Color(0xFFF7F7F7);
  static const Color lightPurpleCardBackground = Color(0xFFF6F7FB);
  static const Color lightPurpleCardBorder = Color(0xFFC6BAD7);
  static const Color lightPurpleTextColor = Color(0xFF596D8A);
  static const Color lightRed = Color(0xFFFFE6E6);
  static const Color lightSkyBlueColor = Color(0xFFF6F7FB);
  static const Color primaryColor = Color(0xFF9269AD);
  static const Color secondaryColor = Color.fromARGB(255, 22, 20, 74);
  static const Color primaryColorLite = Color(0xFFF2E8FF);
  static const Color redColor = Color(0xFFE41518);
  static const Color lightRedTextColor = Color(0xFFFF888B);
  static const Color purpleChillColor = Color(0xFF9269AD);
  static const Color javaColor = Color(0xFF17D1D4);
  static const Color lightBlackTextColor = Color(0xFF555555);
  static const Color galleryColor = Color(0xFFEBEBEB);
  static const Color resumeWithPinTitleColor = Color(0xFF2F3946);
  static const Color lightGrey = Color(0xFF696979);
  static const Color orangeColor = Color(0xFFF0997A);

  static ThemeColors themeColors = ThemeColors(
    primaryColor,
    primaryColor,
    accentColor,
    lightGreyBackgroundColor,
    const Color(0xff0e2153),
  );
  static const Color warningColor = Color(0xFFE09B2D);
  static const Color superLightGreyColor = Color(0xFFF2F2F2);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color darkGreyTextColor = Color(0xFF797979);
  static const Color circularErrorBackgroundColor = Color(0xFF323059);
  static const Color lightPurpleBackgroundColor = Color(0xffE2E0F6);
  static const Color altCardBackgroundColor = Color(0xFFD0E8E6);
  static const Color introductionBackgroundColor = Color(0xFFF7F8FF);
  static const Color listCardColor = Color(0xffeeeeee);
  static const Color diaryListCardColor = Color(0xff17d1d4);
  static const Color lightGreyBackgroundColor = Color(0xfff6f6f6);
  static const Color userDetailsCardBackgroundColor = Color(0xff119496);
  static const Color userInitialsColor = Color(0xff11dddf);
  static const Color hotlineBackgroundColor = Color(0xffff7a7a);
  static const Color wrongPinTextColor = Color(0xffff642A);
  static const Color darkGreyBackgroundColor = Color(0xffebebeb);
  static const Color greenHappyColor = Color(0xFF00BE33);
  static const Color mehMoodColor = Color(0xFF857C00);
  static const Color timelineDotColor = Color(0xFF06103B);
  static const Color selectedBottomNavColor = Color(0xFFF79E25);
  static const Color readTimeBackgroundColor = Color(0xff4c4c4c);
  static const Color unSelectedReactionBackgroundColor = Color(0xffeaebf4);
  static const Color unSelectedReactionIconColor = Color(0xff697489);
  static const Color selectedReactionBackgroundColor = Color(0xfffeeced);
  static const Color reactionIconRedColor = Color(0xfff75b60);
  static const Color inputGreyColor = Color(0xfff4f4f4);
  static const Color verySadColor = Color(0xffFF642A);
  static const Color extraLightGray = Color(0xffF2F2F2);
  static const Color coralColor = Color(0xffff8c54);
}

class ThemeColors {
  final Color primaryColor;
  final Color primaryDark;
  final Color accentColor;
  final Color backgroundColor;
  final Color textSelectionColor;

  ThemeColors(
    this.primaryColor,
    this.primaryDark,
    this.accentColor,
    this.backgroundColor,
    this.textSelectionColor,
  );
}
