// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/presentation/core/theme/theme.dart';

void main() {
  group('Theme tests', () {
    testWidgets('should test AppTheme class and getAppTheme method',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return MyAfyaHubPrimaryButton(
                onPressed: () {
                  AppTheme.getAppTheme();
                },
              );
            },
          ),
        ),
      );
      final Finder silPrimaryButton = find.byType(MyAfyaHubPrimaryButton);
      expect(silPrimaryButton, findsOneWidget);
      expect(
        AppTheme.getAppTheme().colorScheme.secondary,
        AppColors.themeColors.accentColor,
      );
      await tester.tap(silPrimaryButton);
      await tester.pumpAndSettle();
    });
  });
}
