// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:rxdart/rxdart.dart';
import 'package:unicons/unicons.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/profile_page_items.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class ProfileSubject {
  factory ProfileSubject() {
    return _singleton;
  }

  ProfileSubject._internal();

  BehaviorSubject<Color> color =
      BehaviorSubject<Color>.seeded(Colors.purple[100]!);

  BehaviorSubject<String> selectedTile =
      BehaviorSubject<String>.seeded(contactInfo);

  BehaviorSubject<ValueNotifier<ProfileItems>> selection =
      BehaviorSubject<ValueNotifier<ProfileItems>>.seeded(
    ValueNotifier<ProfileItems>(
      const ProfileItems(
        text: contactInfo,
        section: ProfileItemType.account,
        onTapRoute: BWRoutes.contactInfo,
        iconData: UniconsLine.user_circle,
      ),
    ),
  );

  static final ProfileSubject _singleton = ProfileSubject._internal();
}

class InternetConnectivitySubject {
  factory InternetConnectivitySubject() {
    return _singleton;
  }

  InternetConnectivitySubject._internal();

  BehaviorSubject<bool> connectivitySubject =
      BehaviorSubject<bool>.seeded(true);

  static final InternetConnectivitySubject _singleton =
      InternetConnectivitySubject._internal();
}

class DeepLinkSubject {
  factory DeepLinkSubject() {
    return _singleton;
  }

  DeepLinkSubject._internal();

  BehaviorSubject<bool> hasLink = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<String> link = BehaviorSubject<String>();
  GlobalKey<NavigatorState>? navigatorKey;

  static final DeepLinkSubject _singleton = DeepLinkSubject._internal();
}
