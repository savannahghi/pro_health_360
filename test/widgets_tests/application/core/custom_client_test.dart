// Dart imports:
import 'dart:convert';
import 'dart:typed_data';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/src/base_request.dart';
import 'package:http/src/response.dart';
import 'package:http/src/streamed_response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:myafyahub/application/core/services/custom_client.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';
import '../../../mocks.dart';
import 'custom_client_test.mocks.dart' as mocks;

import 'package:myafyahub/infrastructure/endpoints.dart'
    as my_afya_hub_endpoints;


@GenerateMocks(<Type>[Request, Client])
void main() {
  group('CustomClient', () {
    testWidgets('should proceed normally if request is successful',
        (WidgetTester tester) async {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      late CustomClient customClient;

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: Builder(
            builder: (BuildContext context) {
              customClient = CustomClient(
                '',
                '',
                refreshTokenEndpoint: '',
                userID: '',
                context: context,
              );
              return Container();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final mocks.MockRequest baseRequest = mocks.MockRequest();
      final String jsonContent = json.encode(mockFeedContent);

      when(baseRequest.send()).thenAnswer((_) {
        final List<int> responseBytes = utf8.encode(jsonContent);
        final StreamedResponse streamedResponse =
            StreamedResponse(Stream<List<int>>.value(responseBytes), 200);

        return Future<StreamedResponse>.value(streamedResponse);
      });

      when(baseRequest.headers).thenAnswer((_) => <String, String>{});
      when(baseRequest.method).thenReturn('GET');
      when(baseRequest.url).thenReturn(
        Uri.parse(my_afya_hub_endpoints.kTestLoginByPhoneEndpoint),
      );
      when(baseRequest.encoding).thenReturn(Encoding.getByName('utf-8')!);
      when(baseRequest.body).thenReturn(jsonContent);
      when(baseRequest.bodyBytes).thenReturn(
        Uint8List.fromList(utf8.encode(jsonContent)),
      );

      final StreamedResponse resp = await customClient.send(baseRequest);

      expect(resp.contentLength, null);
    });

    testWidgets('should refresh token and then proceed normally',
        (WidgetTester tester) async {
      final AppState state = AppState(
        credentials: AuthCredentials(isSignedIn: true),
      );
      final Store<AppState> store = Store<AppState>(initialState: state);

      late CustomClient customClient;

      final mocks.MockClient client = mocks.MockClient();

      const String userId = 'some-user-id';

      when(
        client.post(
          any,
          headers: <String, String>{'content-type': 'application/json'},
          body: jsonEncode(<String, String>{'userID': userId}),
        ),
      ).thenAnswer((_) {
        return Future<Response>.value(
          Response(
            jsonEncode(mockAuthCredentials),
            200,
            request: Request(
              'POST',
              Uri.parse(my_afya_hub_endpoints.kTestRefreshTokenEndpoint),
            ),
            headers: <String, String>{'content-type': 'application/json'},
          ),
        );
      });

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: Builder(
            builder: (BuildContext context) {
              customClient = CustomClient(
                '',
                '',
                refreshTokenEndpoint:
                    my_afya_hub_endpoints.kTestRefreshTokenEndpoint,
                userID: userId,
                client: client,
                context: context,
              );
              return Container();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final mocks.MockRequest baseRequest = mocks.MockRequest();
      final String jsonContent = json.encode(mockFeedContent);

      when(baseRequest.headers).thenReturn(
        <String, String>{'content-type': 'application/json'},
      );

      when(baseRequest.send()).thenAnswer((_) {
        final String jsonCreds = json.encode(mockFeedContent);
        final List<int> responseBytes = utf8.encode(jsonCreds);
        final StreamedResponse streamedResponse =
            StreamedResponse(Stream<List<int>>.value(responseBytes), 401);

        return Future<StreamedResponse>.value(streamedResponse);
      });
      when(baseRequest.headers).thenAnswer((_) => <String, String>{});
      when(baseRequest.method).thenReturn('POST');
      when(baseRequest.url).thenReturn(
        Uri.parse(my_afya_hub_endpoints.kTestLoginByPhoneEndpoint),
      );
      when(baseRequest.encoding).thenReturn(Encoding.getByName('utf-8')!);
      when(baseRequest.body).thenReturn(jsonContent);
      when(baseRequest.bodyBytes).thenReturn(
        Uint8List.fromList(utf8.encode(jsonContent)),
      );

      await customClient.send(baseRequest);

      expect(store.state.credentials?.idToken, mockAuthCredentials['idToken']);
    });

    testWidgets(
        'should refresh token if response completes with 200 but message '
        'contains 401', (WidgetTester tester) async {
      final AppState state = AppState(
        credentials: AuthCredentials(isSignedIn: true),
      );
      final Store<AppState> store = Store<AppState>(initialState: state);

      late CustomClient customClient;

      final mocks.MockClient client = mocks.MockClient();

      const String userId = 'some-user-id';

      when(
        client.post(
          any,
          headers: <String, String>{'content-type': 'application/json'},
          body: jsonEncode(<String, String>{'userID': userId}),
        ),
      ).thenAnswer((_) {
        return Future<Response>.value(
          Response(
            jsonEncode(mockAuthCredentials),
            200,
            request: Request(
              'POST',
              Uri.parse(my_afya_hub_endpoints.kTestRefreshTokenEndpoint),
            ),
            headers: <String, String>{'content-type': 'application/json'},
          ),
        );
      });

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: Builder(
            builder: (BuildContext context) {
              customClient = CustomClient(
                '',
                '',
                refreshTokenEndpoint:
                    my_afya_hub_endpoints.kTestRefreshTokenEndpoint,
                userID: userId,
                client: client,
                context: context,
              );
              return Container();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final mocks.MockRequest baseRequest = mocks.MockRequest();

      final String jsonResponse = json.encode(mock401Response);

      final Map<String, dynamic> variables = <String, dynamic>{
        'categoryID': 1,
        'Limit': 5
      };
      final String jsonBody = jsonEncode(variables);

      when(baseRequest.headers).thenReturn(
        <String, String>{'content-type': 'application/json'},
      );

      when(baseRequest.send()).thenAnswer((_) {
        final List<int> responseBytes = utf8.encode(jsonResponse);
        final StreamedResponse streamedResponse =
            StreamedResponse(Stream<List<int>>.value(responseBytes), 200);

        return Future<StreamedResponse>.value(streamedResponse);
      });
      when(baseRequest.headers).thenAnswer((_) => <String, String>{});
      when(baseRequest.method).thenReturn('POST');
      when(baseRequest.url).thenReturn(
        Uri.parse(my_afya_hub_endpoints.kTestGraphqlEndpoint),
      );
      when(baseRequest.encoding).thenReturn(Encoding.getByName('utf-8')!);
      when(baseRequest.body).thenReturn(jsonBody);
      when(baseRequest.bodyBytes).thenReturn(
        Uint8List.fromList(utf8.encode(jsonBody)),
      );

      await customClient.send(baseRequest);
      expect(store.state.credentials?.idToken, mockAuthCredentials['idToken']);
    });

    testWidgets(
        'should refresh token if response completes with 200 but REST response '
        'body contains 401', (WidgetTester tester) async {
      final AppState state = AppState(
        credentials: AuthCredentials(isSignedIn: true),
      );
      final Store<AppState> store = Store<AppState>(initialState: state);

      late CustomClient customClient;

      final mocks.MockClient client = mocks.MockClient();

      const String userId = 'some-user-id';

      when(
        client.post(
          any,
          headers: <String, String>{'content-type': 'application/json'},
          body: jsonEncode(<String, String>{'userID': userId}),
        ),
      ).thenAnswer((_) {
        return Future<Response>.value(
          Response(
            jsonEncode(mockAuthCredentials),
            200,
            request: Request(
              'POST',
              Uri.parse(my_afya_hub_endpoints.kTestRefreshTokenEndpoint),
            ),
            headers: <String, String>{'content-type': 'application/json'},
          ),
        );
      });

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: Builder(
            builder: (BuildContext context) {
              customClient = CustomClient(
                '',
                '',
                refreshTokenEndpoint:
                    my_afya_hub_endpoints.kTestRefreshTokenEndpoint,
                userID: userId,
                client: client,
                context: context,
              );
              return Container();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final mocks.MockRequest baseRequest = mocks.MockRequest();

      final String jsonResponse = json.encode(
        <String, dynamic>{'message': mock401Response['errors'][0]['message']},
      );

      final Map<String, dynamic> variables = <String, dynamic>{
        'categoryID': 1,
        'Limit': 5
      };
      final String jsonBody = jsonEncode(variables);

      when(baseRequest.headers).thenReturn(
        <String, String>{'content-type': 'application/json'},
      );

      when(baseRequest.send()).thenAnswer((_) {
        final List<int> responseBytes = utf8.encode(jsonResponse);
        final StreamedResponse streamedResponse =
            StreamedResponse(Stream<List<int>>.value(responseBytes), 200);

        return Future<StreamedResponse>.value(streamedResponse);
      });
      when(baseRequest.headers).thenAnswer((_) => <String, String>{});
      when(baseRequest.method).thenReturn('POST');
      when(baseRequest.url).thenReturn(
        Uri.parse(my_afya_hub_endpoints.kTestGraphqlEndpoint),
      );
      when(baseRequest.encoding).thenReturn(Encoding.getByName('utf-8')!);
      when(baseRequest.body).thenReturn(jsonBody);
      when(baseRequest.bodyBytes).thenReturn(
        Uint8List.fromList(utf8.encode(jsonBody)),
      );

      await customClient.send(baseRequest);
      expect(store.state.credentials?.idToken, mockAuthCredentials['idToken']);
    });

    testWidgets(
        'should return response as is, if it contains errors but no 401',
        (WidgetTester tester) async {
      final AppState state = AppState(
        credentials: AuthCredentials(isSignedIn: true),
      );
      final Store<AppState> store = Store<AppState>(initialState: state);

      late CustomClient customClient;

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: Builder(
            builder: (BuildContext context) {
              customClient = CustomClient(
                '',
                '',
                refreshTokenEndpoint:
                    my_afya_hub_endpoints.kTestRefreshTokenEndpoint,
                userID: 'some-user-id',
                context: context,
              );
              return Container();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final mocks.MockRequest baseRequest = mocks.MockRequest();

      final String jsonResponse = json.encode(
        <String, dynamic>{
          'data': null,
          'errors': <Map<String, dynamic>>[
            <String, dynamic>{'message': 'some random error'}
          ]
        },
      );

      final Map<String, dynamic> variables = <String, dynamic>{
        'categoryID': 1,
        'Limit': 5
      };
      final String jsonBody = jsonEncode(variables);

      when(baseRequest.headers).thenReturn(
        <String, String>{'content-type': 'application/json'},
      );

      when(baseRequest.send()).thenAnswer((_) {
        final List<int> responseBytes = utf8.encode(jsonResponse);
        final StreamedResponse streamedResponse =
            StreamedResponse(Stream<List<int>>.value(responseBytes), 200);

        return Future<StreamedResponse>.value(streamedResponse);
      });
      when(baseRequest.headers).thenAnswer((_) => <String, String>{});
      when(baseRequest.method).thenReturn('POST');
      when(baseRequest.url).thenReturn(
        Uri.parse(my_afya_hub_endpoints.kTestGraphqlEndpoint),
      );
      when(baseRequest.encoding).thenReturn(Encoding.getByName('utf-8')!);
      when(baseRequest.body).thenReturn(jsonBody);
      when(baseRequest.bodyBytes).thenReturn(
        Uint8List.fromList(utf8.encode(jsonBody)),
      );

      final StreamedResponse resp = await customClient.send(baseRequest);
      expect(resp.contentLength, null);
    });

    testWidgets(
        'if error occurs while refreshing token should just return request as '
        'is', (WidgetTester tester) async {
      final AppState state = AppState(
        credentials: AuthCredentials(isSignedIn: true),
      );
      final Store<AppState> store = Store<AppState>(initialState: state);

      late CustomClient customClient;

      final mocks.MockClient client = mocks.MockClient();

      const String userId = 'some-user-id';

      when(
        client.post(
          any,
          headers: <String, String>{'content-type': 'application/json'},
          body: jsonEncode(<String, String>{'userID': userId}),
        ),
      ).thenAnswer((_) {
        return Future<Response>.value(
          Response(
            jsonEncode(<String, String>{'error': 'blah'}),
            200,
            request: Request(
              'POST',
              Uri.parse(my_afya_hub_endpoints.kTestRefreshTokenEndpoint),
            ),
            headers: <String, String>{'content-type': 'application/json'},
          ),
        );
      });

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: Builder(
            builder: (BuildContext context) {
              customClient = CustomClient(
                '',
                '',
                refreshTokenEndpoint:
                    my_afya_hub_endpoints.kTestRefreshTokenEndpoint,
                userID: userId,
                client: client,
                context: context,
              );
              return Container();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final mocks.MockRequest baseRequest = mocks.MockRequest();

      final String jsonResponse = json.encode(mock401Response);

      final Map<String, dynamic> variables = <String, dynamic>{
        'categoryID': 1,
        'Limit': 5
      };
      final String jsonBody = jsonEncode(variables);

      when(baseRequest.headers).thenReturn(
        <String, String>{'content-type': 'application/json'},
      );

      when(baseRequest.send()).thenAnswer((_) {
        final List<int> responseBytes = utf8.encode(jsonResponse);
        final StreamedResponse streamedResponse =
            StreamedResponse(Stream<List<int>>.value(responseBytes), 200);

        return Future<StreamedResponse>.value(streamedResponse);
      });
      when(baseRequest.headers).thenAnswer((_) => <String, String>{});
      when(baseRequest.method).thenReturn('POST');
      when(baseRequest.url).thenReturn(
        Uri.parse(my_afya_hub_endpoints.kTestGraphqlEndpoint),
      );
      when(baseRequest.encoding).thenReturn(Encoding.getByName('utf-8')!);
      when(baseRequest.body).thenReturn(jsonBody);
      when(baseRequest.bodyBytes).thenReturn(
        Uint8List.fromList(utf8.encode(jsonBody)),
      );

      final StreamedResponse resp = await customClient.send(baseRequest);
      expect(resp.contentLength, null);
    });

    testWidgets(
        'if error occurs while refreshing token should just return empty class',
        (WidgetTester tester) async {
      final AppState state = AppState(
        credentials: AuthCredentials(isSignedIn: true),
      );
      final Store<AppState> store = Store<AppState>(initialState: state);

      late CustomClient customClient;

      final mocks.MockClient client = mocks.MockClient();

      const String userId = 'some-user-id';

      when(
        client.post(
          any,
          headers: <String, String>{'content-type': 'application/json'},
          body: jsonEncode(<String, String>{'userID': userId}),
        ),
      ).thenAnswer((_) {
        return Future<Response>.value(
          Response(
            jsonEncode(<String, String>{'error': 'blah'}),
            400,
            request: Request(
              'POST',
              Uri.parse(my_afya_hub_endpoints.kTestRefreshTokenEndpoint),
            ),
            headers: <String, String>{'content-type': 'application/json'},
          ),
        );
      });

      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: Builder(
            builder: (BuildContext context) {
              customClient = CustomClient(
                '',
                '',
                refreshTokenEndpoint:
                    my_afya_hub_endpoints.kTestRefreshTokenEndpoint,
                userID: userId,
                client: client,
                context: context,
              );
              return Container();
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final AuthCredentials credentials = await customClient.refreshToken();
      expect(credentials, AuthCredentials());
    });
  });
}

class MockCustomClient extends CustomClient {
  MockCustomClient(
    String idToken,
    String endpoint, {
    required BuildContext context,
    required this.customResponse,
  }) : super(
          idToken,
          endpoint,
          refreshTokenEndpoint: kTestRefreshTokenEndpoint,
          userID: '',
          context: context,
        );

  final Map<String, dynamic> customResponse;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    super.send(request);
    final String jsonResponse = jsonEncode(customResponse);
    final List<int> byteResponse = utf8.encode(jsonResponse);

    return StreamedResponse(Stream<List<int>>.value(byteResponse), 200);
  }
}
