// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

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
  });
}
