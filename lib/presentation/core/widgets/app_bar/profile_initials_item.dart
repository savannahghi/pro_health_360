import 'package:flutter/material.dart';
import 'package:misc_utilities/misc.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

import '../../helpers.dart';

/// [ProfileInitialsItem] used within [MyAfyaHubAppBar] to display username initials.
class ProfileInitialsItem extends StatelessWidget {
  /// [ProfileInitialsItem] used within [MyAfyaHubAppBar] to display username initials.
  ///
  /// [firstName] and [lastName] are all required.
  ///
  /// than or equal to zero.
  const ProfileInitialsItem({
    required this.firstName,
    required this.lastName,
  });

  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      smallHorizontalSizedBox,
      Container(
        height: 50,
        width: 47,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: firstName.isEmpty
              ? Text(
                  'BW',
                  style: TextThemes.boldSize18Text()
                      .copyWith(color: AppColors.secondaryColor),
                )
              : Text(
                  extractNamesInitials(
                      name: getDisplayName(firstName, lastName)),
                  style: TextThemes.boldSize18Text()
                      .copyWith(color: AppColors.secondaryColor),
                ),
        ),
      ),
    ]);
  }
}
