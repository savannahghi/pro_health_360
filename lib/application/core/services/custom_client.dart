import 'dart:convert';

import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_credentials_action.dart';
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';

class CustomClient extends GraphQlClient {
  CustomClient(
    String idToken,
    String endpoint, {
    required this.context,
    required String refreshTokenEndpoint,
    required this.userID,
  }) : super(idToken, endpoint) {
    refreshTokenEndpoint =
        AppWrapperBase.of(context)?.customContext?.refreshTokenEndpoint ?? '';
  }

  late String refreshTokenEndpoint;
  final String userID;
  final BuildContext context;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    request.headers.addAll(this.requestHeaders);
    final StreamedResponse response = await request.send();

    if (response.statusCode == 401) {
      return refreshToken(request);
    } else {
      return response;
    }
  }

  Future<StreamedResponse> refreshToken(BaseRequest request) async {
    final Response refreshTokenResponse = await this.post(
      Uri.parse(refreshTokenEndpoint),
      body: jsonEncode(<String, String>{'userID': userID}),
    );

    if (refreshTokenResponse.statusCode == 200 ||
        refreshTokenResponse.statusCode == 201 ||
        refreshTokenResponse.statusCode == 202) {
      final Map<String, dynamic> body =
          jsonDecode(refreshTokenEndpoint) as Map<String, dynamic>;

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

    return request.send();
  }
}
