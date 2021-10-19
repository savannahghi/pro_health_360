// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/redux/actions/change_pin_action.dart';
import 'package:myafyahub/application/redux/actions/phone_signup_state_action.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/my_afya_hub_phone_login_page.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import '../../../../../test_helpers.dart';
import '../../../../../test_utils.dart';

void main() {
  group('ChangePinAction', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should dispatch action correctly',
        (WidgetTester tester) async {
      // mocked response
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{'updateUserPIN': true}
        }),
        201,
      );

      queryWhenThenAnswer(
        queryString: updateUserPinMutation,
        variables: <String, dynamic>{
          'phone': '0710000000',
          'pin': '1234',
        },
        response: response,
      );

      when(baseGraphQlClientMock.toMap(response))
          .thenReturn(json.decode(response.body) as Map<String, dynamic>);

      when(
        baseGraphQlClientMock
            .parseError(<String, dynamic>{'error': 'An error occurred'}),
      ).thenReturn(null);

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                StoreProvider.dispatch(
                  context,
                  UpdateUserProfileAction(
                    profile: UserProfile(
                      primaryPhoneNumber:
                          PhoneNumber.withValue(testPhoneNumber),
                      userBioData: BioData(
                        firstName: Name.withValue('Test'),
                        lastName: Name.withValue('Coverage'),
                      ),
                    ),
                  ),
                );
                StoreProvider.dispatch(
                  context,
                  PhoneSignUpStateAction(
                    createPin: testPin,
                    confirmPin: testPin,
                  ),
                );
                await StoreProvider.dispatch(
                  context,
                  ChangePinAction(context: context, flag: createPinFlag),
                );
              },
            );
          },
        ),
      );

      await tester.pump();
      await tester.tap(find.byType(SILPrimaryButton));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(primaryBottomSheetButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(MyAfyaHubPhoneLoginPage), findsOneWidget);
    });

    testWidgets('should dispatch and catch error when pins don\'t match',
        (WidgetTester tester) async {
      // mocked response
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{'updateUserPIN': true}
        }),
        201,
      );

      queryWhenThenAnswer(
        queryString: updateUserPinMutation,
        variables: <String, dynamic>{
          'phone': '0710000000',
          'pin': '1234',
        },
        response: response,
      );

      when(baseGraphQlClientMock.toMap(response))
          .thenReturn(json.decode(response.body) as Map<String, dynamic>);

      when(
        baseGraphQlClientMock
            .parseError(<String, dynamic>{'error': 'An error occurred'}),
      ).thenReturn(null);

      late dynamic err;

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                StoreProvider.dispatch(
                  context,
                  UpdateUserProfileAction(
                    profile: UserProfile(
                      primaryPhoneNumber:
                          PhoneNumber.withValue(testPhoneNumber),
                      userBioData: BioData(
                        firstName: Name.withValue('Test'),
                        lastName: Name.withValue('Coverage'),
                      ),
                    ),
                  ),
                );
                StoreProvider.dispatch(
                  context,
                  PhoneSignUpStateAction(
                    createPin: testPin,
                    confirmPin: '4321',
                  ),
                );

                try {
                  await StoreProvider.dispatch(
                    context,
                    ChangePinAction(context: context, flag: createPinFlag),
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

    testWidgets('should dispatch and catch error when response is false',
        (WidgetTester tester) async {
      // mocked response
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{'updateUserPIN': false}
        }),
        201,
      );

      queryWhenThenAnswer(
        queryString: updateUserPinMutation,
        variables: <String, dynamic>{
          'phone': '0710000000',
          'pin': '1234',
        },
        response: response,
      );

      when(baseGraphQlClientMock.toMap(response))
          .thenReturn(json.decode(response.body) as Map<String, dynamic>);

      when(
        baseGraphQlClientMock
            .parseError(<String, dynamic>{'error': 'An error occurred'}),
      ).thenReturn(null);

      late dynamic err;

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            return SILPrimaryButton(
              onPressed: () async {
                StoreProvider.dispatch(
                  context,
                  UpdateUserProfileAction(
                    profile: UserProfile(
                      primaryPhoneNumber:
                          PhoneNumber.withValue(testPhoneNumber),
                      userBioData: BioData(
                        firstName: Name.withValue('Test'),
                        lastName: Name.withValue('Coverage'),
                      ),
                    ),
                  ),
                );
                StoreProvider.dispatch(
                  context,
                  PhoneSignUpStateAction(
                    createPin: testPin,
                    confirmPin: testPin,
                  ),
                );

                try {
                  await StoreProvider.dispatch(
                    context,
                    ChangePinAction(context: context, flag: createPinFlag),
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
