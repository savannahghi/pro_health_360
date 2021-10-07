// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/suggested_group_card_widget.dart';

/// [SuggestedGroupsSection] is a widget used in the Feed Page
///
/// It takes in a required [suggestedGroups] parameter which is a List of
/// the suggested groups or communities a user can join

class SuggestedGroupsSection extends StatelessWidget {
  final List<Map<String, dynamic>> suggestedGroups;
  const SuggestedGroupsSection({
    Key? key,
    required this.suggestedGroups,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      color: Theme.of(context).backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              suggestedGroupsString,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: AppColors.secondaryColor),
            ),
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
              itemCount: suggestedGroups.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final String title =
                    suggestedGroups.elementAt(index)['title'].toString();
                final String totalMembers =
                    suggestedGroups.elementAt(index)['totalMembers'].toString();
                final String iconUrl =
                    suggestedGroups.elementAt(index)['iconUrl'].toString();
                return Column(
                  children: <Widget>[
                    SuggestedGroupCard(
                        groupIconUrl: iconUrl,
                        groupTitle: title,
                        groupTotalMembers: totalMembers)
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
