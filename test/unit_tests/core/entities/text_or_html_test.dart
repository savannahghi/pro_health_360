// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/text_or_html.dart';

void main() {
  test('TextOrHtml should determine whether text is html or not', () {
    final TextOrHtml textWithoutHtml =
        TextOrHtml.withValue('text without html tags');
    textWithoutHtml.value.fold(
        (String textWithoutHtml) => 'text without html tags',
        (String textWithHtml) => null);

    final TextOrHtml textWithHtml =
        TextOrHtml.withValue('text with <html> tags </html>');
    textWithHtml.value.fold((String textWithoutHtml) => null,
        (String textWithHtml) => 'text with <html> tags </html>');
  });
}
