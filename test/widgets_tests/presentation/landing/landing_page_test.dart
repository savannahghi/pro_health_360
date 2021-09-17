import 'dart:convert';

import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/endpoint_context_subject.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/onboarding/landing_page/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../mock_utils.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  // initial set up
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  final Store<AppState> store =
      Store<AppState>(initialState: AppState.initial());

  group('LandingPage should render correctly and buttons work as expected', () {
    testWidgets('should press login button and navigate',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue =
          typicalLargePhoneScreenSizePortrait;
      TestWidgetsFlutterBinding.ensureInitialized();

      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: LandingPage());

      await tester.pump();
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(loginWithPhoneKey));
      // verify(mockObserver.didPush(sampleRoute, any));
      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets('Anonymous sign in navigates to feed',
        (WidgetTester tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      tester.binding.window.physicalSizeTestValue =
          typicalLargePhoneScreenSizePortrait;
      TestWidgetsFlutterBinding.ensureInitialized();
      final List<AppContext> thisAppContexts = <AppContext>[
        AppContext.BewellCONSUMER,
        AppContext.AppTest
      ];

      EndPointsContextSubject().contexts.add(thisAppContexts);

      when(baseGraphQlClientMock.callRESTAPI(
              endpoint: sampleEndPoint,
              variables: anyNamed('variables'),
              method: 'POST'))
          .thenAnswer(
        (_) => Future<http.Response>.value(
          http.Response(
            json.encode(
              <String, dynamic>{
                'id_token': null,
                'is_anonymous': true,
                'refresh_token': 'some-refresh-token',
                'uid': 'BkOpHPj9hLRnhYcmglIpc0VEQ9p1',
                'can_experiment': true,
                'expires_in': '3600'
              },
            ),
            201,
          ),
        ),
      );

      when(baseGraphQlClientMock.toMap(any)).thenReturn(
        <String, dynamic>{
          'data': <String, dynamic>{
            'flavour': 'CONSUMER',
            'auth': <String, dynamic>{
              'can_experiment': true,
            }
          }
        },
      );
      await buildTestWidget(
          tester: tester,
          store: store,
          client: baseGraphQlClientMock,
          widget: LandingPage());

      await tester.pump();
      await tester.pumpAndSettle();
      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });
  });
}
