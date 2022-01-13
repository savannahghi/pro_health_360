// Flutter imports:
import 'dart:io';
import 'dart:typed_data';

import 'package:app_wrapper/app_wrapper.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class FetchPDFAction {
  static Future<File> loadNetwork(String pdfUrl, BuildContext context) async {
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final http.Response response = await _client.callRESTAPI(
      endpoint: pdfUrl,
      method: httpGET,
    );

    final Uint8List bytes = response.bodyBytes;

    return _storeFile(pdfUrl, bytes);
  }

  static Future<File> _storeFile(String url, List<int> bytes) async {
    final String filename = basename(url);
    final Directory dir = await getApplicationDocumentsDirectory();

    final File file = File('${dir.path}/$filename');
    file.writeAsBytesSync(bytes, flush: true);
    return file;
  }
}
