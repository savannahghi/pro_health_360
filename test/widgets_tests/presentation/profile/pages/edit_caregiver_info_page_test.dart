import 'package:afya_moja_core/inputs.dart';
import 'package:afya_moja_core/phone_input.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/profile/pages/edit_caregiver_info_page.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('EditCaregiverInfoPage', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should be able to edit last name',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const EditCaregiverInfoPage(),
      );
      await tester.pump();

      final Finder lastNameKey = find.byKey(const ValueKey<String>('1'));
      expect(lastNameKey, findsOneWidget);

      await tester.enterText(lastNameKey, 'test');
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(editInfoSaveBtn));
      await tester.pumpAndSettle();

      expect(store.state.miscState?.caregiverInformation?.lastName, 'test');
    });

    testWidgets('should be able to edit phone number',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const EditCaregiverInfoPage(),
      );
      await tester.pump();

      final Finder phoneInput = find.byType(MyAfyaHubPhoneInput);
      expect(phoneInput, findsOneWidget);

      await tester.enterText(phoneInput, '798363893');
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(editInfoSaveBtn));
      await tester.pumpAndSettle();

      expect(
        store.state.miscState?.caregiverInformation?.phoneNumber,
        '+254798363893',
      );
    });

    testWidgets('should be able to edit phone number',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const EditCaregiverInfoPage(),
      );
      await tester.pump();

      final Finder dropdownInput = find.byType(EditInformationDropDown);
      expect(dropdownInput, findsOneWidget);

      await tester.tap(dropdownInput);
      await tester.pumpAndSettle();

      final Finder dropdownValue = find.text('Mother');
      await tester.ensureVisible(dropdownValue.first);
      await tester.tap(dropdownValue.first);
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(editInfoSaveBtn));
      await tester.pumpAndSettle();

      expect(
        store.state.miscState?.caregiverInformation?.caregiverType,
        CaregiverType.Mother,
      );
    });
  });
}
