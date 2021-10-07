// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/my_afya_hub_app_bar.dart';
import 'package:myafyahub/presentation/my_health/pages/my_health_diary_page.dart';
void main() {
  testWidgets('MyHealthDiaryPage renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MyHealthDiaryPage(),
    ));
    expect(find.byType(MyAfyaHubAppBar), findsOneWidget);
    expect(find.text('$mehString!'), findsOneWidget);
    expect(find.text(sadString), findsNWidgets(3));
    expect(find.text(happyString), findsOneWidget);
  });
}
