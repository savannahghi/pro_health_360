// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_credentials_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';
import 'package:myafyahub/domain/core/entities/core/generic_response.dart';

class CustomClient extends IGraphQlClient {
  CustomClient(
    String idToken,
    String endpoint, {
    required this.context,
    required this.refreshTokenEndpoint,
    required this.userID,
    Client? client,
  }) : _client = client ?? Client() {
    super.idToken = idToken;
    super.endpoint = endpoint;
  }

  final String refreshTokenEndpoint;
  final String userID;
  final BuildContext context;
  final Client _client;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    request.headers.addAll(this.requestHeaders);

    final Request requestObj = request as Request;

    final StreamedResponse initalResponse = await request.send();

    final String jsonBody = await initalResponse.stream.bytesToString();
    final Map<String, dynamic> body =
        jsonDecode(jsonBody) as Map<String, dynamic>;

    final Request newRequest = Request(
      request.method,
      request.url,
    );
    newRequest.headers.addAll(request.headers);
    newRequest.encoding = requestObj.encoding;
    newRequest.body = requestObj.body;
    newRequest.bodyBytes = requestObj.bodyBytes;

    Map<String, dynamic>? errorMessage;

    if (body.containsKey('data')) {
      final GenericResponse genericResponce = GenericResponse.fromJson(body);
      errorMessage = genericResponce.errors?.firstWhere(
        (Map<String, dynamic> error) {
          if (error.containsKey('message')) {
            final String message = error['message'] as String;
            return message.contains('401');
          }

          return false;
        },
        orElse: () => <String, dynamic>{},
      );
    } else if (body.containsKey('message')) {
      final String message = body['message'] as String;
      if (message.contains('401')) {
        errorMessage = <String, dynamic>{'message': body[message]};
      }
    }

    final bool isSignedIn =
        StoreProvider.state<AppState>(context)?.credentials?.isSignedIn ??
            false;

    if (initalResponse.statusCode == 401 && isSignedIn ||
        errorMessage != null && errorMessage.isNotEmpty) {
      AuthCredentials? authCredentials = await refreshToken();

      if (authCredentials.idToken != null &&
          authCredentials.expiresIn != null &&
          authCredentials.refreshToken != null) {
        newRequest.headers.addAll(<String, String>{
          'Authorization': 'Bearer ${authCredentials.idToken}'
        });

        final DateTime expiryTimestamp =
            getTokenExpiryTimestamp(authCredentials.expiresIn);

        authCredentials = authCredentials.copyWith(
          tokenExpiryTimestamp: expiryTimestamp.toIso8601String(),
        );

        StoreProvider.dispatch(
          context,
          UpdateCredentialsAction(
            idToken: authCredentials.idToken,
            refreshToken: authCredentials.refreshToken,
            expiresIn: authCredentials.expiresIn,
            tokenExpiryTimestamp: authCredentials.tokenExpiryTimestamp,
          ),
        );

        return newRequest.send();
      }
      return newRequest.send();
    }

    return newRequest.send();
  }

  Future<AuthCredentials> refreshToken() async {
    final Response refreshTokenResponse = await _client.post(
      Uri.parse(refreshTokenEndpoint),
      headers: <String, String>{'content-type': 'application/json'},
      body: jsonEncode(<String, String>{'userID': userID}),
    );

    if (refreshTokenResponse.statusCode == 200) {
      final Map<String, dynamic> body =
          jsonDecode(refreshTokenResponse.body) as Map<String, dynamic>;

      return AuthCredentials.fromJson(body);
    }

    return AuthCredentials();
  }
}
