import 'package:flutter/material.dart';
import 'package:shared_themes/spaces.dart';

class ProfileImageItem extends StatelessWidget {
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
          borderRadius: BorderRadius.circular(5.0),
          child: Image.asset(
            imageUrl,
            height: 50.0,
            width: 50.0,
          ),
        ),
      ],
    );
  }
}
