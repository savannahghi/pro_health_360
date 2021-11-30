// Dart imports:
import 'dart:convert';

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


@GenerateMocks(<Type>[BaseRequest, Client])
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

      final mocks.MockBaseRequest baseRequest = mocks.MockBaseRequest();

      when(baseRequest.send()).thenAnswer((_) {
        final String jsonCreds = json.encode(mockFeedContent);
        final List<int> responseBytes = utf8.encode(jsonCreds);
        final StreamedResponse streamedResponse =
            StreamedResponse(Stream<List<int>>.value(responseBytes), 200);

        return Future<StreamedResponse>.value(streamedResponse);
      });

      when(baseRequest.headers).thenAnswer((_) => <String, String>{});

      final StreamedResponse resp = await customClient.send(baseRequest);

      final Response normalResponse = await Response.fromStream(resp);

      final Map<String, dynamic> body =
          json.decode(normalResponse.body) as Map<String, dynamic>;

      expect(body, mockFeedContent);
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

      final mocks.MockBaseRequest baseRequest = mocks.MockBaseRequest();

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

      final StreamedResponse resp = await customClient.send(baseRequest);

      final Response normalResponse = await Response.fromStream(resp);

      final Map<String, dynamic> body =
          json.decode(normalResponse.body) as Map<String, dynamic>;

      expect(body, mockFeedContent);
      expect(store.state.credentials?.idToken, mockAuthCredentials['idToken']);
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
