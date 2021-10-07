// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:misc_utilities/number_constants.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/onboarding_page_header.dart';

/// [OnboardingScaffold] Page is where a user inputs their phone number and PIN and press `Continue` to Logging

typedef OnBackPressType = void Function(BuildContext context);

const double dimension = 100;

class OnboardingScaffold extends StatefulWidget {
  const OnboardingScaffold({
    Key? key,
    required this.child,
    this.showBackArrow = false,
    this.backRoute,
  }) : super(key: key);

  final Widget child;
  final bool showBackArrow;
  final String? backRoute;

  @override
  _OnboardingScaffoldState createState() => _OnboardingScaffoldState();
}

class _OnboardingScaffoldState extends State<OnboardingScaffold> {
  SliverPersistentHeader _buildSliverAppBar(BuildContext context) {
    return SliverPersistentHeader(
      // Allows the user to reveal the app bar if they begin scrolling
      // back up the list of items.
      floating: true,
      pinned: true,
      delegate: OnboardingPageHeader(
        minExtent:
            isSmallScreenAndOnLandscape(context: context) ? 50 : number100,
        maxExtent: isSmallScreenAndOnLandscape(context: context)
            ? number100
            : number200,
        showBackArrow: widget.showBackArrow,
        backRoute: widget.backRoute,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
