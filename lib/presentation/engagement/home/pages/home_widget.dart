// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:myafyahub/presentation/core/widgets/my_afya_hub_mood_selection.dart';
import 'package:myafyahub/presentation/core/widgets/new_content.dart';
import 'package:myafyahub/presentation/core/widgets/suggested_groups_section_widget.dart';
import 'package:myafyahub/presentation/engagement/home/widgets/bewell_upgrader.dart';
import 'package:myafyahub/presentation/feed/feed_details.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    final List<FeedDetails> feedItems = <FeedDetails>[
      FeedDetails(
        coverImageUrl: feedImage1,
        header: feedHeaderListSavedVideo,
        date: '21 Oct 2021',
        authorName: 'Ken Doe',
        bodyContent: defactoZeroStateString(),
        authorDisplayPic:
            'https://cloudcannon.com/blog/uploads/george-photo.jpg',
      ),
      FeedDetails(
        coverImageUrl: feedImage2,
        header: feedHeaderListSavedVideo,
        date: '21 Oct 2021',
        authorName: 'Ken Doe',
        bodyContent: defactoZeroStateString(),
        type: FeedType.Video,
      )
    ];

    // this is dummy data. it should be removed once the backend is integrated
    final List<Map<String, dynamic>> suggestedGroups = <Map<String, dynamic>>[
      <String, dynamic>{
        'iconUrl': 'https://wallpaperaccess.com/full/2213426.jpg',
        'title': 'Kilimani',
        'totalMembers': '1.3k Members',
      },
      <String, dynamic>{
        'iconUrl': 'https://wallpaperaccess.com/full/2213426.jpg',
        'title': 'Ruaraka',
        'totalMembers': '1.3k Members',
      },
      <String, dynamic>{
        'iconUrl': 'https://wallpaperaccess.com/full/2213426.jpg',
        'title': 'Ruaraka',
        'totalMembers': '1.3k Members',
      },
      <String, dynamic>{
        'iconUrl': 'https://wallpaperaccess.com/full/2213426.jpg',
        'title': 'Ruaraka',
        'totalMembers': '1.3k Members',
      }
    ];

    return AppScaffold(
      appBar: const CustomAppBar(showBackButton: false),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          BeWellUpgrader(),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: MyAfyaHubMoodSelection(),
          ),
          NewContent(feedItems: feedItems),
          SuggestedGroupsSection(suggestedGroups: suggestedGroups)
        ],
      ),
    );
  }
}
