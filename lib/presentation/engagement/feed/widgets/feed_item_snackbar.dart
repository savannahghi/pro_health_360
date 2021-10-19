// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';

enum ItemActionType { resolve, pin, hide, unhide, unpin }

SnackBar getFeedItemActionSnackbar(
  IconData iconData,
  String text,
  int duration,
) {
  return SnackBar(
    content: Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                iconData,
                color: AppColors.whiteColor,
              ),
            ),
            verySmallHorizontalSizedBox,
            Text(text),
          ],
        ),
      ],
    ),
    duration: Duration(seconds: duration),
  );
}
