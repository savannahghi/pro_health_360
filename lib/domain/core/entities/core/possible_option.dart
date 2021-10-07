// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

class PossibleOption {
  PossibleOption({
    required this.iconUrl,
    required this.description,
    required this.route,
    required this.title,
  });

  String description;
  SvgPicture iconUrl;
  String route;
  String title;
}
