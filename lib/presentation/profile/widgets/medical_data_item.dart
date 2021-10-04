import 'package:flutter/material.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/text_themes.dart';

class MedicalDataItem extends StatelessWidget {
  const MedicalDataItem({required this.data, this.description});

  final String data;
  final String? description;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.8;
    const Color itemDescriptionColor = Color(0xFF11DDDF);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
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
            style: TextThemes.normalSize14Text(AppColors.greyTextColor),
          ),
          if (description != null)
            Text(
              description!,
              style: TextThemes.normalSize10Text(itemDescriptionColor),
            )
        ],
      ),
    );
  }
}
