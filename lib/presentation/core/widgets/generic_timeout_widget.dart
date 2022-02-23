// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';

/// [GenericTimeoutWidget] is called when a timeout has occurred when fetching data from the
/// API. It's purpose is to communicate a specific message, the server could not return a response in time
class GenericTimeoutWidget extends StatelessWidget {
  const GenericTimeoutWidget({
    Key? key,
    this.route,
    this.payload,
    required this.action,
    this.recoverCallback,
    this.recoverActionText,
  }) : super(key: key);

  final String action;
  final Map<String, dynamic>? payload;
  final String? recoverActionText;

  /// [recoverCallback] action to undertake to recover from the error
  final Function? recoverCallback;

  /// [route] the route to go back to when recovering from the timeout. This should be
  /// provided if [recoverCallback] is not provided otherwise an exception will be
  /// thrown
  final String? route;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: ListView(
        key: genericListViewKey,
        shrinkWrap: true,
        children: <Widget>[
          SvgPicture.asset(noDataImgUrl),
          smallVerticalSizedBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              getErrorMessage(action),
              textAlign: TextAlign.center,
              style: normalSize14Text(AppColors.blackColor),
            ),
          ),
          smallVerticalSizedBox,
          MyAfyaHubPrimaryButton(
            buttonKey: genericRetryButtonKey,
            buttonColor: AppColors.primaryColor,
            onPressed: recoverCallback != null
                ? recoverCallback as void Function()?
                : route != null
                    ? () async {
                        await Navigator.pushNamed(
                          context,
                          route!,
                          arguments: payload,
                        );
                      }
                    : () {},
            text: recoverActionText ?? 'Retry',
          ),
        ],
      ),
    );
  }
}
