// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:unicons/unicons.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/profile/pages/contact_details.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class ProfileItems {
  const ProfileItems({
    required this.text,
    required this.onTapRoute,
    required this.section,
    required this.iconData,
    this.onTapRouteArguments,
    this.isFlagged = false,
    this.tabletWidget,
  });

  final String? onTapRoute;
  final Map<String, dynamic>? onTapRouteArguments;
  final ProfileItemType section;
  final String text;
  final bool isFlagged;
  final IconData iconData;
  final Widget? tabletWidget;
}

enum ProfileItemType {
  account,
  legal,
}
List<ProfileItems> profileItems = <ProfileItems>[
  ProfileItems(
    text: contactInfo,
    section: ProfileItemType.account,
    onTapRoute: BWRoutes.contactInfo,
    iconData: UniconsLine.user_circle,
    tabletWidget: BuildContactProvider(),
  ),
  const ProfileItems(
    text: changePINSettings,
    section: ProfileItemType.account,
    onTapRoute: BWRoutes.resumeWithPin,
    iconData: UniconsLine.key_skeleton,
  ),
  const ProfileItems(
    text: termsOfServiceSettings,
    section: ProfileItemType.legal,
    onTapRoute: BWRoutes.webView,
    iconData: UniconsLine.file_check_alt,
  ),
];
