// Flutter imports:
import 'package:afya_moja_core/text_themes.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';

class ScreeningToolsBanner extends StatelessWidget {
  final String title;
  final String description;
  final Function onTap;

  const ScreeningToolsBanner({
    Key? key,
    required this.title,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.purpleChillColor.withOpacity(0.14),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: AppColors.purpleChillColor.withOpacity(0.3),
          ),
        ),
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Text column
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: boldSize18Text(),
                  ),
                  smallVerticalSizedBox,
                  Text(
                    description,
                    style: normalSize14Text(
                      AppColors.secondaryColor.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
