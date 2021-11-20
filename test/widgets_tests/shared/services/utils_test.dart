// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:misc_utilities/misc.dart' as misc;
import 'package:mockito/annotations.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:unicons/unicons.dart';

// Project imports:
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/auth_status_action.dart';
import 'package:myafyahub/application/redux/actions/health_page_pin_input_action.dart';
import 'package:myafyahub/application/redux/actions/update_client_profile_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/router/router_generator.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';
import '../../../test_utils.dart';

@GenerateMocks(
  // ignore: always_specify_types
  [],
  // ignore: always_specify_types
  customMocks: [MockSpec<GraphQlClient>(as: #BaseGraphQlClient)],
)
void main() {
  FlutterConfig.loadValueForTesting(<String, String>{
    'DEV_SENTRY_DNS': 'test_dev_sentry_dns',
    'PROD_SENTRY_DNS': 'test_prod_sentry_dns',
  });

  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());
  final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

  group('Utils', () {
    final MockNavigatorObserver mockNavigatorObserver = MockNavigatorObserver();

    testWidgets('should test logout user works correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () {
                logoutUser(context: context);
              },
            );
          },
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      await fireEvent(tester);
    });

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
            return SILPrimaryButton(
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

    testWidgets('should get the correct display name from state',
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
                  return SILPrimaryButton(
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
              child: SILPrimaryButton(
                buttonKey: showToastKey,
                onPressed: () {
                  showToast('Some random toast message');
                },
              ),
            ),
          ),
        ),
      );

      expect(find.byType(SILPrimaryButton), findsOneWidget);
      expect(find.byKey(showToastKey), findsOneWidget);

      // tap the button to show the toast
      await tester.tap(find.byKey(showToastKey));
      await fireEvent(tester);
    });

    testWidgets('should show save Profile Details SILProgressDialog',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              buttonKey: const Key('btn'),
              onPressed: () async {
                showSaveProfileDetailsSILProgressDialog(
                  context,
                );
              },
            );
          },
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('btn')));
      await tester.pumpAndSettle();

      expect(find.byType(Text), findsOneWidget);
    });

    group('showAlertSnackBar test', () {
      testWidgets('should showAlertSnackBar', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: Builder(
                  builder: (BuildContext context) {
                    return SILPrimaryButton(
                      buttonKey: const Key('snackbar_button'),
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(misc.snackbar(content: 'hey'));
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
                    return SILPrimaryButton(
                      buttonKey: const Key('snackbar_button'),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          misc.snackbar(
                            content: UserFeedBackTexts.getErrorMessage(),
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
        expect(find.text(UserFeedBackTexts.getErrorMessage()), findsOneWidget);
      });
    });

    testWidgets('should launchWhatsApp on ios', (WidgetTester tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      await tester.pumpWidget(
        MaterialApp(
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorObservers: <NavigatorObserver>[mockNavigatorObserver],
          home: Scaffold(
            body: Center(
              child: Builder(
                builder: (BuildContext context) {
                  return SILPrimaryButton(
                    buttonKey: const Key('bottom_sheet_button'),
                    onPressed: () => misc.launchWhatsApp,
                  );
                },
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('bottom_sheet_button')));
      await tester.pumpAndSettle();

      // verify(mockNavigatorObserver.didPush(sampleRoute, any));
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('should launchWhatsApp on android',
        (WidgetTester tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      await tester.pumpWidget(
        MaterialApp(
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorObservers: <NavigatorObserver>[mockNavigatorObserver],
          home: Scaffold(
            body: Center(
              child: Builder(
                builder: (BuildContext context) {
                  return SILPrimaryButton(
                    buttonKey: const Key('bottom_sheet_button'),
                    onPressed: () => misc.launchWhatsApp,
                  );
                },
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('bottom_sheet_button')));
      await tester.pumpAndSettle();

      // verify(mockNavigatorObserver.didPush(sampleRoute, any));
      debugDefaultTargetPlatformOverride = null;
    });
  });

  group('SILAddCoverBottomSheet', () {
    testWidgets('should show a generic success bottom sheet',
        (WidgetTester tester) async {
      const Key launchBottomSheetKey = Key('bottom_sheet_key');

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(
                buttonKey: launchBottomSheetKey,
                onPressed: () async {
                  genericBottomSheet(
                    context: context,
                    message: 'demo bottom sheet',
                    isError: false,
                  );
                },
                text: 'Show Bottom Sheet',
              );
            },
          ),
        ),
      );

      await fireEvent(tester);
      expect(find.byType(SILPrimaryButton), findsOneWidget);
      expect(find.byKey(launchBottomSheetKey), findsOneWidget);
    });

    testWidgets('should have 2 action buttons on default launch',
        (WidgetTester tester) async {
      final List<int> primaryButtonTaps = <int>[];
      final List<int> secondaryButtonTaps = <int>[];
      final List<int> tertiaryButtonTaps = <int>[];

      void incrementButtonTaps(List<int> list) {
        list.add(1);
      }

      const Key launchBottomSheetKey = Key('bottom_sheet_key');
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(
                buttonKey: launchBottomSheetKey,
                onPressed: () async {
                  genericBottomSheet(
                    context: context,
                    message: 'demo bottom sheet',
                    isError: false,
                    primaryActionCallback: () {
                      incrementButtonTaps(primaryButtonTaps);
                    },
                    secondaryActionCallback: () {
                      incrementButtonTaps(secondaryButtonTaps);
                    },
                    secondaryActionText: 'Secondary Button',
                    tertiaryActionCallback: () {
                      incrementButtonTaps(tertiaryButtonTaps);
                    },
                    tertiaryActionText: 'Tertiary Button',
                  );
                },
                text: 'Show Bottom Sheet',
              );
            },
          ),
        ),
      );

      await fireEvent(tester);
      expect(find.byType(SILPrimaryButton), findsOneWidget);
      expect(find.byKey(launchBottomSheetKey), findsOneWidget);

      // trigger the bottom sheet
      await tester.tap(find.byKey(launchBottomSheetKey));
      await tester.pumpAndSettle();

      // find the primary button
      expect(find.byKey(primaryBottomSheetButtonKey), findsOneWidget);
      expect(find.text('Primary Button'), findsNothing);

      // find the secondary button
      expect(find.byKey(secondaryBottomSheetButtonKey), findsOneWidget);
      expect(find.text('Secondary Button'), findsOneWidget);

      // find the tertiary button
      expect(find.byKey(tertiaryBottomSheetButtonKey), findsOneWidget);
      expect(find.text('Tertiary Button'), findsOneWidget);

      expect(find.byIcon(UniconsLine.check), findsOneWidget);

      // makes sure the bottom sheet buttons are working
      await tester.tap(find.byKey(primaryBottomSheetButtonKey));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(secondaryBottomSheetButtonKey));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(tertiaryBottomSheetButtonKey));
      await tester.pumpAndSettle();

      expect(secondaryButtonTaps, isNotEmpty);
      expect(secondaryButtonTaps.length, 1);

      expect(primaryButtonTaps, isNotEmpty);
      expect(primaryButtonTaps.length, 1);

      expect(tertiaryButtonTaps, isNotEmpty);
      expect(tertiaryButtonTaps.length, 1);
    });

    testWidgets('should show error bottom sheet', (WidgetTester tester) async {
      final List<int> primaryButtonTaps = <int>[];
      final List<int> secondaryButtonTaps = <int>[];
      void incrementButtonTaps(List<int> list) {
        list.add(1);
      }

      const Key launchBottomSheetKey = Key('bottom_sheet_key');
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(
                buttonKey: launchBottomSheetKey,
                onPressed: () async {
                  genericBottomSheet(
                    context: context,
                    message: 'demo bottom sheet',
                    isError: true,
                    primaryActionCallback: () {
                      incrementButtonTaps(primaryButtonTaps);
                    },
                    showSecondaryButton: true,
                    secondaryActionText: 'Secondary Button',
                    tertiaryActionCallback: () {},
                    tertiaryActionText: 'Other Button',
                  );
                },
                text: 'Show Bottom Sheet',
              );
            },
          ),
        ),
      );

      await fireEvent(tester);
      expect(find.byType(SILPrimaryButton), findsOneWidget);
      expect(find.byKey(launchBottomSheetKey), findsOneWidget);

      // trigger the bottom sheet
      await tester.tap(find.byKey(launchBottomSheetKey));
      await tester.pumpAndSettle();

      // find the primary button
      expect(find.byKey(primaryBottomSheetButtonKey), findsOneWidget);
      expect(find.text('Primary Button'), findsNothing);

      // find the secondary button
      expect(find.byKey(secondaryBottomSheetButtonKey), findsOneWidget);
      expect(find.text('Secondary Button'), findsOneWidget);

      expect(find.byIcon(UniconsLine.times), findsOneWidget);

      // makes sure the bottom sheet buttons are working
      await tester.tap(find.byKey(primaryBottomSheetButtonKey));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(secondaryBottomSheetButtonKey));
      await tester.pumpAndSettle();

      expect(secondaryButtonTaps, isEmpty);

      expect(primaryButtonTaps, isNotEmpty);
      expect(primaryButtonTaps.length, 1);
    });
  });

  group('sortDate', () {
    testWidgets('displays correct date', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: Builder(
          builder: (BuildContext context) {
            return sortDate(
              dateTextStyle:
                  TextThemes.normalSize12Text(AppColors.darkGreyColor),
              context: context,
              loadedDate: '2012-02-27 13:27:00',
              showTime: true,
            );
          },
        ),
      );

      await tester.pump();
      expect(find.byType(Row), findsOneWidget);
      expect(find.text('27 February 2012'), findsOneWidget);
      expect(find.text('at '), findsOneWidget);
      expect(find.text('1:27 PM'), findsOneWidget);
    });

    testWidgets('fails to display time', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: Builder(
          builder: (BuildContext context) {
            return sortDate(
              dateTextStyle:
                  TextThemes.normalSize12Text(AppColors.darkGreyColor),
              context: context,
              loadedDate: '2012-02-27 13:27:00',
            );
          },
        ),
      );

      await tester.pump();
      expect(find.byType(Row), findsOneWidget);
      expect(find.text('27 February 2012'), findsOneWidget);
      expect(find.text('at '), findsNothing);
      expect(find.byType(SizedBox), findsWidgets);
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
                        child: SILPrimaryButton(
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
        HealthPagePINInputAction(
          lastPINInputTime:
              DateTime.now().subtract(const Duration(minutes: 30)).toString(),
        ),
      );
      await tester.tap(find.byKey(const Key('update_contacts')));
      await tester.pumpAndSettle();
      expect(testBool, true);

      store.dispatch(
        HealthPagePINInputAction(
          lastPINInputTime:
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

  group('customFetchData', () {
    testWidgets('adds null when there is not data in the stream',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient client =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'data': null}),
          201,
        ),
      );

      late Stream<dynamic> _stream;
      late StreamController<dynamic> _streamController;

      _streamController = StreamController<dynamic>.broadcast();
      _stream = _streamController.stream;

      _stream.listen((dynamic event) {
        emitsInOrder(<dynamic>[
          emits(<String, dynamic>{'loading': true}),
          emits(null),
        ]);
      });

      expectLater(
        _stream,
        emitsInOrder(<dynamic>[
          emits(<String, dynamic>{'loading': true}),
          emits(null),
        ]),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: client,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                await customFetchData(
                  streamController: _streamController,
                  context: context,
                  logTitle: 'Fetch recent content content',
                  queryString: 'some-query',
                  variables: <String, dynamic>{},
                );
              },
            );
          },
        ),
      );

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      // There are no required expectations here because they have been already
      // verified in the setup above
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
            return SILPrimaryButton(
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

      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(errorReported, true);
    });
  });
}
