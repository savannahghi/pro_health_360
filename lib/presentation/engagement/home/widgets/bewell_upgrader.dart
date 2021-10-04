import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

class BeWellUpgrader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Only call clearSavedSettings() during testing to reset internal values.
    Upgrader().clearSavedSettings(); // REMOVE this for release builds

    // On Android, setup the Appcast.
    // On iOS, the default behavior will be to use the App Store version of
    // the app, so update the Bundle Identifier in example/ios/Runner with a
    // valid identifier already in the App Store.
    const String appCastURL = 'https://bewell.co.ke/consumer-appcast.xml';
    final AppcastConfiguration cfg =
        AppcastConfiguration(url: appCastURL, supportedOS: <String>['android']);

    return UpgradeAlert(
      appcastConfig: cfg,
      dialogStyle: UpgradeDialogStyle.cupertino,
      child: const SizedBox(),
    );
  }
}
