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

    final StreamedResponse initialResponse = await request.send();

    final bool isSignedIn =
        StoreProvider.state<AppState>(context)?.credentials?.isSignedIn ??
            false;

    if (initialResponse.statusCode == 401 && isSignedIn) {
      await refreshToken(request);
      return request.send();
    } else {
      return initialResponse;
    }
  }

  Future<void> refreshToken(BaseRequest request) async {
    final Response refreshTokenResponse = await _client.post(
      Uri.parse(refreshTokenEndpoint),
      headers: <String, String>{'content-type': 'application/json'},
      body: jsonEncode(<String, String>{'userID': userID}),
    );

    if (refreshTokenResponse.statusCode == 200) {
      final Map<String, dynamic> body =
          jsonDecode(refreshTokenResponse.body) as Map<String, dynamic>;

      AuthCredentials authCredentials = AuthCredentials.fromJson(body);

      request.headers.update(
        'Authorization',
        (String value) => 'Bearer ${authCredentials.idToken}',
      );

      final DateTime now = DateTime.now();
      final String? expiresIn = authCredentials.expiresIn;
      if (expiresIn != null && expiresIn.isNotEmpty && isNumeric(expiresIn)) {
        final DateTime tokenExpiryTimestamp =
            now.add(Duration(seconds: int.tryParse(expiresIn) ?? 0));

        authCredentials = authCredentials.copyWith(
          tokenExpiryTimestamp: tokenExpiryTimestamp.toIso8601String(),
        );
      }

      StoreProvider.dispatch(
        context,
        UpdateCredentialsAction(
          idToken: authCredentials.idToken,
          refreshToken: authCredentials.refreshToken,
          expiresIn: authCredentials.expiresIn,
          tokenExpiryTimestamp: authCredentials.tokenExpiryTimestamp,
        ),
      );
    }
  }
}
