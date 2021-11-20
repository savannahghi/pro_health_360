// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/profile/pages/settings_page.dart';

void main() {
  testWidgets('ClinicInformationPage renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SettingsPage()));

    expect(find.byType(CustomAppBar), findsOneWidget);
    expect(find.text(editString), findsOneWidget);
  });
}
