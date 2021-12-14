import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';

class PlaceHolderImage extends StatelessWidget {
  const PlaceHolderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      placeholderImageUrl,
    );
  }
}
