// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/inputs/country_code_picker.dart';

void main() {
  group('SilCountryPicker', () {
    testWidgets('should render SilCountryPicker ', (WidgetTester tester) async {
      final Widget testWidget = MaterialApp(
        home: Builder(builder: (BuildContext context) {
          return Scaffold(
            body: SizedBox(
              child: MyAfyaHubCountryPicker(
                onChanged: (String val) {},
              ),
            ),
          );
        }),
      );
      await tester.pumpWidget(testWidget);
      final Finder countryPicker = find.byType(MyAfyaHubCountryPicker);
      final Finder detector = find.byType(GestureDetector);
      final Finder selectCountry = find.byKey(selectCountryKey);

      await tester.pumpAndSettle();
      expect(countryPicker, findsOneWidget);
      expect(detector, findsOneWidget);
      expect(selectCountry, findsOneWidget);

      await tester.tap(selectCountry);
      await tester.pumpAndSettle();

      expect(find.byType(ListTile), findsNWidgets(6));
      await tester.tap(find.byType(ListTile).first);
      await tester.pumpAndSettle();
    });
  });
}
