import 'package:flutter/material.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class GroupMemberItem extends StatelessWidget {
  const GroupMemberItem({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 17,
          color: AppColors.darkGreyColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
