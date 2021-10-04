import 'package:flutter/material.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/text_themes.dart';

class MedicalDataItemTitle extends StatelessWidget {
  const MedicalDataItemTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextThemes.boldSize12Text(AppColors.secondaryColor),
      ),
    );
  }
}
