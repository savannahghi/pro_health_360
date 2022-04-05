import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';

class GroupMemberItem extends StatelessWidget {
  const GroupMemberItem({
    required this.userName,
    required this.memberID,
    this.isModerator = false,
  });

  final String userName;
  final String memberID;
  final bool isModerator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 38,
                width: 38,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.galleryColor,
                ),
                child: Center(
                  child: Text(
                    userName.isNotEmpty
                        ? userName.trim()[0].toUpperCase()
                        : 'U',
                    style: boldSize14Text(AppColors.primaryColor),
                  ),
                ),
              ),
              size15HorizontalSizedBox,
              Text(
                userName,
                style: boldSize12Text(),
              ),
            ],
          ),
          if (isModerator)
            Container(
              decoration: BoxDecoration(
                color: AppColors.greenHappyColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: AppColors.greenHappyColor.withOpacity(0.1),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: const Text(
                moderatorText,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColors.greenHappyColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
