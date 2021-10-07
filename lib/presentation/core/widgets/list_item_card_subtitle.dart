// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/list_item_card_text.dart';

/// [CardSubTitle] is a shared widget to display description on the [ListItemCard] widget
///
/// It takes in a required [text] parameters

class CardSubTitle extends StatelessWidget {
  const CardSubTitle({
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            paperClipIcon,
            color: AppColors.greyTextColor,
            width: 12,
            height: 12,
          ),
          const SizedBox(
            width: 2,
          ),
          ListItemCardText(bodyText: text),
        ],
      ),
    );
  }
}
