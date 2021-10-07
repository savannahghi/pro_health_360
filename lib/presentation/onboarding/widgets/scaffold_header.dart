// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/presentation/onboarding/widgets/wheel_back_button.dart';

class ScaffoldHeader extends StatelessWidget {
  final String title;
  final String description;
  final Function backFunc;

  const ScaffoldHeader({
    Key? key,
    required this.title,
    required this.description,
    required this.backFunc,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        mediumVerticalSizedBox,
        WheelBackButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            backFunc();
          },
        ),
        mediumVerticalSizedBox,
        Text(
          title,
          style: TextThemes.heavySize28Text(Theme.of(context).primaryColor),
        ),
        smallVerticalSizedBox,
        Text(
          description,
          style: TextThemes.boldSize16Text(),
        ),
        mediumVerticalSizedBox,
      ],
    );
  }
}
