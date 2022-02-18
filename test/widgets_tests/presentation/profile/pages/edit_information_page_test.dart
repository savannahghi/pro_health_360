// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/custom_text_field.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/profile/pages/edit_information_page.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import '../../../../test_helpers.dart';

void main() {
  group('EditInformationPage', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('button is activated only when a field is entered',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return RawMaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.editInformationPage,
                  arguments: <String, dynamic>{
                    'editInformationItem': nickNameEditInfo('Test'),
                  },
                );
              },
            );
          },
        ),
      );
      await tester.tap(find.byType(RawMaterialButton));
      await tester.pumpAndSettle();

      expect(find.byType(EditInformationPage), findsOneWidget);

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(
        (tester.firstWidget(find.byType(MyAfyaHubPrimaryButton))
                as MyAfyaHubPrimaryButton)
            .buttonColor,
        Colors.grey,
      );

      final Finder nickNameInputField = find.byType(CustomTextField);
      expect(find.byType(CustomTextField), findsOneWidget);

      await tester.showKeyboard(nickNameInputField);
      await tester.enterText(nickNameInputField, 'Test');
      await tester.pumpAndSettle();

      expect(
        (tester.firstWidget(find.byType(MyAfyaHubPrimaryButton))
                as MyAfyaHubPrimaryButton)
            .buttonColor,
        AppColors.secondaryColor,
      );

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();
      expect(find.byType(EditInformationPage), findsOneWidget);
    });
  });
}
