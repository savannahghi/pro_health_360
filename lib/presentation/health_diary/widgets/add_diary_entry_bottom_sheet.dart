// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class DiaryAddSheet extends StatelessWidget {
  const DiaryAddSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.07,
      minChildSize: 0.07,
      maxChildSize: 0.21,
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
              color: AppColors.whiteColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                verySmallVerticalSizedBox,
                Container(
                  height: 4,
                  width: 140,
                  color: Colors.grey[300],
                ),
                smallVerticalSizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      Icons.add_box_outlined,
                      color: AppColors.secondaryColor,
                      size: 18,
                    ),
                    verySmallHorizontalSizedBox,
                    Text(
                      addDiaryString,
                      textAlign: TextAlign.center,
                      style: TextThemes.normalSize11Text(
                        AppColors.secondaryColor,
                      ).copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                mediumVerticalSizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          width: 50,
                          decoration: BoxDecoration(
                            color: AppColors.listCardColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset(
                            textIconSvgPath,
                            height: 30,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        verySmallVerticalSizedBox,
                        Text(
                          textString,
                          textAlign: TextAlign.center,
                          style: TextThemes.normalSize11Text(
                            AppColors.secondaryColor,
                          ),
                        ),
                        mediumVerticalSizedBox,
                      ],
                    ),
                    veryLargeHorizontalSizedBox,
                    Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          width: 50,
                          decoration: BoxDecoration(
                            color: AppColors.listCardColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset(
                            happyMoodIconSvgPath,
                            height: 30,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        verySmallVerticalSizedBox,
                        Text(
                          feelingString,
                          textAlign: TextAlign.center,
                          style: TextThemes.normalSize11Text(
                            AppColors.secondaryColor,
                          ),
                        ),
                        mediumVerticalSizedBox,
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
