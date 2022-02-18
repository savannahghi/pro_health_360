import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/presentation/health_diary/screening_tools/widgets/screening_tools_banner.dart';

void main() {
  testWidgets(
    'should show screening tools banner',
    (WidgetTester tester) async {
      bool onTapCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: ScreeningToolsBanner(
                title: 'screen',
                description: 'me',
                onTap: () {
                  onTapCalled = !onTapCalled;
                },
              ),
            ),
          ),
        ),
      );

      expect(onTapCalled, false);
      expect(find.byType(ScreeningToolsBanner), findsOneWidget);
      expect(find.text('screen'), findsOneWidget);
      expect(find.text('me'), findsOneWidget);

      // tap the banner and expect a function to be called
      await tester.tap(find.byType(ScreeningToolsBanner));
      await tester.pumpAndSettle();

      expect(onTapCalled, true);

      await tester.tap(find.byType(ScreeningToolsBanner));
      await tester.pumpAndSettle();

      expect(onTapCalled, false);
    },
  );
}
