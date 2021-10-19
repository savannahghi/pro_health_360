// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';

class WheelBackButton extends StatelessWidget {
  final Function onPressed;
  final Color color;

  const WheelBackButton({
    Key? key,
    required this.onPressed,
    required this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: RawMaterialButton(
        key: backButtonToLanding,
        onPressed: () {
          onPressed();
        },
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        fillColor: color.withOpacity(0.1),
        child: Center(
          child: Icon(
            CupertinoIcons.back,
            color: color,
          ),
        ),
      ),
    );
  }
}
