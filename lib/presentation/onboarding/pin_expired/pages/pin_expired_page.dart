import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class PinExpiredPage extends StatelessWidget {
  const PinExpiredPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PINRequestScaffold(
      iconSvgPath: pinExpiredImage,
      title: pinExpiredTitle,
      message: pinExpiredDescription,
      actionText: changePinCTA,
      actionCallback: () =>
          // This should kickstart the expire PIN workflow
          Navigator.of(context).pushReplacementNamed(AppRoutes.verifyPhone),
      actionKey: changeMyPinButtonKey,
    );
  }
}
