// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/communities/group.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

/// [SuggestedGroupCard] is a shared widget used in [SuggestedGroupsSection]
///
/// It takes in required [groupIconUrl], [groupTitle] and [groupTotalMembers] parameters

class SuggestedGroupCard extends StatelessWidget {
  const SuggestedGroupCard({Key? key, required this.group}) : super(key: key);

  final Group group;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          smallVerticalSizedBox,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: group.avatar != null &&
                    group.avatar!.isNotEmpty &&
                    group.avatar != UNKNOWN
                ? ClipOval(
                    child: Image.network(
                      group.avatar!,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  )
                : Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.whiteColor,
                    ),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor.withOpacity(0.3),
                      ),
                      child: Center(
                        child: Text(
                          group.name != null &&
                                  group.name!.isNotEmpty &&
                                  group.name != UNKNOWN
                              ? group.name![0]
                              : 'U',
                          style: boldSize16Text(
                            Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
          verySmallVerticalSizedBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              group.name ?? '',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.secondaryColor,
              ),
            ),
          ),
          verySmallVerticalSizedBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              '${group.memberCount} members',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.greyTextColor,
              ),
            ),
          ),
          verySmallVerticalSizedBox,
          RawMaterialButton(
            key: joinSuggestedGroupButtonKey,
            splashColor: AppColors.secondaryColor.withOpacity(0.2),
            highlightColor: Colors.transparent,
            elevation: 0,
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(comingSoonText),
                duration: Duration(seconds: 2),
              ),
            ),
            constraints: const BoxConstraints(minHeight: 25, minWidth: 80),
            fillColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: const BorderSide(
                color: AppColors.secondaryColor,
              ),
            ),
            child: const Text(
              joinString,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.secondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
