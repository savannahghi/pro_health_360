// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/logout_action.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key, this.addBorder = false}) : super(key: key);

  final bool addBorder;

  @override
  Widget build(BuildContext context) {
    return MyAfyaHubNoBorderButton(
      buttonKey: logoutButtonKey,
      onPressed: () {
        StoreProvider.dispatch(
          context,
          LogoutAction(
            navigationCallback: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.phoneLogin,
                (Route<dynamic> route) => false,
              );
            },
          ),
        );
      },
      text: logoutButtonText,
      textColor: AppColors.redColor,
    );
  }
}
