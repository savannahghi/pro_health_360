import 'package:flutter/material.dart';

import 'package:app_wrapper/app_wrapper.dart';

class AppTheme {
  static ThemeData getAppTheme(List<AppContext> contexts) {
    return ThemeData(
        fontFamily: 'Raleway',
        primaryColor: AppColors.themeColors['primaryColor'],
        primaryColorDark: AppColors.themeColors['primaryDark'],
        accentColor: AppColors.themeColors['accentColor'],
        backgroundColor: AppColors.themeColors['backgroundColor'],
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: AppColors.themeColors['textSelectionColor'],
        )).copyWith(
      pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          }),
    );
  }
}

class AppColors {
  static const Color accentColor = Color.fromARGB(255, 188, 197, 50);
  static const Color backgroundGreyColor = Color(0xFFF4F4F6);
  static const Color blackColor = Color(0xFF000000);
  static const Color cyanColor = Color(0xFF98DDE7);
  static const Color darkGreenColor = Color(0xFF388E3C);
  static const Color darkGreyColor = Color(0xFF9B9B9B);
  static const Color darkOrangeColor = Color(0xFFFFA000);
  static const Color greenColor = Color(0xFF50C878);
  static const Color greyColor = Color(0xFF828282);
  static const Color greyTextColor = Color(0xff7D8D9C);
  static const Color greySeparatorColor = Color(0xfff3f5f9);
  static const Color inputFieldColor = Color(0xFFF0F3FE);
  static const Color lightBlueColor = Color(0xFFBCE0FA);
  static const Color lightGreyColor = Color(0xFFF7F7F7);
  static const Color lightPurpleCardBackground = Color(0xFFF6F7FB);
  static const Color lightPurpleCardBorder = Color(0xFFC6BAD7);
  static const Color lightPurpleTextColor = Color(0xFF596D8A);
  static const Color lightRed = Color(0xFFFFE6E6);
  static const Color lightSkyBlueColor = Color(0xFFF6F7FB);
  static const Color primaryColor = Color.fromARGB(255, 0, 163, 167);
  static const Color secondaryColor = Color.fromARGB(255, 22, 20, 74);
  static const Color primaryColorLite = Color(0xFFF2E8FF);
  static const Color redColor = Color(0xFFE41518);
  static const Map<String, Color> themeColors = <String, Color>{
    'primaryColor': primaryColor,
    'primaryDark': primaryColor,
    'accentColor': accentColor,
    'backgroundColor': Color(0xFFF4F6FA),
    'textSelectionColor': Color(0xff0e2153),
  };
  static const Color superLightGreyColor = Color(0xFFF2F2F2);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color darkGreyTextColor = Color(0xFF797979);
  static const Color lightPurpleBackgroundColor = Color(0xffE2E0F6);

  static const Color introductionBackgroundColor = Color(0xFFF7F8FF);
  static const Color listCardColor = Color(0xffeeeeee);
  static const Color diaryListCardColor = Color(0xff17d1d4);
  static const Color timeLineBackroundColor = Color(0xfff6f6f6);
}
