import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/my_afya_hub_app_bar.dart';
import 'package:myafyahub/presentation/my_health/pages/my_health_diary_page.dart';

import '../../../mocks.dart';

void main() {
  testWidgets('MyHealthDiaryPage renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MyHealthDiaryPage(
        diaryItems: mockDiaryItems,
        month: 'August 2021',
      ),
    ));
    expect(find.byType(MyAfyaHubAppBar), findsOneWidget);
    expect(find.text('$mehString!'), findsOneWidget);
    expect(find.text(sadString), findsNWidgets(3));
    expect(find.text(happyString), findsOneWidget);
  });
}
