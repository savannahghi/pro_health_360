// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';

class MedicalDataPage extends StatelessWidget {
  const MedicalDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: medicalDataPageTitle),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GenericErrorWidget(
            headerIconSvgUrl: zeroMedicalDataSvgPath,
            actionKey: helpNoDataWidgetKey,
            actionText: okThanksText,
            recoverCallback: () {
              Navigator.of(context).pop();
            },
            messageTitle: noMedicalDataString,
            messageBody: <TextSpan>[
              TextSpan(
                text: noMedicalDataBodyString,
                style: normalSize16Text(
                  AppColors.greyTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
