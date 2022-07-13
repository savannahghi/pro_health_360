import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/content/widgets/copy_content_link_widget.dart';

import '../../../../mock_image_http_client.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('CopyContentLinkWidget', () {
    late Store<AppState> store;

    setUp(() async {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = TestHttpOverrides();

      setupFirebaseAnalyticsMocks();
      await Firebase.initializeApp();
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets('works correctly', (WidgetTester tester) async {
      final List<MethodCall> methodCallLog = <MethodCall>[];
      SystemChannels.platform
          .setMockMethodCallHandler((MethodCall methodCall) async {
        methodCallLog.add(methodCall);
      });

      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: const CopyContentLinkWidget(
          publicLink: 'testLink',
          contentID: 0,
        ),
      );
      await tester.pumpAndSettle();
      final Finder copyButton = find.byKey(copyButtonKey);

      expect(copyButton, findsOneWidget);

      await tester.ensureVisible(copyButton);
      await tester.pumpAndSettle();
      await tester.tap(copyButton);
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(linkCopiedString), findsOneWidget);
      expect(methodCallLog.isEmpty, false);
      expect(methodCallLog.length, 2);
      expect(
        methodCallLog.last,
        isMethodCall(
          'Clipboard.setData',
          arguments: <String, dynamic>{
            'text': 'testLink',
          },
        ),
      );
    });
  });
}
