import 'dart:io';
import 'dart:typed_data';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/content/widgets/document_content_widget.dart';
import 'package:shared_ui_components/platform_loader.dart';

import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('DocumentContentWidget', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('shows loading indicator while loading the pdf',
        (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: const DocumentContentPage(
          pdfTitle: 'Test',
          pdfUrl: 'testUrl',
        ),
      );
      await tester.pump();

      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });

    testWidgets('renders pdf', (WidgetTester tester) async {
      final String dir = Directory.current.path;
      final File pdfMockFile = File('$dir/test/tests_resources/test.pdf');
      final Uint8List pdfAsBytes = pdfMockFile.readAsBytesSync();
      pdfMockFile.writeAsBytesSync(pdfAsBytes, flush: true);

      final MockShortSILGraphQlClient mockGraphQlClient =
          MockShortSILGraphQlClient.withResponse(
        'idToken',
        'endpoint',
        Response(
          pdfMockFile.readAsStringSync(),
          201,
          headers: <String, String>{
            'Content-Type': 'application/pdf',
          },
        ),
      );

      const MethodChannel channel =
          MethodChannel('plugins.flutter.io/path_provider');
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        return '.';
      });
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: const DocumentContentPage(
          pdfTitle: 'Test',
          pdfUrl: 'testUrl.pdf',
        ),
      );
      await tester.pump(const Duration(minutes: 5));

      expect(find.byType(SILPlatformLoader), findsNothing);

      ///delete auto generated file for the test
      final File autoGeneratedFile = File('$dir/testUrl.pdf');
      autoGeneratedFile.deleteSync();
    });
  });
}
