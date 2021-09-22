import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui_components/buttons.dart';

void main() {
  group('Theme tests', () {
    testWidgets('should test AppTheme class and getAppTheme method',
        (WidgetTester tester) async {
      await tester.pumpWidget(
          MaterialApp(home: Builder(builder: (BuildContext context) {
        return SILPrimaryButton(onPressed: () {
          AppTheme.getAppTheme(testAppContexts);
        });
      })));
      final Finder silPrimaryButton = find.byType(SILPrimaryButton);
      expect(silPrimaryButton, findsOneWidget);
      expect(AppTheme.getAppTheme(testAppContexts).accentColor,
          AppColors.themeColors['accentColor']);
      await tester.tap(silPrimaryButton);
      await tester.pumpAndSettle();
    });
  });
}
