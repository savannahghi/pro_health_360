import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/my_afya_hub_primary_button.dart';
import 'package:myafyahub/presentation/profile/pages/settings_page.dart';

void main() {
  testWidgets('ClinicInformationPage renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SettingsPage(),
    ));
    expect(find.byType(CustomAppBar), findsOneWidget);

    await tester.tap(find.byType(MyAfyaHubPrimaryButton));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text(comingSoonText), findsOneWidget);
  });
}
