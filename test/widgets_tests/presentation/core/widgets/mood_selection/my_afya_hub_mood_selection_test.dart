import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/widgets/my_afya_hub_mood_selection.dart';

void main() {
  group('MyAfyaHubMoodSelection', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      const String user = 'Wanjiku';
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Center(
            child: Builder(builder: (BuildContext context) {
              return MyAfyaHubMoodSelection(
                user: user,
                onTap: () {},
              );
            }),
          ),
        ),
      ));

      expect(find.text(howAreYoufeelingTodayText(user)), findsOneWidget);
      await tester.tap(find.text(excitedString));
      await tester.pumpAndSettle();
    });
  });
}
