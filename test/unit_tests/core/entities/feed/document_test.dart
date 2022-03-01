// Package imports:

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/feed/document.dart';

void main() {
  test('Document fromJson', () {
    expect(
      Document.fromJson(<String, dynamic>{
        'ID': 1,
        'title': '1',
      }),
      isA<Document>(),
    );
  });

  test('Document initial is set', () {
    final Document initialAddress = Document.initial();

    expect(
      initialAddress.id,
      0,
    );
    expect(
      initialAddress.documentData,
      DocumentData.initial(),
    );
  });

  test('DocumentMetaData fromJson', () {
    expect(
      DocumentMetaData.fromJson(<String, dynamic>{
        'documentDownloadUrl': UNKNOWN,
      }),
      isA<DocumentMetaData>(),
    );
  });
}
