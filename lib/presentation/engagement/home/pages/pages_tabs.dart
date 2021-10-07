// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:myafyahub/presentation/community/community_list_page.dart';
import 'package:myafyahub/presentation/engagement/home/pages/feed_page.dart';
import 'package:myafyahub/presentation/engagement/library/library.dart';

final List<Widget> pagesTabs = <Widget>[
  const FeedPage(),
  Library(),
  const CommunityListViewPage(),
  const CommunityListViewPage(),
  const CommunityListViewPage(),
];
