// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/core/services/utils.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/profile/pages/edit_information_page.dart';
import 'package:myafyahub/presentation/profile/widgets/edit_info_button_widget.dart';
import 'package:myafyahub/presentation/router/routes.dart';
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
        widget: Builder(
          builder: (BuildContext context) {
            return EditInformationButtonWidget(
              onTap: () {
                Navigator.of(context).pushNamed(
                  BWRoutes.editInformationPage,
                  arguments: <String, dynamic>{
                    'editInformationItem': preferredLanguageEditInfo,
                  },
                );
              },
            );
          },
        ),
      );

      await tester.tap(find.byType(EditInformationButtonWidget));
      await tester.pumpAndSettle();

      expect(find.byType(EditInformationPage), findsOneWidget);
    });
  });
}
