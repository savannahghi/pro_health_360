// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Package imports:
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';

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
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
            moodIcon,
          ),
          smallVerticalSizedBox,
          Text(
            moodText,
            style: const TextStyle(color: white),
          ),
        ],
      ),
    );
  }
}
