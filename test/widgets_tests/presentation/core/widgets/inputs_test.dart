// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:afya_moja_core/inputs.dart';

void main() {
  group('ExpandableQuestion', () {
    const String question = 'Where do you live ?';
    const String hintText = 'Answer here';
    testWidgets('should render correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(builder: (BuildContext context) {
          return Material(
              child: ExpandableQuestion(
            question: question,
            hintText: hintText,
            onChanged: (String value) {},
          ));
        }),
      ));
      expect(find.text(question), findsWidgets);
      final Finder expansionTile = find.byType(ExpansionTile);
      expect(expansionTile, findsOneWidget);

      await tester.tap(expansionTile);
      await tester.pumpAndSettle();

      final Finder textFormField = find.byType(TextFormField);
      expect(textFormField, findsOneWidget);
      await tester.showKeyboard(textFormField);
      await tester.enterText(textFormField, 'text');
      await tester.pumpAndSettle();
    });

    testWidgets(
        'should throw assertion error if both controller and initialValue'
        ' are not null', (WidgetTester tester) async {
      final TextEditingController controller = TextEditingController();

      Future<void> pump() async {
        await tester.pumpWidget(
          Material(
            child: ExpandableQuestion(
              question: question,
              hintText: hintText,
              onChanged: (String value) {},
              controller: controller,
              initialValue: '',
            ),
          ),
        );
      }

      expect(pump(), throwsAssertionError);
    });

    testWidgets('should have grey fill color if form is not enabled',
        (WidgetTester tester) async {
      const Key fieldKey = Key('field-key');
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ExpandableQuestion(
              enabled: false,
              fieldKey: fieldKey,
              initialValue: '',
              onChanged: (String value) {},
              question: question,
            ),
          ),
        ),
      );

      final Finder expansionTile = find.byType(ExpansionTile);
      expect(expansionTile, findsOneWidget);

      await tester.tap(expansionTile);
      await tester.pumpAndSettle();

      final TextField formField =
          tester.widget<TextField>(find.byType(TextField));
      expect(formField.decoration?.fillColor, Colors.grey[200]);
    });
  });
}
