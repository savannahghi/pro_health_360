// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_localizations/flutter_localizations.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';

final List<LocalizationsDelegate<dynamic>> localizationDelegates =
    <LocalizationsDelegate<dynamic>>[
  const OnboardingStringsDelegate(),
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate
];

final List<Locale> locales = <Locale>[const Locale('en', '')];

class OnboardingStringsDelegate
    extends LocalizationsDelegate<OnboardingStrings> {
  const OnboardingStringsDelegate();

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  Future<OnboardingStrings> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of OnboardingStrings
    return SynchronousFuture<OnboardingStrings>(OnboardingStrings(locale));
  }

  @override
  bool shouldReload(OnboardingStringsDelegate old) => false;
}
