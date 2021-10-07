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
import 'package:shared_ui_components/inputs.dart';

// Project imports:
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/onboarding_page_wrapper.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/resume_with_pin_page.dart';
import '../../../test_helpers.dart';

void main() {
  late Store<AppState> store;

  setUpAll(() {
    store = Store<AppState>(initialState: AppState.initial());
  });

  group('Resume with PIN', () {
    testWidgets('should find pin request reset widget',
        (WidgetTester tester) async {
      // mocked response
      final http.Response response = http.Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{'resumeWithPIN': true}
        }),
        201,
      );

      queryWhenThenAnswer(
          queryString: resumeWithPinQuery,
          variables: <String, dynamic>{'pin': '1234'},
          response: response);

      when(baseGraphQlClientMock.toMap(response))
          .thenReturn(json.decode(response.body) as Map<String, dynamic>);

      when(baseGraphQlClientMock.parseError(<String, dynamic>{
        'data': <String, dynamic>{'resumeWithPIN': true}
      })).thenReturn(null);

      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(
          builder: (BuildContext context) {
            StoreProvider.dispatch<AppState>(
              context,
              UpdateUserProfileAction(
                  userBioData: BioData(
                      firstName: Name.withValue('Test'),
                      lastName: Name.withValue('Coverage'))),
            );
            return ResumeWithPinPage();
          },
        ),
      );

      await tester.pumpAndSettle();
      final Finder pinInput = find.byWidgetPredicate((Widget widget) =>
          widget is SILFormTextField && widget.key == pinInputKey);
      expect(pinInput, findsOneWidget);
      await tester.tap(pinInput);
      await tester.pump(const Duration(seconds: 1));
      await tester.enterText(pinInput, '1234');
      await tester.tap(find.byType(SILFormTextField));
      await tester.pump(const Duration(seconds: 1));
      await tester.enterText(find.byType(SILFormTextField), '1234');
      final Finder pinLoginWidget = find.byType(OnboardingPageWrapper);
      expect(pinLoginWidget, findsOneWidget);
    });
  });
}
