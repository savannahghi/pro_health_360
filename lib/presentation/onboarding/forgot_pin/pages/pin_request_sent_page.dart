import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class PinRequestSentPage extends StatelessWidget {
  const PinRequestSentPage();

  @override
  Widget build(BuildContext context) {
    return PINRequestScaffold(
      iconSvgPath: pinRequestSentImage,
      title: pinResetRequestSent,
      message: '$weHaveNotifiedAdmin\n\n$oncePinRest',
      actionText: okThanksText,
      actionCallback: () {
        Navigator.of(context).pushNamed(AppRoutes.phoneLogin);
      },
    );
  }
}
