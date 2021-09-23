import 'package:myafyahub/domain/core/entities/home/bottom_nav_items.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Suggestion {
  Suggestion({
    required this.name,
    required this.route,
    required this.image,
    required this.description,
    required this.aliases,
    this.shouldUpdateBottomNav = false,
    this.bottomNavIndex,
  });

  List<String> aliases;
  int? bottomNavIndex;
  String description;
  SvgPicture image;
  String name;
  String route;
  bool shouldUpdateBottomNav;
}

List<Suggestion> searchSuggestions({required String searchParam}) {
  final List<Suggestion> suggestionResults = suggestions.where(
    (Suggestion suggestion) {
      final bool nameContainsParam = suggestion.name.contains(searchParam);
      final bool descriptionContainsParam =
          suggestion.description.contains(searchParam);
      final List<String> aliasFoundResults = suggestion.aliases
          .where(
            (String alias) => alias.contains(searchParam),
          )
          .toList();

      bool emptyAlias;
      if (aliasFoundResults.isNotEmpty) {
        emptyAlias = true;
      } else {
        emptyAlias = false;
      }

      /// return
      return nameContainsParam || descriptionContainsParam || emptyAlias;
    },
  ).toList();
  return suggestionResults;
}

List<Suggestion> recentSearches = <Suggestion>[
  //library
  Suggestion(
    name: libraryTitle,
    route: BWRoutes.home,
    image: SvgPicture.asset(scheduleSvgUrl, color: Colors.grey),
    description: 'View my library',
    aliases: <String>['lib', 'my library'],
    shouldUpdateBottomNav: true,
    bottomNavIndex: BottomNavIndex.library.index,
  ),
];

List<Suggestion> suggestions = <Suggestion>[
  //library
  Suggestion(
    name: libraryTitle,
    route: BWRoutes.home,
    image: SvgPicture.asset(scheduleSvgUrl, color: Colors.grey),
    description: 'View my library',
    aliases: <String>['lib', 'my library'],
    shouldUpdateBottomNav: true,
    bottomNavIndex: BottomNavIndex.library.index,
  ),

  //medicine
  Suggestion(
    name: medicine,
    route: BWRoutes.buyMedicine,
    image: SvgPicture.asset(scheduleSvgUrl, color: Colors.grey),
    description: 'Buy medicine',
    aliases: <String>[
      'meds',
      'medication',
      'medicine',
      'my medication',
      'my medicine'
    ],
  ),
  //tests
  Suggestion(
    name: tests,
    route: BWRoutes.getTested,
    image: SvgPicture.asset(scheduleSvgUrl, color: Colors.grey),
    description: 'Get Tested',
    aliases: <String>['test', 'tests', 'get test', 'tested'],
  ),
  //see a doctor
  Suggestion(
    name: seeDoctor,
    route: BWRoutes.seeDoctor,
    image: SvgPicture.asset(scheduleSvgUrl, color: Colors.grey),
    description: 'See a doctor',
    aliases: <String>[
      'doc',
      'doctor',
      'see doctor',
      'talk to doctor',
      'physician',
      'see a doctor'
    ],
  ),

  //help center
  Suggestion(
    name: helpCenter,
    route: BWRoutes.helpCenter,
    image: SvgPicture.asset(scheduleSvgUrl, color: Colors.grey),
    description: 'Help center',
    aliases: <String>[
      'help',
      'help center',
      'center',
      'need help',
      'FAQS',
      'faqs',
      'FAQ',
      'faq'
    ],
  ),
];
