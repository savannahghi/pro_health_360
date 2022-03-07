import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class ContraceptivesInformation extends StatelessWidget {
  const ContraceptivesInformation();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: RichText(
            text: TextSpan(
              text: providerWillContact,
              style: normalSize14Text(
                AppColors.greyTextColor,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ifNotContacted,
                  style: normalSize14Text(
                    AppColors.greyTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
