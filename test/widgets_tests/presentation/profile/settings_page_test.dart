// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/custom_text_field.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/profile/pages/edit_information_page.dart';
import 'package:myafyahub/presentation/profile/settings/settings_page.dart';
import 'package:myafyahub/presentation/profile/widgets/edit_info_button_widget.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('SettingsPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: SettingsPage(),
      );

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(find.text(editString), findsOneWidget);
    });

    testWidgets('navigates to Edit Information page',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: SettingsPage(),
      );

      expect(find.byType(CustomAppBar), findsOneWidget);
      await tester.tap(find.byType(EditInformationButtonWidget));
      await tester.pumpAndSettle();
      expect(find.byType(EditInformationPage), findsOneWidget);
    });

    testWidgets('Sets a user nickname', (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'setNickName': true,
              'fetchRecentContent': contentMock,
            }
          }),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: SettingsPage(),
      );

      expect(find.byType(CustomAppBar), findsOneWidget);
      await tester.tap(find.byType(EditInformationButtonWidget));
      await tester.pumpAndSettle();
      expect(find.byType(EditInformationPage), findsOneWidget);

      final Finder nickNameInputField = find.byType(CustomTextField);
      expect(find.byType(CustomTextField), findsOneWidget);

      await tester.showKeyboard(nickNameInputField);
      await tester.enterText(nickNameInputField, 'Test nickname');
      await tester.pumpAndSettle();

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();
      expect(find.byType(EditInformationPage), findsNothing);
      expect(store.state.clientState!.user!.username, 'Test nickname');
    });

    testWidgets('original nickname is returned to state incase of an error',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'errors': <Object>[
              <String, dynamic>{
                'message': '4: error',
              }
            ]
          }),
          401,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: SettingsPage(),
      );

      expect(find.byType(CustomAppBar), findsOneWidget);
      await tester.tap(find.byType(EditInformationButtonWidget));
      await tester.pumpAndSettle();
      expect(find.byType(EditInformationPage), findsOneWidget);

      final Finder nickNameInputField = find.byType(CustomTextField);
      expect(find.byType(CustomTextField), findsOneWidget);

      await tester.showKeyboard(nickNameInputField);
      await tester.enterText(nickNameInputField, 'Test nickname');
      await tester.pumpAndSettle();

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();
      expect(find.byType(EditInformationPage), findsNothing);
      expect(store.state.clientState!.user!.username, UNKNOWN);
    });
  });
}
