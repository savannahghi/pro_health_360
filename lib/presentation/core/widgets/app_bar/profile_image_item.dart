// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';

/// [ProfileImageItem] used within [MyAfyaHubAppBar] to display profile image.
class ProfileImageItem extends StatelessWidget {
  /// [ProfileImageItem] used within [MyAfyaHubAppBar] to display circular profile image.
  ///
  /// [imageUrl] is required.
  ///
  const ProfileImageItem({
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        smallHorizontalSizedBox,
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.asset(
            imageUrl,
            height: 38.0,
            width: 38.0,
          ),
        ),
      ],
    );
  }
}
