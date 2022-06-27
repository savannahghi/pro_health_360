// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/profile/caregiver_information.dart';
import 'package:pro_health_360/domain/core/entities/profile/edit_information_item.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/profile/pages/edit_information_page.dart';
import 'package:pro_health_360/presentation/profile/widgets/edit_info_button_widget.dart';
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
          editInformationItem: getEditCareGiverInfo(
            caregiverInformation: CaregiverInformation.initial(),
          ),
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
          editInformationItem: getEditCareGiverInfo(
            caregiverInformation: CaregiverInformation.initial(),
          ),
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
          editInformationItem: getEditCareGiverInfo(
            caregiverInformation: CaregiverInformation.initial(),
          ),
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
          submitFunction: (EditInformationItem editInformationItem) {},
          editInformationItem: EditInformationItem(
            title: nickNameString,
            editInformationInputItem: <EditInformationInputItem>[
              EditInformationInputItem(
                fieldName: relationText,
                hintText: relationText,
                inputType: EditInformationInputType.DropDown,
                inputController: TextEditingController(),
                dropdownValue: CaregiverType.FATHER.name,
                dropDownOptionList: CaregiverType.values
                    .map<String>((CaregiverType type) => type.name)
                    .toList(),
                apiFieldValue: 'caregiverType',
              ),
              nickNameInputItem('userNickName')
            ],
          ),
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
  });
}
