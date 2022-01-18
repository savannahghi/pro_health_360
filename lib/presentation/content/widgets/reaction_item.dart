// Flutter imports:
import 'package:afya_moja_core/text_themes.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';

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
            (count != 0 && count != null) ? count.toString() : '0',
            style: normalSize12Text(AppColors.greyTextColor),
          )
        ],
      ),
    );
  }
}
