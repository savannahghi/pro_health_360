// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:unicons/unicons.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/login/onboarding_behavior_subject.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/onboarding_scaffold.dart';

/// provide a custom title and description by calling OnboardingAppBarValuesSubject().<property>.add(value)
class OnboardingPageHeader implements SliverPersistentHeaderDelegate {
  OnboardingPageHeader({
    required this.minExtent,
    this.backRoute,
    required this.showBackArrow,
    required this.maxExtent,
  });

  final bool showBackArrow;
  String? backRoute;

  @override
  final double minExtent;

  @override
  final double maxExtent;

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration(
        stretchTriggerOffset: maxExtent,
        onStretchTrigger: () async {},
      );

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  TickerProvider? get vsync => null;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  Container _appBarCircle(BuildContext context) {
    return Container(
      width: dimension * 5,
      height: dimension * 5,
      decoration: BoxDecoration(
        color: AppColors.blackColor.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
    );
  }

  double titleOpacity(double shrinkOffset) {
    // simple formula: fade out text as soon as shrinkOffset > 0
    return 1.0 - max(0.0, shrinkOffset) / maxExtent;
    // more complex formula: starts fading out text when shrinkOffset > minExtent
    //return 1.0 - max(0.0, (shrinkOffset - minExtent)) / (maxExtent - minExtent);
  }

  void backNavigationFunction(BuildContext context) {
    Navigator.pushNamed(context, backRoute!);
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final Color color = AppColors.whiteColor
        .withOpacity(titleOpacity(shrinkOffset > 120 ? 110 : shrinkOffset));
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(color: Theme.of(context).primaryColor),
        Positioned(
          right: -dimension,
          top: -dimension * 4,
          child: _appBarCircle(context),
        ),
        Positioned(
          right: -dimension * 3,
          top: -dimension * 3,
          child: _appBarCircle(context),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Colors.transparent, Colors.black38],
              stops: <double>[0.1, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        Positioned(
          left: dimension / 5,
          right: dimension / 5,
          bottom: dimension / 5 + 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (showBackArrow == true)
                IconButton(
                  key: onboardingScaffoldBackButton,
                  icon: const Icon(UniconsLine.arrow_left),
                  onPressed: () => backNavigationFunction(context),
                  color: color,
                  padding: const EdgeInsets.fromLTRB(0, 10, 15, 10),
                  alignment: Alignment.centerLeft,
                ),
              mediumVerticalSizedBox,
              Text(
                OnboardingAppBarValuesSubject().title.valueOrNull!,
                style: TextThemes.boldSize24Text(color),
              ),
              smallVerticalSizedBox,
              Text(
                OnboardingAppBarValuesSubject().description.valueOrNull!,
                style: TextThemes.normalSize14Text(color),
              )
            ],
          ),
        ),
      ],
    );
  }
}
