import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/endpoint_context_subject.dart';
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';

import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/engagement/feed/feed_component_wrapper.dart';

import 'package:myafyahub/presentation/help_center/widgets/circular_background_icons.dart';

import 'package:myafyahub/presentation/router/router_generator.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:user_feed/user_feed.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:misc_utilities/misc.dart' as misc;
import 'package:shared_themes/constants.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:user_profile/contact_utils.dart';
import 'package:unicons/unicons.dart';

import '../../../mock_feed_response.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';
import '../../../test_utils.dart';

// ignore: always_specify_types
@GenerateMocks([],
    // ignore: always_specify_types
    customMocks: [MockSpec<GraphQlClient>(as: #BaseGraphQlClient)])
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
        widget: Builder(builder: (BuildContext context) {
          return SILPrimaryButton(onPressed: () {
            logoutUser(context: context);
          });
        }),
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
          userBioData: BioData(
              firstName: Name.withValue('Test'),
              lastName: Name.withValue('Name')),
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
                actualNameFromState =
                    getDisplayName(store.state.userProfileState!);
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
                          getDisplayName(store.state.userProfileState!);
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
      await tester.pumpWidget(MaterialApp(
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
      ));

      expect(find.byType(SILPrimaryButton), findsOneWidget);
      expect(find.byKey(showToastKey), findsOneWidget);

      // tap the button to show the toast
      await tester.tap(find.byKey(showToastKey));
      await fireEvent(tester);
    });

    testWidgets('should retire secondary phone from state',
        (WidgetTester tester) async {
      const String contactPhone = '+254728101710';
      await tester.pumpWidget(StoreProvider<AppState>(
        store: store,
        child: StoreConnector<AppState, AppState>(
            converter: (Store<AppState> store) {
          return store.state;
        }, builder: (BuildContext context, AppState appState) {
          return MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (BuildContext context) {
                  return Center(
                    child: SILPrimaryButton(
                      buttonKey: const Key('update_contacts'),
                      onPressed: () {
                        updateStateContacts(
                            context: context,
                            type: StateContactType.retireSecondaryPhone,
                            value: contactPhone);
                      },
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ));

      expect(find.byType(SILPrimaryButton), findsOneWidget);
      expect(find.byKey(const Key('update_contacts')), findsOneWidget);

      // tap the button to show the toast
      await tester.tap(find.byKey(const Key('update_contacts')));
      expect(
          store.state.userProfileState!.userProfile!.secondaryPhoneNumbers!
              .contains(PhoneNumber.withValue(contactPhone)),
          false);
      //
    });

    testWidgets('should retire secondary email from state',
        (WidgetTester tester) async {
      const String contactVal = 'someone@gmail.com';
      await tester.pumpWidget(StoreProvider<AppState>(
        store: store,
        child: StoreConnector<AppState, AppState>(
            converter: (Store<AppState> store) {
          return store.state;
        }, builder: (BuildContext context, AppState appState) {
          return MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (BuildContext context) {
                  return Center(
                    child: SILPrimaryButton(
                      buttonKey: const Key('update_contacts'),
                      onPressed: () {
                        updateStateContacts(
                            context: context,
                            type: StateContactType.retireSecondaryEmail,
                            value: contactVal);
                      },
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ));

      expect(find.byType(SILPrimaryButton), findsOneWidget);
      expect(find.byKey(const Key('update_contacts')), findsOneWidget);

      // tap the button to show the toast
      await tester.tap(find.byKey(const Key('update_contacts')));
      expect(
          store.state.userProfileState!.userProfile!.secondaryEmailAddresses!
              .contains(EmailAddress.withValue(contactVal)),
          false);
      //
    });

    testWidgets('should set primary phone number', (WidgetTester tester) async {
      const String contactVal = '+2254728710101';
      await tester.pumpWidget(StoreProvider<AppState>(
        store: store,
        child: StoreConnector<AppState, AppState>(
            converter: (Store<AppState> store) {
          return store.state;
        }, builder: (BuildContext context, AppState appState) {
          return MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (BuildContext context) {
                  return Center(
                    child: SILPrimaryButton(
                      buttonKey: const Key('update_contacts'),
                      onPressed: () {
                        updateStateContacts(
                            context: context,
                            type: StateContactType.setPrimaryPhone,
                            value: contactVal);
                      },
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ));

      expect(find.byType(SILPrimaryButton), findsOneWidget);
      expect(find.byKey(const Key('update_contacts')), findsOneWidget);

      // tap the button to show the toast
      await tester.tap(find.byKey(const Key('update_contacts')));
      expect(
          store.state.userProfileState!.userProfile!.primaryPhoneNumber!
              .getValue(),
          contactVal);
      //
    });

    testWidgets('should set primary email', (WidgetTester tester) async {
      const String contactVal = 'email@example.com';
      await tester.pumpWidget(StoreProvider<AppState>(
        store: store,
        child: StoreConnector<AppState, AppState>(
            converter: (Store<AppState> store) {
          return store.state;
        }, builder: (BuildContext context, AppState appState) {
          return MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (BuildContext context) {
                  return Center(
                    child: SILPrimaryButton(
                      buttonKey: const Key('update_contacts'),
                      onPressed: () {
                        updateStateContacts(
                            context: context,
                            type: StateContactType.setPrimaryEmail,
                            value: contactVal);
                      },
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ));

      expect(find.byType(SILPrimaryButton), findsOneWidget);
      expect(find.byKey(const Key('update_contacts')), findsOneWidget);

      // tap the button to show the toast
      await tester.tap(find.byKey(const Key('update_contacts')));
      expect(
          store.state.userProfileState!.userProfile!.primaryEmailAddress!
              .getValue(),
          contactVal);
      //
    });

    testWidgets(
      'should add primary email to state',
      (WidgetTester tester) async {
        final AppState _state = AppState.initial();
        final AppState state = _state.copyWith.userFeedState!.call(
            data: GetFeedData.fromJson(
                mockFeedResponse()['data'] as Map<String, dynamic>));
        final Store<AppState> _store = Store<AppState>(initialState: state);

        final MockGraphQlClient GraphQlClient = MockGraphQlClient();

        const String contactVal = 'test@example.com';

        await buildTestWidget(
          tester: tester,
          store: _store,
          client: GraphQlClient,
          widget: Material(
            child: Builder(
              builder: (BuildContext context) {
                return Center(
                  child: SILPrimaryButton(
                    buttonKey: const Key('add_primary_email'),
                    onPressed: () {
                      updateStateContacts(
                          context: context,
                          type: StateContactType.primaryEmail,
                          value: contactVal);
                    },
                  ),
                );
              },
            ),
          ),
        );

        expect(find.byType(SILPrimaryButton), findsOneWidget);
        expect(find.byKey(const Key('add_primary_email')), findsOneWidget);

        // tap the button to show the toast
        await tester.tap(find.byKey(const Key('add_primary_email')));

        expect(
            _store.state.userProfileState!.userProfile!.primaryEmailAddress!
                .getValue(),
            contactVal);
        //
      },
    );

    testWidgets('should add secondary phone number to state',
        (WidgetTester tester) async {
      const String contactVal = '+2547xxx xxx';
      await tester.pumpWidget(StoreProvider<AppState>(
        store: store,
        child: StoreConnector<AppState, AppState>(
            converter: (Store<AppState> store) {
          return store.state;
        }, builder: (BuildContext context, AppState appState) {
          return MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (BuildContext context) {
                  return Center(
                    child: SILPrimaryButton(
                      buttonKey: const Key('update_contacts'),
                      onPressed: () {
                        updateStateContacts(
                            context: context,
                            type: StateContactType.secondaryPhones,
                            value: contactVal);
                      },
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ));

      expect(find.byType(SILPrimaryButton), findsOneWidget);
      expect(find.byKey(const Key('update_contacts')), findsOneWidget);

      // tap the button to show the toast
      await tester.tap(find.byKey(const Key('update_contacts')));
      expect(
          store.state.userProfileState!.userProfile!.secondaryPhoneNumbers!
              .contains(PhoneNumber.withValue(contactVal)),
          true);
      //
    });

    testWidgets('should add secondary email to state',
        (WidgetTester tester) async {
      const String contactVal = 'xyz@xc.com';
      await tester.pumpWidget(StoreProvider<AppState>(
        store: store,
        child: StoreConnector<AppState, AppState>(
            converter: (Store<AppState> store) {
          return store.state;
        }, builder: (BuildContext context, AppState appState) {
          return MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (BuildContext context) {
                  return Center(
                    child: SILPrimaryButton(
                      buttonKey: const Key('update_contacts'),
                      onPressed: () {
                        updateStateContacts(
                            context: context,
                            type: StateContactType.secondaryEmails,
                            value: contactVal);
                      },
                    ),
                  );
                },
              ),
            ),
          );
        }),
      ));

      expect(find.byType(SILPrimaryButton), findsOneWidget);
      expect(find.byKey(const Key('update_contacts')), findsOneWidget);

      // tap the button to show the toast
      await tester.tap(find.byKey(const Key('update_contacts')));
      expect(
          store.state.userProfileState!.userProfile!.secondaryEmailAddresses!
              .contains(EmailAddress.withValue(contactVal)),
          true);
      //
    });

    testWidgets('should show save Profile Details SILProgressDialog',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: Builder(builder: (BuildContext context) {
          return SILPrimaryButton(
              buttonKey: const Key('btn'),
              onPressed: () async {
                showSaveProfileDetailsSILProgressDialog(
                  context,
                );
              });
        }),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('btn')));
      await tester.pumpAndSettle();

      expect(find.byType(Text), findsOneWidget);
    });

    testWidgets('should navigate to homepage', (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

      store.dispatch(
        UpdateUserProfileAction(
          profile: UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue(testPhoneNumber),
          ),
        ),
      );

      await buildTestWidget(
          tester: tester,
          store: store,
          client: mockGraphQlClient,
          widget: Center(
            child: Builder(builder: (BuildContext context) {
              return SILPrimaryButton(
                  buttonKey: const Key('continue_homepage'),
                  onPressed: () {
                    navigateToHome(context);
                  });
            }),
          ));

      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('continue_homepage')));
      await tester.pumpAndSettle();
      expect(find.byType(SILPrimaryButton), findsWidgets);
      expect(find.byType(FeedComponentWrapper), findsOneWidget);
    });

    testWidgets('should pass to getUploadId', (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();
      late String uploadID;
      final Map<String, dynamic> fileData = <String, dynamic>{
        'contentType': 'jpg',
        'title': 'test',
        'base64data': 'test'
      };
      EndPointsContextSubject()
          .contexts
          .add(<AppContext>[AppContext.AppTest, AppContext.BewellCONSUMER]);
      await tester.runAsync(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockGraphQlClient,
          widget: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(
                  buttonKey: const Key('get_upload_id'),
                  onPressed: () async {
                    uploadID = await getUploadID(
                      fileData: fileData,
                      context: context,
                    );
                  });
            },
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(const Key('get_upload_id')));
        await tester.pumpAndSettle();
        expect(uploadID, '1r1idoAs54kbZ90l9KkHSK7GKva');
      });
    });

    testWidgets('should fail to getUploadId and return a string',
        (WidgetTester tester) async {
      final MockGraphQlClientForFailures mockGraphQlClientForFailures =
          MockGraphQlClientForFailures();
      late String uploadID;
      final Map<String, dynamic> fileData = <String, dynamic>{
        'contentType': 'jpg',
        'title': 'test',
        'base64data': 'test'
      };
      EndPointsContextSubject().contexts.add(testAppContexts);
      await tester.runAsync(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockGraphQlClientForFailures,
          widget: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(
                  buttonKey: const Key('get_upload_id'),
                  onPressed: () async {
                    uploadID = await getUploadID(
                      fileData: fileData,
                      context: context,
                    );
                  });
            },
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(const Key('get_upload_id')));
        await tester.pumpAndSettle();
        expect(uploadID, 'err');
      });
    });

    group('showAlertSnackBar test', () {
      testWidgets('should showAlertSnackBar', (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: Center(
              child: Builder(builder: (BuildContext context) {
                return SILPrimaryButton(
                  buttonKey: const Key('snackbar_button'),
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(misc.snackbar(content: 'hey'));
                  },
                );
              }),
            ),
          ),
        ));

        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('snackbar_button')));
        await tester.pumpAndSettle();
        expect(find.text('hey'), findsOneWidget);
      });

      testWidgets('should showAlertSnackBar with default message',
          (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: Center(
              child: Builder(builder: (BuildContext context) {
                return SILPrimaryButton(
                  buttonKey: const Key('snackbar_button'),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(misc.snackbar(
                        content: UserFeedBackTexts.getErrorMessage()));
                  },
                );
              }),
            ),
          ),
        ));

        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('snackbar_button')));
        await tester.pumpAndSettle();
        expect(find.text(UserFeedBackTexts.getErrorMessage()), findsOneWidget);
      });
    });

    testWidgets('should show SILActionsBottomSheet',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Center(
            child: Builder(builder: (BuildContext context) {
              return SILPrimaryButton(
                buttonKey: const Key('bottom_sheet_button'),
                onPressed: () {
                  showMedicationBottomSheet(
                      context: context, child: Container());
                },
              );
            }),
          ),
        ),
      ));

      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('bottom_sheet_button')));
      await tester.pumpAndSettle();

      expect(find.byKey(actionsContainerKey), findsOneWidget);
    });

    testWidgets('should launchWhatsApp on ios', (WidgetTester tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

      await tester.pumpWidget(MaterialApp(
        onGenerateRoute: RouteGenerator.generateRoute,
        navigatorObservers: <NavigatorObserver>[mockNavigatorObserver],
        home: Scaffold(
          body: Center(
            child: Builder(builder: (BuildContext context) {
              return SILPrimaryButton(
                buttonKey: const Key('bottom_sheet_button'),
                onPressed: () => misc.launchWhatsApp,
              );
            }),
          ),
        ),
      ));

      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('bottom_sheet_button')));
      await tester.pumpAndSettle();

      // verify(mockNavigatorObserver.didPush(sampleRoute, any));
      debugDefaultTargetPlatformOverride = null;
    });

    testWidgets('should launchWhatsApp on android',
        (WidgetTester tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;

      await tester.pumpWidget(MaterialApp(
        onGenerateRoute: RouteGenerator.generateRoute,
        navigatorObservers: <NavigatorObserver>[mockNavigatorObserver],
        home: Scaffold(
          body: Center(
            child: Builder(builder: (BuildContext context) {
              return SILPrimaryButton(
                buttonKey: const Key('bottom_sheet_button'),
                onPressed: () => misc.launchWhatsApp,
              );
            }),
          ),
        ),
      ));

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

      await tester.pumpWidget(MaterialApp(
        home: Builder(builder: (BuildContext context) {
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
        }),
      ));

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
      await tester.pumpWidget(MaterialApp(
        home: Builder(builder: (BuildContext context) {
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
        }),
      ));

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
      await tester.pumpWidget(MaterialApp(
        home: Builder(builder: (BuildContext context) {
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
        }),
      ));

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

  testWidgets('test phoneNumberUsageBottomSheet', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: Builder(builder: (BuildContext context) {
            return RawMaterialButton(
              onPressed: () => phoneNumberUsageBottomSheet(
                context: context,
                onDoneCallback: () => Navigator.pop(context),
              ),
            );
          }),
        ),
      ),
    ));

    await tester.pumpAndSettle();
    await tester.tap(find.byType(RawMaterialButton));
    await tester.pumpAndSettle();
    expect(find.byType(ListView), findsOneWidget);
    expect(find.text(infoVerificationBody), findsOneWidget);
    expect(find.text(infoCommunicationBody), findsOneWidget);
    expect(find.byType(CircularBackGroundIcons), findsNWidgets(3));
  });

  testWidgets('test getWidthOfSymmetricalWidgetsSmallDevices',
      (WidgetTester tester) async {
    double? width;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: Builder(builder: (BuildContext context) {
            return RawMaterialButton(onPressed: () {
              width =
                  getWidthOfSymmetricalWidgetsSmallDevices(context: context);
            });
          }),
        ),
      ),
    ));

    await tester.pumpAndSettle();
    await tester.tap(find.byType(RawMaterialButton));
    await tester.pumpAndSettle();
    expect(width, 205.0);
  });

  testWidgets(
      'test isLargeScreenAndOnLandscape to return false for small screen size',
      (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(20, 10);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    bool? isLarge;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: Builder(builder: (BuildContext context) {
            return RawMaterialButton(onPressed: () {
              isLarge = isLargeScreenAndOnLandscape(context: context);
            });
          }),
        ),
      ),
    ));

    await tester.pumpAndSettle();
    await tester.tap(find.byType(RawMaterialButton));
    await tester.pumpAndSettle();
    expect(isLarge, false);
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
  });

  testWidgets(
      'test isLargeScreenAndOnLandscape to return true for large screen size',
      (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(1400, 1000);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    bool? isLarge;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: Builder(builder: (BuildContext context) {
            return RawMaterialButton(onPressed: () {
              isLarge = isLargeScreenAndOnLandscape(context: context);
            });
          }),
        ),
      ),
    ));

    await tester.pumpAndSettle();
    await tester.tap(find.byType(RawMaterialButton));
    await tester.pumpAndSettle();
    expect(isLarge, true);
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
  });

  testWidgets('phoneNumberUsageBottomSheet should render correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: Builder(builder: (BuildContext context) {
            return RawMaterialButton(onPressed: () {
              phoneNumberUsageBottomSheet(
                context: context,
                onDoneCallback: () => Navigator.pop(context),
              );
            });
          }),
        ),
      ),
    ));

    await tester.pumpAndSettle();
    await tester.tap(find.byType(RawMaterialButton));
    await tester.pumpAndSettle();

    expect(find.text(infoVerificationTitle), findsOneWidget);
    expect(find.text(infoVerificationBody), findsOneWidget);

    expect(find.text(infoRecoveryTitle), findsOneWidget);
    expect(find.text(infoRecoveryBody), findsOneWidget);

    expect(find.text(infoCommunicationTitle), findsOneWidget);
    expect(find.text(infoCommunicationBody), findsOneWidget);
  });
  testWidgets('test showRatingBottomSheet', (WidgetTester tester) async {
    final Store<AppState> store =
        Store<AppState>(initialState: AppState.initial());

    await buildTestWidget(
      tester: tester,
      store: store,
      client: mockGraphQlClient,
      widget: Material(
        child: Builder(
          builder: (BuildContext context) {
            return RawMaterialButton(
                onPressed: () => showRatingBottomSheet(context));
          },
        ),
      ),
    );

    await tester.pump();
    await tester.tap(find.byType(RawMaterialButton));
    await tester.pumpAndSettle();

    final Finder laterButton = find.text(later);
    expect(laterButton, findsOneWidget);

    await tester.tap(laterButton);
    await tester.pumpAndSettle();
    expect(laterButton, findsNothing);
    await tester.tap(find.byType(RawMaterialButton));
    await tester.pumpAndSettle();

    final Finder rateButton = find.text(rateNow);
    expect(rateButton, findsOneWidget);
    await tester.tap(rateButton);
    await tester.pumpAndSettle();
    expect(laterButton, findsNothing);
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
      expect(find.text('27 '), findsOneWidget);
      expect(find.text('February '), findsOneWidget);
      expect(find.text('2012 '), findsOneWidget);
      expect(find.text('at '), findsOneWidget);
      expect(find.text('1:27 PM'), findsOneWidget);
    });
  });
}
