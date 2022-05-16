import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:myafyahub/domain/core/entities/core/get_stream_token.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';

class StreamTokenProvider {
  final IGraphQlClient client;
  final String endpoint;
  final void Function(String)? saveToken;

  StreamTokenProvider({
    required this.client,
    required this.endpoint,
    this.saveToken,
  });

  Future<String> tokenProvider(String userId) async {
    final Response httpResponse = await client.callRESTAPI(
      endpoint: endpoint,
      method: httpPOST,
      variables: <String, String>{'userID': userId},
    );

    final ProcessedResponse processedResponse =
        processHttpResponse(httpResponse);

    final Map<String, dynamic> responseBody =
        jsonDecode(httpResponse.body) as Map<String, dynamic>;

    if (processedResponse.ok) {
      final GetStreamToken result = GetStreamToken.fromJson(responseBody);
      saveToken?.call(result.getStreamToken ?? '');

      return result.getStreamToken ?? '';
    }

    return '';
  }
}
