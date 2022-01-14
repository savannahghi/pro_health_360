// Flutter imports:
import 'package:afya_moja_core/inputs.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/custom_text_field.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/profile/edit_information_item.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/profile/pages/edit_information_page.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import '../../../../mocks.dart';
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
                  BWRoutes.editInformationPage,
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

      await tester.showKeyboard(nickNameInputField.first);
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

    testWidgets('should show description if available',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: EditInformationPage(
          onSubmit: () {},
          editInformationItem: EditInformationItem(
            title: 'test',
            editInformationInputItem: <EditInformationInputItem>[
              preferredCommunicationInputItem
            ],
            description: 'test description',
          ),
        ),
      );
      await tester.pump();

      expect(find.text('test description'), findsOneWidget);
    });

    testWidgets('should show dropdown if available',
        (WidgetTester tester) async {
      late EditInformationItem savedItem;

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: EditInformationPage(
          onSubmit: (EditInformationItem item) {
            savedItem = item;
          },
          editInformationItem: EditInformationItem(
            title: 'test',
            editInformationInputItem: <EditInformationInputItem>[
              preferredCommunicationInputItem
            ],
            description: 'test description',
          ),
        ),
      );
      await tester.pump();

      final Finder dropdownValue = find.byType(EditInformationDropDown);
      await tester.ensureVisible(dropdownValue.first);
      await tester.tap(dropdownValue);
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const ValueKey<String>(whatsAppText)).first);
      await tester.pumpAndSettle();

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      // TODO: Better test once api is available
      expect(
        savedItem.editInformationInputItem.first,
        preferredCommunicationInputItem,
      );
    });
  });
}
