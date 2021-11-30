import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class ReactionItem extends StatelessWidget {
  const ReactionItem({required this.iconUrl, required this.count});

  final int? count;
  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            iconUrl,
            width: 20,
            height: 20,
            color: AppColors.greyTextColor,
          ),
          verySmallHorizontalSizedBox,
          Text(
            count != 0 ? count.toString() : '0',
            style: TextThemes.normalSize12Text(AppColors.greyTextColor),
          )
        ],
      ),
    );
  }
}