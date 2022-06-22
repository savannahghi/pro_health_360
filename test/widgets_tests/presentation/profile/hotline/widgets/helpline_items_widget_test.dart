import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/domain/core/entities/core/helpline.dart';
import 'package:pro_health_360/presentation/profile/hotline/widgets/helpline_items_widget.dart';

void main() {
  testWidgets(
    'HelplineItem should render the correct number of helplines when '
    'passed',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: HelplineItemsWidget(
                helplines: <Helpline>[
                  Helpline(
                    title: 'Test Hotline',
                    phone: '1234',
                    description: 'A test hotline',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Test Hotline'), findsOneWidget);
      expect(find.byType(MyAfyaHubPrimaryButton), findsOneWidget);

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      // We can't have expectations here because the launch of the tel: is
      // handled by the OS and is out of the context of the app
    },
  );
}
