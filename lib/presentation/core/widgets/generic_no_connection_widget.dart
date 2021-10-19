// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

/// [GenericNoConnection] used when there is no internet connection
/// todo(dexter) -> implement connectivity to make this widget usable
class GenericNoConnection extends StatelessWidget {
  const GenericNoConnection({
    Key? key,
    required this.route,
    required this.payload,
  }) : super(key: key);

  final Map<String, dynamic> payload;
  final String route;

  Future<void> retryFunction(BuildContext context) async {
    await Navigator.pushReplacementNamed(context, route, arguments: payload);
  }

  @override
  Widget build(BuildContext context) {
    const double _imageHeight = 100.0;
    const double _imageWidth = 100.0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Image(
            height: _imageHeight,
            width: _imageWidth,
            image: const AssetImage(noConnectionImgUrl),
            color: Theme.of(context).primaryColor,
          ),
        ),
        smallVerticalSizedBox,
        Center(
          child: Column(
            children: <Widget>[
              Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'No internet connection',
                      style: TextThemes.boldSize18Text(AppColors.primaryColor),
                    ),
                    const TextSpan(text: '\n\n'),
                    TextSpan(
                      text:
                          'Sorry, you do not seem to have an internet connection.'
                          ' Please reconnect and try again',
                      style: TextThemes.normalSize14Text(AppColors.blackColor),
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              smallVerticalSizedBox,
              SILPrimaryButton(
                text: 'Retry',
                buttonColor: AppColors.primaryColor,
                onPressed: () => retryFunction(context),
              )
            ],
          ),
        ),
      ],
    );
  }
}
