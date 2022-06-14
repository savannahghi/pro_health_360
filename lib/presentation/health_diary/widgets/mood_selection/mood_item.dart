// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_themes/colors.dart';

class MoodItem extends StatelessWidget {
  const MoodItem({
    Key? key,
    required this.moodIcon,
    required this.moodText,
    required this.onTap,
  }) : super(key: key);

  final String moodIcon;
  final String moodText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width /5.8;
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
              moodIcon,
            ),
            smallVerticalSizedBox,
            Text(
              moodText,
              style: boldSize14Text(white).copyWith(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
