// Dart imports:
import 'dart:async';
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:flutter/services.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

// Project imports:
import 'mocks.dart';

http.StreamedResponse simpleResponse({required String body, int? status}) {
  final List<int> bytes = utf8.encode(body);
  final Stream<List<int>> stream =
      Stream<List<int>>.fromIterable(<List<int>>[bytes]);

  final http.StreamedResponse r = http.StreamedResponse(stream, status ?? 200);

  return r;
}

/// Runs [body] in a fresh [Zone] that provides mocked responses for [Image.network] widgets.
///
/// Behind the scenes, this creates a mocked HTTP client that responds with mocked
/// image data to all HTTP GET requests.
///
/// This is a workaround needed for widget tests that use network images. Without
/// the mocked HTTP client, any widget tests that pump a widget tree containing
/// [Image.network] widgets will crash.
///
/// By default, the mocked HTTP client will respond with [_transparentImage]. If
/// provided, it will use [imageBytes] instead.
///
/// Example usage in a test case:
///
/// ```
/// void main() {
///  testWidgets('should not crash', (WidgetTester tester) async {
///    provideMockedNetworkImages(() async {
///      await tester.pumpWidget(
///        MaterialApp(
///          home: Image.network('https://example.com/image.png'),
///        ),
///      );
///    });
///  });
/// }
/// ```

R provideMockedNetworkImages<R>(
  R Function() body, {
  List<int> imageBytes = _transparentImage,
}) {
  return HttpOverrides.runZoned(
    body,
    createHttpClient: (_) => _createMockImageHttpClient(_!, imageBytes),
  );
}

// Returns a mock HTTP client that responds with an image to all requests.
MockHttpClientIO _createMockImageHttpClient(
  SecurityContext _,
  List<int> imageBytes,
) {
  final MockHttpClientIO client = MockHttpClientIO();
  final MockHttpClientRequest request = MockHttpClientRequest();
  final MockHttpClientResponse response = MockHttpClientResponse();
  final MockHttpHeaders headers = MockHttpHeaders();

  when(client.getUrl(sampleUri))
      .thenAnswer((_) => Future<HttpClientRequest>.value(request));
  when(request.headers).thenReturn(headers);
  when(request.close())
      .thenAnswer((_) => Future<HttpClientResponse>.value(response));
  when(response.contentLength).thenReturn(_transparentImage.length);
  when(response.statusCode).thenReturn(HttpStatus.ok);
  when(response.listen(any)).thenAnswer((Invocation invocation) {
    final void Function(List<int>) onData =
        invocation.positionalArguments[0] as Function(List<int>);
    final void Function() onDone =
        invocation.namedArguments[#onDone] as Function();
    final void Function(Object, [StackTrace]) onError =
        invocation.namedArguments[#onError] as Function(Object, [StackTrace]);
    final bool cancelOnError =
        invocation.namedArguments[#cancelOnError] as bool;

    return Stream<List<int>>.fromIterable(<List<int>>[imageBytes]).listen(
      onData,
      onDone: onDone,
      onError: onError,
      cancelOnError: cancelOnError,
    );
  });

  return client;
}

const List<int> _transparentImage = <int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
];
typedef Callback = Function(MethodCall call);

dynamic setupFirebaseAuthMocks([Callback? customHandlers]) {
  TestWidgetsFlutterBinding.ensureInitialized();

  // ignore: always_specify_types
  MethodChannelFirebase.channel.setMockMethodCallHandler((call) async {
    if (call.method == 'Firebase#initializeCore') {
      // ignore: always_specify_types
      return [
        <String, dynamic>{
          'name': defaultFirebaseAppName,
          'options': <String, dynamic>{
            'apiKey': '123',
            'appId': '123',
            'messagingSenderId': '123',
            'projectId': '123',
          },
          'pluginConstants': <String, dynamic>{},
        }
      ];
    }

    if (call.method == 'Firebase#initializeApp') {
      return <String, dynamic>{
        'name': call.arguments['appName'],
        'options': call.arguments['options'],
        'pluginConstants': <String, dynamic>{},
      };
    }

    if (customHandlers != null) {
      customHandlers(call);
    }

    return null;
  });
}
