// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';

class MoreMenuDropDown extends StatelessWidget {
  ///
  /// [MoreMenuDropDown] used within the community chat screen to provide more options.
  ///
  const MoreMenuDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      key: popupMenuButtonKey,
      onSelected: (int result) async {
        switch (result) {
          case 1:

            /// Notify user
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('$exitGroupText $comingSoonText'),
              ),
            );
            break;
          case 2:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('$groupInfoText  $comingSoonText'),
              ),
            );
            break;
          default:
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        PopupMenuItem<int>(
          key: groupInfoMenuItemKeyKey,
          value: 2,
          child: Text(
            groupInfoText,
            style: TextThemes.normalSize14Text(),
          ),
        ),
        PopupMenuItem<int>(
          key: exitGroupMenuItemKeyKey,
          value: 1,
          child: Text(exitGroupText, style: TextThemes.normalSize14Text()),
        ),
      ],
      child: const Icon(Icons.more_vert),
    );
  }
}
