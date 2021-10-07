// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/profile/pages/clinic_information_page.dart';
import 'package:myafyahub/presentation/profile/widgets/clinic_information_item_widget.dart';

void main() {
  testWidgets('ClinicInformationPage renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ClinicInformationPage(
          contactNumber: hotlineNumberString,
          CHV: 'Name',
          treatmentBuddy: 'Name',
          keyProvider: 'Name'),
    ));
    expect(find.byType(ClinicInformationItemWidget), findsNWidgets(3));
  });
}
