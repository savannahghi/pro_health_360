// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/text_themes.dart';

class TextFormHintText extends StatelessWidget {
  const TextFormHintText({
    required this.hintText,
    bool? isRequired,
  }) : isRequired = isRequired ?? false;

  final String hintText;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    if (isRequired) {
      return Row(
        children: <Widget>[
          HintText(hintText: hintText),
          Flexible(
            child: Text('*', style: TextThemes.heavySize20Text(redAccent)),
          )
        ],
      );
    }

    return HintText(hintText: hintText);
  }
}

class HintText extends StatelessWidget {
  const HintText({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Text(
      hintText,
      style: TextThemes.heavySize18Text(subtitleGrey),
    );
  }
}
