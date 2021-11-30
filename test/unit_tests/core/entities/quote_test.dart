// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/health_diary/quote.dart';

// Project imports:
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
