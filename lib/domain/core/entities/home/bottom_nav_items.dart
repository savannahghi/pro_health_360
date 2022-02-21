// Project imports:
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class BottomNavItem {
  const BottomNavItem({
    required this.iconUrl,
    required this.text,
    required this.onTapRoute,
    required this.index,
    this.onTapRouteArguments,
  });

  final String iconUrl;
  final int index;
  final String onTapRoute;
  final Map<String, dynamic>? onTapRouteArguments;
  final String text;
}

enum BottomNavIndex { home, feed, communities, myHealth }

List<BottomNavItem> bottomNavItems = <BottomNavItem>[
  BottomNavItem(
    iconUrl: homeIconSvgPath,
    text: 'Home',
    onTapRoute: AppRoutes.home,
    index: BottomNavIndex.home.index,
  ),
  BottomNavItem(
    iconUrl: feedIconSvgPath,
    text: 'Feed',
    onTapRoute: AppRoutes.feedPage,
    index: BottomNavIndex.feed.index,
  ),
  BottomNavItem(
    iconUrl: communityIconSvgPath,
    text: 'Communities',
    onTapRoute: AppRoutes.communityListView,
    index: BottomNavIndex.communities.index,
  ),
  BottomNavItem(
    iconUrl: myHealthIconSvgPath,
    text: 'My Health',
    onTapRoute: AppRoutes.myHealthPage,
    index: BottomNavIndex.myHealth.index,
  ),
];
