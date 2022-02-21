// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class ErrorAlertBox extends StatelessWidget {
  const ErrorAlertBox({required this.message, this.actionSpan});

  final TextSpan? actionSpan;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: errorAlertBoxKey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.lightRed.withOpacity(0.8),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: RichText(
        key: errorAlertBoxTextKey,
        text: TextSpan(
          style: normalSize14Text(
            AppColors.blackColor.withOpacity(0.6),
          ),
          children: <TextSpan>[
            TextSpan(text: message),
            if (actionSpan != null) actionSpan!,
          ],
        ),
      ),
    );
  }
}
