// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';

class TextFieldLabel extends StatelessWidget {
  const TextFieldLabel({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        label,
        style: const TextStyle(color: AppColors.greyColor),
      ),
    );
  }
}
