import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/presentation/profile/hotline/pages/hotlines_page.dart';
import 'package:pro_health_360/presentation/profile/hotline/widgets/helpline_items_widget.dart';

void main() {
  testWidgets(
    'HotlinesPage should render the correct number of helplines',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: HotlinesPage())),
      );

      expect(find.byType(HelplineItemsWidget), findsOneWidget);
      expect(find.byType(MyAfyaHubPrimaryButton), findsNWidgets(7));

      await tester.tap(find.byType(MyAfyaHubPrimaryButton).first);
      await tester.pumpAndSettle();
      // We can't have expectations here because the launch
      //of the tel: is handled by the OS and is out of the context of the app

      /// Verify at least one helpline is visible
      expect(find.text('National Police SGBV Hotline'), findsOneWidget);
      expect(find.text('0800730999'), findsOneWidget);
      expect(
        find.text(
          'The national police helpline for reporting sexual gender-based'
          ' violence cases',
        ),
        findsOneWidget,
      );
    },
  );
}
