import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/presentation/profile/widgets/my_health_timeline.dart';

void main() {
  group('MyHealthTimeline', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: MyHealthTimeline(),
      ));
      expect(find.text('My Health Timeline'), findsOneWidget);
    });
  });
}
