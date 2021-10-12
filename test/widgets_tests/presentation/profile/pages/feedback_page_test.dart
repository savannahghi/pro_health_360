import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/my_afya_hub_app_bar.dart';
import 'package:myafyahub/presentation/profile/pages/feedback_page.dart';

void main() {
  testWidgets('FeedbackPage should render correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return const FeedbackPage();
            },
          ),
        ),
      ),
    );
    expect(find.byType(MyAfyaHubAppBar), findsWidgets);

    final Finder sendRequestButton = find.byKey(sendFeedbackButtonKey);
    final Finder cancelRequestButton = find.byKey(cancelFeedbackButtonKey);
    final Finder yesRadioButton = find.byKey(yesRadioButtonKey);
    final Finder noRadioButton = find.byKey(noRadioButtonKey);
    expect(sendRequestButton, findsOneWidget);
    expect(cancelRequestButton, findsOneWidget);
    expect(yesRadioButton, findsOneWidget);
    expect(noRadioButton, findsOneWidget);

    await tester.ensureVisible(sendRequestButton);
    await tester.tap(yesRadioButton);
    await tester.tap(sendRequestButton);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text(comingSoonText), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    await tester.ensureVisible(cancelRequestButton);
    await tester.tap(noRadioButton);
    await tester.tap(cancelRequestButton);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text(comingSoonText), findsOneWidget);
  });
}
