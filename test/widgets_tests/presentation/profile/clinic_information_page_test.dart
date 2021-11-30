// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/profile/clinic_information/clinic_information_item_widget.dart';
import 'package:myafyahub/presentation/profile/clinic_information/clinic_information_page.dart';

void main() {
  testWidgets('ClinicInformationPage renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ClinicInformationPage(),
      ),
    );
    expect(find.byType(ClinicInformationItemWidget), findsNWidgets(3));

    await tester.tap(find.byKey(hotlineCallButtonKey));
    expect(find.byType(ClinicInformationPage), findsWidgets);
  });
}
