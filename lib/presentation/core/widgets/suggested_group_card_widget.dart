// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

/// [SuggestedGroupCard] is a shared widget used in [SuggestedGroupsSection]
///
/// It takes in required [groupIconUrl], [groupTitle] and [groupTotalMembers] parameters

class SuggestedGroupCard extends StatelessWidget {
  const SuggestedGroupCard({
    Key? key,
    required this.groupIconUrl,
    required this.groupTitle,
    required this.groupTotalMembers,
  }) : super(key: key);
  final String groupIconUrl;
  final String groupTitle;
  final String groupTotalMembers;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
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
              child: ClipOval(
                child: Image.network(
                  groupIconUrl,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            verySmallVerticalSizedBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                groupTitle,
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
                groupTotalMembers,
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
                SnackBar(
                  content: Text(groupTitle),
                  duration: const Duration(seconds: 2),
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
      ),
    );
  }
}
