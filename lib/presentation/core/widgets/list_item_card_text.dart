import 'package:flutter/material.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

/// [ListItemCardText] is a shared widget to display items on the [CardSubTitle] widget
///
/// It takes in a required [bodyText] parameter

class ListItemCardText extends StatelessWidget {
  const ListItemCardText({Key? key, required this.bodyText}) : super(key: key);

  final String bodyText;

  @override
  Widget build(BuildContext context) {
    return Text(
      bodyText,
      style: const TextStyle(
        color: AppColors.greyTextColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
