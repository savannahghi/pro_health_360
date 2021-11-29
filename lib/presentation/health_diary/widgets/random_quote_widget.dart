// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';

class RandomQuoteWidget extends StatelessWidget {
  const RandomQuoteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.srcOver,
          ),
          fit: BoxFit.cover,
          image: const AssetImage(moodSelectionBackgroundUrl),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SvgPicture.asset(leftQuoteSVGUrl, height: 32),
          smallVerticalSizedBox,
          Text(
            randomQuoteText,
            style: TextThemes.boldSize18Text(Colors.white),
          ),
          smallVerticalSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                randomQuoteAuthor,
                style: TextThemes.normalSize14Text(AppColors.greyTextColor)
                    .copyWith(fontStyle: FontStyle.italic),
              ),
              SvgPicture.asset(rightQuoteSVGUrl, height: 32),
            ],
          ),
        ],
      ),
    );
  }
}
