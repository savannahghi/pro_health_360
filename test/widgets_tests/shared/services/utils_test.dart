// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/auth_status_action.dart';
import 'package:myafyahub/application/redux/actions/update_client_profile_action.dart';
import 'package:myafyahub/application/redux/actions/update_pin_input_details_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';
import '../../../test_utils.dart';

@GenerateMocks(
  <Type>[],
  customMocks: <MockSpec<dynamic>>[
    MockSpec<GraphQlClient>(as: #BaseGraphQlClient)
  ],
)
void main() {
  FlutterConfig.loadValueForTesting(<String, String>{
    'DEV_SENTRY_DNS': 'test_dev_sentry_dns',
    'PROD_SENTRY_DNS': 'test_prod_sentry_dns',
    'DEV_STREAM_API_KEY': 'dev_stream_api_key',
    'DEMO_STREAM_API_KEY': 'demo_stream_api_key',
    'PROD_STREAM_API_KEY': 'prod_stream_api_key',
  });

  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());
  final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

  group('Utils', () {
    testWidgets('should get the correct display name from state',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      late String actualNameFromState;
      store.dispatch(
        UpdateUserProfileAction(
          firstName: 'Test',
          lastName: 'Name',
        ),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              buttonKey: const Key('get_first_name_Key'),
              onPressed: () {
                actualNameFromState = getDisplayName(
                  store.state.clientState!.user,
                );
              },
            );
          },
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('get_first_name_Key')));
      await tester.pumpAndSettle();

      expect(actualNameFromState, 'Test Name');
    });

    testWidgets('should show UNKNOWN if there is no display name from state',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      const String expectedDefaultName = 'UNKNOWN UNKNOWN';
      late String actualNameFromState;

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (BuildContext context) {
                  return MyAfyaHubPrimaryButton(
                    buttonKey: const Key('get_first_name_Key'),
                    onPressed: () {
                      actualNameFromState =
                          getDisplayName(store.state.clientState!.user);
                    },
                  );
                },
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('get_first_name_Key')));
      await tester.pumpAndSettle();

      expect(expectedDefaultName, actualNameFromState);
    });

    testWidgets('should show a toast', (WidgetTester tester) async {
      const Key showToastKey = Key('show_toast');
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: MyAfyaHubPrimaryButton(
                buttonKey: showToastKey,
                onPressed: () {
                  showToast('Some random toast message');
                },
              ),
            ),
          ),
        ),
      );

      expect(find.byType(MyAfyaHubPrimaryButton), findsOneWidget);
      expect(find.byKey(showToastKey), findsOneWidget);

      // tap the button to show the toast
      await tester.tap(find.byKey(showToastKey));
      await fireEvent(tester);
    });

    testWidgets(
        'showFeedbackBottomSheet close button should close bottom sheet',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              onPressed: () {
                showFeedbackBottomSheet(
                  context: context,
                  modalContent: 'Test',
                  imageAssetPath: errorIconUrl,
                );
              },
            );
          },
        ),
      );
      await tester.pump();

      final Finder primaryBtn = find.byType(MyAfyaHubPrimaryButton);
      expect(primaryBtn, findsOneWidget);
      await tester.tap(primaryBtn);
      await tester.pumpAndSettle();

      expect(find.text('Test'), findsOneWidget);

      final Finder closeKey = find.byKey(feedbackBottomSheetCloseIconKey);
      expect(closeKey, findsOneWidget);
      await tester.tap(closeKey);
      await tester.pumpAndSettle();

      expect(find.text('Test'), findsNothing);
    });

    group('showAlertSnackBar test', () {
      testWidgets('should showAlertSnackBar', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: Builder(
                  builder: (BuildContext context) {
                    return MyAfyaHubPrimaryButton(
                      buttonKey: const Key('snackbar_button'),
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackbar(content: 'hey'));
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('snackbar_button')));
        await tester.pumpAndSettle();
        expect(find.text('hey'), findsOneWidget);
      });

      testWidgets('should showAlertSnackBar with default message',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: Builder(
                  builder: (BuildContext context) {
                    return MyAfyaHubPrimaryButton(
                      buttonKey: const Key('snackbar_button'),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          snackbar(
                            content: getErrorMessage(),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('snackbar_button')));
        await tester.pumpAndSettle();
        expect(find.text(getErrorMessage()), findsOneWidget);
      });
    });
  });

  group('humanizeDate', () {
    testWidgets('displays correct date', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: Builder(
          builder: (BuildContext context) {
            return humanizeDate(
              dateTextStyle: normalSize12Text(AppColors.darkGreyColor),
              loadedDate: '2012-02-27 13:27:00',
              showTime: true,
            );
          },
        ),
      );

      await tester.pump();
      expect(find.byType(Row), findsOneWidget);
      expect(find.text('27 Feb 2012 at 1:27 PM'), findsOneWidget);
    });

    testWidgets('fails to display time', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: Builder(
          builder: (BuildContext context) {
            return humanizeDate(
              dateTextStyle: normalSize12Text(AppColors.darkGreyColor),
              loadedDate: '2012-02-27 13:27:00',
            );
          },
        ),
      );

      await tester.pump();
      expect(find.byType(Row), findsOneWidget);
      expect(find.text('27 Feb 2012'), findsOneWidget);
    });
  });

  group('shouldInputPIN', () {
    late bool testBool;
    store.dispatch(
      AuthStatusAction(
        signedInTime:
            DateTime.now().subtract(const Duration(minutes: 30)).toString(),
      ),
    );
    testWidgets(
        'should return false if difference between current time and signed in time is greater than 20 minutes',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: StoreConnector<AppState, AppState>(
            converter: (Store<AppState> store) {
              return store.state;
            },
            builder: (BuildContext context, AppState appState) {
              return MaterialApp(
                home: Scaffold(
                  body: Builder(
                    builder: (BuildContext context) {
                      return Center(
                        child: MyAfyaHubPrimaryButton(
                          buttonKey: const Key('update_contacts'),
                          onPressed: () {
                            testBool = shouldInputPIN(context);
                          },
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.byKey(const Key('update_contacts')));
      await tester.pumpAndSettle();
      expect(testBool, true);

      store.dispatch(
        UpdatePINInputDetailsAction(
          healthPagePINInputTime:
              DateTime.now().subtract(const Duration(minutes: 30)).toString(),
        ),
      );
      await tester.tap(find.byKey(const Key('update_contacts')));
      await tester.pumpAndSettle();
      expect(testBool, true);

      store.dispatch(
        UpdatePINInputDetailsAction(
          healthPagePINInputTime:
              DateTime.now().subtract(const Duration(minutes: 10)).toString(),
        ),
      );
      await tester.tap(find.byKey(const Key('update_contacts')));
      await tester.pumpAndSettle();
      expect(testBool, false);

      store.dispatch(
        AuthStatusAction(
          signedInTime: UNKNOWN,
        ),
      );
      await tester.tap(find.byKey(const Key('update_contacts')));
      await tester.pumpAndSettle();
      expect(testBool, false);
    });
  });

  group('reportErrorToSentry', () {
    testWidgets('sends to sentry', (WidgetTester tester) async {
      final MockShortSILGraphQlClient client =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'data': null}),
          201,
        ),
      );
      late bool errorReported = false;
      store.dispatch(UpdateClientProfileAction(isSignedIn: true));
      await buildTestWidget(
        tester: tester,
        store: store,
        client: client,
        widget: Builder(
          builder: (BuildContext context) {
            return MyAfyaHubPrimaryButton(
              onPressed: () {
                reportErrorToSentry(
                  context,
                  http.Response(
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
                errorReported = true;
              },
            );
          },
        ),
      );

      await tester.tap(find.byType(MyAfyaHubPrimaryButton));
      await tester.pumpAndSettle();
      expect(errorReported, true);
    });
  });

  testWidgets('congratulationsPageTitle should return the correct message',
      (WidgetTester tester) async {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    late String testMessage = '';

    await buildTestWidget(
      tester: tester,
      store: store,
      client: baseGraphQlClientMock,
      widget: Builder(
        builder: (BuildContext context) {
          return MyAfyaHubPrimaryButton(
            onPressed: () async {
              testMessage = setNickNamePageTitle(context: context);
            },
          );
        },
      ),
    );
    await tester.tap(find.byType(MyAfyaHubPrimaryButton));
    await tester.pumpAndSettle();
    expect(testMessage, 'Congratulations on your health journey');

    store.dispatch(
      UpdateClientProfileAction(
        treatmentEnrollmentDate:
            DateTime.now().subtract(const Duration(days: 1000)).toString(),
      ),
    );
    await tester.tap(find.byType(MyAfyaHubPrimaryButton));
    await tester.pumpAndSettle();
    expect(testMessage, 'Congratulations on your 3 years health journey');
  });
}
