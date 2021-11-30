// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuoteRelay _$_$_QuoteRelayFromJson(Map<String, dynamic> json) {
  return _$_QuoteRelay(
    quote: json['getHealthDiaryQuote'] == null
        ? null
        : Quote.fromJson(json['getHealthDiaryQuote'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_QuoteRelayToJson(_$_QuoteRelay instance) =>
    <String, dynamic>{
      'getHealthDiaryQuote': instance.quote,
    };

_$_Quote _$_$_QuoteFromJson(Map<String, dynamic> json) {
  return _$_Quote(
    author: json['author'] as String?,
    quote: json['quote'] as String?,
  );
}

Map<String, dynamic> _$_$_QuoteToJson(_$_Quote instance) => <String, dynamic>{
      'author': instance.author,
      'quote': instance.quote,
    };
