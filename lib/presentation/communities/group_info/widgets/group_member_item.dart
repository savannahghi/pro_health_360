import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';

class GroupMemberItem extends StatelessWidget {
  const GroupMemberItem({
    required this.userName,
    required this.memberID,
  });
  final String userName;
  final String memberID;

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
                    userName.trim()[0].toUpperCase(),
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
        ],
      ),
    );
  }
}
