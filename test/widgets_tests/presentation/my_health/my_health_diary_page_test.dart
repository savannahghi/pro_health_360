// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:myafyahub/presentation/health_diary/screening_tools/screening_tools_list_page.dart';
import 'package:myafyahub/presentation/health_diary/screening_tools/widgets/screening_tools_banner.dart';
import 'package:myafyahub/presentation/health_diary/widgets/health_diary_entry_widget.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/update_content_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/entities/home/bottom_nav_items.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/generic_timeout_widget.dart';
import 'package:myafyahub/presentation/health_diary/pages/empty_health_diary.dart';
import 'package:myafyahub/presentation/health_diary/pages/my_health_diary_page.dart';
import 'package:myafyahub/presentation/home/pages/home_page.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  late Store<AppState> store;

  setUp(() {
    store = Store<AppState>(initialState: AppState.initial());
  });

  group('const MyHealthDiaryPage', () {
    testWidgets('should display 2 diary entries correctly',
        (WidgetTester tester) async {
      final MockGraphQlClient client = MockGraphQlClient();

      await buildTestWidget(
        tester: tester,
        store: store,
        client: client,
        widget: const MyHealthDiaryPage(),
      );

      await tester.pumpAndSettle();

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(find.byType(HealthDiaryEntryWidget), findsNWidgets(2));
      expect(find.text('I am healthy'), findsOneWidget);
    });

    testWidgets('should display 2 diary entries and refresh to get new entries',
        (WidgetTester tester) async {
      final MockGraphQlClient client = MockGraphQlClient();

      await buildTestWidget(
        tester: tester,
        store: store,
        client: client,
        widget: const MyHealthDiaryPage(),
      );

      await tester.pumpAndSettle();

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(find.byType(HealthDiaryEntryWidget), findsNWidgets(2));
      expect(find.text('I am healthy'), findsOneWidget);

      await tester.fling(
        find.byType(HealthDiaryEntryWidget).first,
        const Offset(0.0, 300.0),
        1000.0,
      );
      await tester.pumpAndSettle();

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(find.byType(HealthDiaryEntryWidget), findsNWidgets(2));
      expect(find.text('I am healthy'), findsOneWidget);
    });

    testWidgets('should show a timeout widget when fetching diary entries',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'timeout'}),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const MyHealthDiaryPage(),
      );

      await tester.pumpAndSettle();

      expect(find.byType(GenericTimeoutWidget), findsOneWidget);
    });

    testWidgets('should navigate to screening tools list page',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'timeout'}),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const MyHealthDiaryPage(),
      );

      await tester.pumpAndSettle();

      expect(find.byType(GenericTimeoutWidget), findsOneWidget);

      expect(find.byType(ScreeningToolsBanner), findsOneWidget);

      expect(find.byType(ScreeningToolsBanner), findsOneWidget);
      await tester.tap(find.byType(ScreeningToolsBanner));
      await tester.pumpAndSettle();

      expect(find.byType(ScreeningToolsListPage), findsOneWidget);
    });

    testWidgets('should show a no data widget when fetching diary entries',
        (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 800);
      tester.binding.window.devicePixelRatioTestValue = 1;

      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{'error': 'some other unknown error'}),
          201,
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const MyHealthDiaryPage(),
      );

      await tester.pumpAndSettle();

      // try fetching again and expect the same thing
      await tester.tap(find.byKey(helpNoDataWidgetKey));
      await tester.pumpAndSettle();
      expect(find.byType(GenericErrorWidget), findsOneWidget);

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });
    });

    testWidgets(
        'should show an empty health diary widget if there are no diary entries',
        (WidgetTester tester) async {
      final MockShortSILGraphQlClient mockShortSILGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          json.encode(<String, dynamic>{
            'data': <String, dynamic>{
              'getClientHealthDiaryEntries': <dynamic>[],
            }
          }),
          201,
        ),
      );
      store.dispatch(
        UpdateContentStateAction(contentItems: <Content>[mockContent]),
      );
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const MyHealthDiaryPage(),
      );

      await tester.pumpAndSettle();

      final Finder healthDiaryRetryButton =
          find.byKey(healthDiaryRetryButtonKey);

      expect(healthDiaryRetryButton, findsOneWidget);
      expect(find.byType(EmptyHealthDiary), findsOneWidget);

      // try fetching again and expect the same thing
      await tester.tap(healthDiaryRetryButton);
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
      expect(
        store.state.bottomNavigationState!.currentBottomNavIndex,
        BottomNavIndex.home.index,
      );
    });

    testWidgets(
        'should show loading indicator when fetching health diary entries',
        (WidgetTester tester) async {
      final MockGraphQlClient mockShortSILGraphQlClient = MockGraphQlClient();

      store.dispatch(WaitAction<AppState>.add(fetchHealthDiaryFlag));

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: const MyHealthDiaryPage(),
      );

      expect(find.byType(PlatformLoader), findsOneWidget);
    });
  });
}
