// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/redux/actions/resume_with_pin_action.dart';
import 'package:myafyahub/application/redux/actions/update_pin_status_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/behavior_objects.dart';
import 'package:myafyahub/presentation/engagement/home/pages/home_page.dart';
import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  final DeepLinkSubject deepLink = DeepLinkSubject();
  group('ResumeWithPinAction', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should dispatch action and catch error',
        (WidgetTester tester) async {
      late dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                try {
                  await store.dispatch(
                    ResumeWithPinAction(
                      context: context,
                      flag: 'resume_with_pin',
                    ),
                  );
                } catch (e) {
                  err = e;
                }
              },
            );
          },
        ),
      );

      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
    });

    testWidgets('should dispatch action and catch resume_with_pin_error',
        (WidgetTester tester) async {
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{'error': 'Failed to resume with pin'}),
        500,
      );

      queryWhenThenAnswer(
        queryString: resumeWithPinQuery,
        variables: <String, dynamic>{'pin': '1234'},
        response: response,
      );

      when(baseGraphQlClientMock.toMap(response))
          .thenReturn(json.decode(response.body) as Map<String, dynamic>);

      when(
        baseGraphQlClientMock.parseError(
          <String, dynamic>{'error': 'Failed to resume with pin'},
        ),
      ).thenReturn('err');
      late dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                await store.dispatch(
                  UpdatePinStatusAction(pin: '1234'),
                );
                try {
                  await store.dispatch(
                    ResumeWithPinAction(
                      context: context,
                      flag: 'resume_with_pin',
                    ),
                  );
                } catch (e) {
                  err = e;
                }
              },
            );
          },
        ),
      );

      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
    });

    testWidgets(
        'should dispatch action and catch error as wrong PIN credentials supplied',
        (WidgetTester tester) async {
      const String errMsg = 'wrong PIN credentials supplied';
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{'error': errMsg}),
        500,
      );

      queryWhenThenAnswer(
        queryString: resumeWithPinQuery,
        variables: <String, dynamic>{'pin': '1234'},
        response: response,
      );

      when(baseGraphQlClientMock.toMap(response))
          .thenReturn(json.decode(response.body) as Map<String, dynamic>);

      when(baseGraphQlClientMock.parseError(<String, dynamic>{'error': errMsg}))
          .thenReturn(errMsg);
      late dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                await store.dispatch(
                  UpdatePinStatusAction(pin: '1234'),
                );
                try {
                  await store.dispatch(
                    ResumeWithPinAction(
                      context: context,
                      flag: 'resume_with_pin',
                    ),
                  );
                } catch (e) {
                  err = e;
                }
              },
            );
          },
        ),
      );

      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
    });

    testWidgets('should navigate to createPin when intention is to change pin',
        (WidgetTester tester) async {
      final Map<String, dynamic> resp = <String, dynamic>{
        'data': <String, dynamic>{'resumeWithPIN': true}
      };

      final http.Response response = http.Response(
        json.encode(resp),
        200,
      );

      queryWhenThenAnswer(
        queryString: resumeWithPinQuery,
        variables: <String, dynamic>{'pin': '1234'},
        response: response,
      );

      when(baseGraphQlClientMock.toMap(response))
          .thenReturn(json.decode(response.body) as Map<String, dynamic>);

      when(baseGraphQlClientMock.parseError(resp)).thenReturn(null);

      dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                await store.dispatch(
                  UpdatePinStatusAction(pin: '1234', isChangingPin: true),
                );
                try {
                  await store.dispatch(
                    ResumeWithPinAction(
                      context: context,
                      flag: 'resume_with_pin',
                    ),
                  );
                } catch (e) {
                  err = e;
                }
              },
            );
          },
        ),
      );

      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isNull);
      expect(store.state.miscState!.userPin!.isChangingPin, true);
      expect(store.state.miscState!.userPin!.pin, '1234');
    });

    testWidgets(
        'should navigate to home when user enters app via deep link and resumes by pin',
        (WidgetTester tester) async {
      mockNetworkImages(() async {
        final MockShortSILGraphQlClient mockShortSILGraphQlClient =
            MockShortSILGraphQlClient.withResponse(
          'idToken',
          'endpoint',
          Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{
                'fetchRecentContent': <dynamic>[
                  mockContent,
                  mockContent,
                ],
                'fetchContent': <dynamic>[
                  mockContent,
                  mockContent,
                ],
                'fetchSuggestedGroups': <dynamic>[mockGroup],
                'resumeWithPIN': true
              }
            }),
            201,
          ),
        );

        deepLink.hasLink.add(true);
        deepLink.link.add('home');

        // TODO(abiud): remove this hardcoded login response
        final UserResponse userResp = UserResponse.fromJson(loginResponse);
        final UserProfile? userProfile = userResp.profile;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockShortSILGraphQlClient,
          widget: Builder(
            builder: (BuildContext context) {
              return SILPrimaryButton(
                onPressed: () async {
                  await store.dispatch(
                    UpdatePinStatusAction(pin: '1234', isChangingPin: false),
                  );
                  await store.dispatch(
                    UpdateUserProfileAction(
                      profile: userProfile,
                      userBioData: userProfile?.userBioData,
                    ),
                  );
                  try {
                    await store.dispatch(
                      ResumeWithPinAction(
                        context: context,
                        flag: 'resume_with_pin',
                      ),
                    );
                  } catch (e) {
                    return;
                  }
                },
              );
            },
          ),
        );

        await tester.pump();
        await tester.tap(find.byType(SILPrimaryButton));
        await tester.pumpAndSettle();

        expect(find.byType(HomePage), findsOneWidget);
      });
    });

    testWidgets('should throw exception on wrong pin entered',
        (WidgetTester tester) async {
      final Map<String, dynamic> resp = <String, dynamic>{
        'data': <String, dynamic>{'resumeWithPIN': false}
      };

      final http.Response response = http.Response(
        json.encode(resp),
        200,
      );

      queryWhenThenAnswer(
        queryString: resumeWithPinQuery,
        variables: <String, dynamic>{'pin': '1234'},
        response: response,
      );

      when(baseGraphQlClientMock.toMap(response))
          .thenReturn(json.decode(response.body) as Map<String, dynamic>);

      when(baseGraphQlClientMock.parseError(resp)).thenReturn(null);

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                await store.dispatch(
                  UpdatePinStatusAction(pin: '1234', isChangingPin: true),
                );
                try {
                  await store.dispatch(
                    ResumeWithPinAction(
                      context: context,
                      flag: 'resume_with_pin',
                    ),
                  );
                } catch (e) {
                  return;
                }
              },
            );
          },
        ),
      );

      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(store.state.miscState!.userPin!.invalidPin, true);
    });

    testWidgets('should throw exception on when response data is null',
        (WidgetTester tester) async {
      final Map<String, dynamic> resp = <String, dynamic>{'data': null};

      final http.Response response = http.Response(
        json.encode(resp),
        200,
      );

      queryWhenThenAnswer(
        queryString: resumeWithPinQuery,
        variables: <String, dynamic>{'pin': '1234'},
        response: response,
      );

      when(baseGraphQlClientMock.toMap(response))
          .thenReturn(json.decode(response.body) as Map<String, dynamic>);

      when(baseGraphQlClientMock.parseError(resp)).thenReturn(null);

      dynamic err;
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                await store.dispatch(
                  UpdatePinStatusAction(pin: '1234', isChangingPin: true),
                );
                try {
                  await store.dispatch(
                    ResumeWithPinAction(
                      context: context,
                      flag: 'resume_with_pin',
                    ),
                  );
                } catch (e) {
                  err = e;
                }
              },
            );
          },
        ),
      );

      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      expect(err, isA<Future<dynamic>>());
    });
  });
}
