// Flutter imports:
import 'package:afya_moja_core/text_themes.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';
// Package imports:

class MedicalDataItem extends StatelessWidget {
  const MedicalDataItem({
    required this.data,
    this.description,
    this.customWidth,
  });

  final String data;
  final String? description;
  final double? customWidth;

  @override
  Widget build(BuildContext context) {
    final double width = customWidth ?? MediaQuery.of(context).size.width * 0.8;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            data,
            style: normalSize14Text(AppColors.greyTextColor),
          ),
          if (description != null)
            Text(
              description!,
              style: normalSize10Text(AppColors.primaryColor),
            )
        ],
      ),
    );
  }
}
