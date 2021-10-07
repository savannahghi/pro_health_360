// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';

class ProfileHealthDetailsWidget extends StatelessWidget {
  ///[ProfileHealthDetailsWidget] displays profile health details widget
  final String svgPath;
  final String title;
  final String descriptionSubScript;
  final String description;

  const ProfileHealthDetailsWidget({
    required this.svgPath,
    required this.title,
    required this.description,
    required this.descriptionSubScript,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SvgPicture.asset(
                  svgPath,
                  width: 15,
                  height: 15,
                ),
                verySmallHorizontalSizedBox,
                Text(
                  title,
                  style: TextThemes.normalSize14Text(AppColors.secondaryColor),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: RichText(
                  text: TextSpan(
                      text: description,
                      style: TextThemes.veryBoldSize32Text(
                          AppColors.secondaryColor),
                      children: <TextSpan>[
                        TextSpan(
                          text: descriptionSubScript,
                          style: TextThemes.normalSize14Text(
                              AppColors.secondaryColor),
                        )
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
