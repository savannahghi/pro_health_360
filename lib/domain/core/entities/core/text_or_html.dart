// Package imports:
import 'package:dartz/dartz.dart';

/// Determines whether the [value] is either text or html
///
/// Uses a basic html regex for validation
class TextOrHtml {
  const TextOrHtml._(this.value);

  factory TextOrHtml.withValue(String value) {
    return TextOrHtml._(
      validateText(value),
    );
  }

  final Either<String, String> value;
}

/// [validateText] checks whether the input contains html tags or not
Either<String, String> validateText(String input) {
  final RegExp validHtmlRegex = RegExp(r'''<[a-z\/][\s\S]*>''');

  if (validHtmlRegex.hasMatch(input)) {
    return right(input);
  } else {
    return left(input);
  }
}
