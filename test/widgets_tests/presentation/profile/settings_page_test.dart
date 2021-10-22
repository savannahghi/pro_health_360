import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/profile/pages/settings_page.dart';

void main() {
  testWidgets('ClinicInformationPage renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SettingsPage()));

    expect(find.byType(CustomAppBar), findsOneWidget);
    expect(find.text('John Doe'), findsOneWidget);
  });
}
