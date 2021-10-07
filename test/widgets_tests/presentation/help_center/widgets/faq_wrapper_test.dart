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
import 'package:mocktail_image_network/mocktail_image_network.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/generic_empty_data_widget.dart';
import 'package:myafyahub/presentation/core/widgets/generic_no_data_widget.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/help_center/help_center_question_card.dart';
import 'package:myafyahub/presentation/help_center/widgets/faq_wrapper.dart';
import 'package:myafyahub/presentation/widgets/text_loading_shimmer.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';
import '../../../../test_utils.dart';

void main() {
  group('FAQWrapper', () {
    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

    testWidgets('should render an faq list when they exist',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: FAQWrapper(),
      );

      await tester.pump();
      expect(find.byType(HelpCenterQuestionCard), findsOneWidget);
      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('should show loading indicator while fetching FAQs',
        (WidgetTester tester) async {
      final MockGraphQlClient2 mockShortGraphQlClient =
          MockGraphQlClient2.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(<String, dynamic>{
              'data': <String, dynamic>{'loading': true}
            }),
            200),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortGraphQlClient,
        widget: FAQWrapper(),
      );

      await tester.pump();

      expect(find.byType(TextLoadingShimmer), findsWidgets);
    });

    testWidgets(
        'GenericEmptyData should render GenericEmptyData'
        ' when faqs are empty', (WidgetTester tester) async {
      final MockGraphQlClient2 mockShortGraphQlClient =
          MockGraphQlClient2.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(
              <String, dynamic>{
                'data': <String, dynamic>{'getFaqsContent': <dynamic>[]}
              },
            ),
            200),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortGraphQlClient,
        widget: FAQWrapper(),
      );

      await tester.pumpAndSettle();
      final Finder genericEmptyDataWidget = find.byType(GenericEmptyData);
      expect(genericEmptyDataWidget, findsOneWidget);
    });

    testWidgets(
        'should show generic no data widget when there is an '
        ' error while fetching FAQs', (WidgetTester tester) async {
      final MockGraphQlClient2 mockShortGraphQlClient =
          MockGraphQlClient2.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(<String, dynamic>{'error': 'no faqs for you'}), 200),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortGraphQlClient,
        widget: FAQWrapper(),
      );

      await tester.pump();
      expect(find.byType(GenericNoData), findsOneWidget);
    });

    testWidgets(
        'should show timeout widget when there is a timeout while'
        ' fetching FAQs', (WidgetTester tester) async {
      final MockGraphQlClient2 mockShortGraphQlClient =
          MockGraphQlClient2.withResponse(
        'idToken',
        'endpoint',
        http.Response(json.encode(<String, dynamic>{'error': 'timeout'}), 408),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortGraphQlClient,
        widget: FAQWrapper(),
      );

      await tester.pumpAndSettle();
      final Finder genericTimeoutWidget = find.byType(GenericTimeoutWidget);
      expect(genericTimeoutWidget, findsOneWidget);
    });

    testWidgets(
        'should show timeGenericNoData widget when there is another error other than a '
        ' timeout while fetching FAQs', (WidgetTester tester) async {
      final MockGraphQlClient2 mockShortGraphQlClient =
          MockGraphQlClient2.withResponse(
        'idToken',
        'endpoint',
        http.Response(
            json.encode(<String, dynamic>{'error': 'expired token'}), 408),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortGraphQlClient,
        widget: FAQWrapper(),
      );

      await tester.pumpAndSettle();
      final Finder genericTimeoutWidget = find.byType(GenericNoData);
      expect(genericTimeoutWidget, findsOneWidget);

      await tester.tap(find.byKey(genericNoDataButtonKey));
      await tester.pumpAndSettle();

      expect(genericTimeoutWidget, findsOneWidget);
    });

    testWidgets(
        'should retry FAQ fetch when there is a timeout while fetching FAQs',
        (WidgetTester tester) async {
      mockNetworkImages(() async {
        final MockGraphQlClient2 mockShortGraphQlClient =
            MockGraphQlClient2.withResponse(
          'idToken',
          'endpoint',
          http.Response(
              json.encode(<String, dynamic>{'error': 'timeout'}), 408),
        );

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
          client: mockShortGraphQlClient,
          widget: FAQWrapper(),
        );

        await tester.pump();
        final Finder genericNoDataWidget = find.byType(GenericTimeoutWidget);
        expect(genericNoDataWidget, findsOneWidget);

        final Finder retryWidget = find.text('Retry');
        expect(retryWidget, findsOneWidget);

        await tester.tap(retryWidget);
        await tester.pumpAndSettle();

        expect(genericNoDataWidget, findsOneWidget);
      });
    });
  });
}
