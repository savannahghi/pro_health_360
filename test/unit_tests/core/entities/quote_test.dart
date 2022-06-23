// Package imports:

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/domain/core/entities/health_diary/quote.dart';
import '../../../mocks.dart';

void main() {
  test('Quote should convert data to/from JSON', () {
    final QuoteRelay quoteRelay = QuoteRelay.fromJson(mockQuote);

    expect(quoteRelay.quote, isA<Quote>());
    expect(quoteRelay.quote!.quote, 'Health at your fingerprints');
    expect(quoteRelay.quote!.author, 'myAfyaHub');

    expect(QuoteRelay.initial().quote!.author, UNKNOWN);
    expect(Quote.initial().quote, UNKNOWN);
  });
}
