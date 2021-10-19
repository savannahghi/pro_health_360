// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';

// Project imports:
import 'package:myafyahub/presentation/profile/pages/clinic_information_page.dart';
import 'package:myafyahub/presentation/profile/widgets/clinic_information_item_widget.dart';

void main() {
  testWidgets('ClinicInformationPage renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ClinicInformationPage(),
    ));
    expect(find.byType(ClinicInformationItemWidget), findsNWidgets(3));

    await tester.tap(find.byKey(hotlineCallButtonKey));
    expect(find.byType(ClinicInformationPage), findsWidgets);
  });
}
