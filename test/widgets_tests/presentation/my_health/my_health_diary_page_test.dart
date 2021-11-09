// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/my_health/pages/my_health_diary_page.dart';

void main() {
  testWidgets('MyHealthDiaryPage renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MyHealthDiaryPage(),
      ),
    );
    expect(find.byType(CustomAppBar), findsOneWidget);

    final Finder previousButton = find.byKey(previousButtonKey);
    final Finder nextButton = find.byKey(nextButtonKey);

    expect(previousButton, findsOneWidget);
    expect(nextButton, findsOneWidget);

    await tester.ensureVisible(previousButton);
    await tester.pumpAndSettle();
    await tester.tap(previousButton);
    await tester.pumpAndSettle();
    expect(find.text(sadString), findsNWidgets(2));

    await tester.ensureVisible(nextButton);
    await tester.pumpAndSettle();
    await tester.tap(nextButton);
    await tester.pumpAndSettle();
    expect(find.text(sadString), findsNothing);
  });
}
