// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuoteRelay _$$_QuoteRelayFromJson(Map<String, dynamic> json) =>
    _$_QuoteRelay(
      quotes: (json['getHealthDiaryQuote'] as List<dynamic>?)
          ?.map((e) => Quote.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_QuoteRelayToJson(_$_QuoteRelay instance) =>
    <String, dynamic>{
      'getHealthDiaryQuote': instance.quotes,
    };

_$_Quote _$$_QuoteFromJson(Map<String, dynamic> json) => _$_Quote(
      author: json['author'] as String?,
      quote: json['quote'] as String?,
    );

Map<String, dynamic> _$$_QuoteToJson(_$_Quote instance) => <String, dynamic>{
      'author': instance.author,
      'quote': instance.quote,
    };
