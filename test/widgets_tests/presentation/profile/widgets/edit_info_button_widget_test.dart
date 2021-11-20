// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/profile/pages/edit_information_page.dart';
import 'package:myafyahub/presentation/profile/widgets/edit_info_button_widget.dart';
import '../../../../test_helpers.dart';

void main() {
  group('EditInfoButtonWidget', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders EditInformation page when clicked',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: EditInformationButtonWidget(
          editInformationItem: careGiverEditInfo,
        ),
      );

      await tester.tap(find.byType(EditInformationButtonWidget));
      await tester.pumpAndSettle();

      expect(find.byType(EditInformationPage), findsOneWidget);
    });

    testWidgets('adds spacing to the last item if type is dropdown',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: EditInformationButtonWidget(
          editInformationItem: careGiverEditInfo,
        ),
      );

      await tester.tap(find.byType(EditInformationButtonWidget));
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.byType(SizedBox).last);

      expect(
        (tester.firstWidget(find.byType(SizedBox).last) as SizedBox).height,
        26.0,
      );
    });

    testWidgets('dropdown button renders a list', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: EditInformationButtonWidget(
          editInformationItem: careGiverEditInfo,
        ),
      );

      await tester.tap(find.byType(EditInformationButtonWidget));
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.byType(DropdownButtonHideUnderline));
      await tester.tap(find.byType(DropdownButtonHideUnderline));
      await tester.pumpAndSettle();

      await tester.tap(find.text(father).last);
      await tester.pumpAndSettle();

      expect(
        find.text(father),
        findsOneWidget,
      );
    });

    testWidgets('adds spacing to the last item if type is text',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: EditInformationButtonWidget(
          editInformationItem: nickNameEditInfo,
        ),
      );

      await tester.tap(find.byType(EditInformationButtonWidget));
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.byType(SizedBox).last);

      expect(
        (tester.firstWidget(find.byType(SizedBox).last) as SizedBox).height,
        26.0,
      );
    });

    testWidgets('Save button navigates on click', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: EditInformationButtonWidget(
          editInformationItem: nickNameEditInfo,
        ),
      );

      await tester.tap(find.byType(EditInformationButtonWidget));
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.byType(MyAfyaHubPrimaryButton));
      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(EditInformationPage), findsNothing);
    });
  });
}
