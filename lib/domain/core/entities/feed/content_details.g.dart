// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentDetails _$ContentDetailsFromJson(Map<String, dynamic> json) {
  return ContentDetails(
    content: Content.fromJson(json['content'] as Map<String, dynamic>),
    showReactions: json['showReactions'] as bool,
    contentDisplayedType: _$enumDecode(
        _$ContentDisplayedTypeEnumMap, json['contentDisplayedType']),
  );
}

Map<String, dynamic> _$ContentDetailsToJson(ContentDetails instance) =>
    <String, dynamic>{
      'content': instance.content,
      'showReactions': instance.showReactions,
      'contentDisplayedType':
          _$ContentDisplayedTypeEnumMap[instance.contentDisplayedType],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$ContentDisplayedTypeEnumMap = {
  ContentDisplayedType.RECENT: 'RECENT',
  ContentDisplayedType.FEED: 'FEED',
  ContentDisplayedType.BOOKMARK: 'BOOKMARK',
  ContentDisplayedType.UNKNOWN: 'UNKNOWN',
};
