// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FeedDetails _$_$_FeedDetailsFromJson(Map<String, dynamic> json) {
  return _$_FeedDetails(
    coverImageUrl: json['coverImageUrl'] as String,
    header: json['header'] as String,
    date: json['date'] as String,
    readTime: json['readTime'] as String?,
    isNew: json['isNew'] as bool?,
  );
}

Map<String, dynamic> _$_$_FeedDetailsToJson(_$_FeedDetails instance) =>
    <String, dynamic>{
      'coverImageUrl': instance.coverImageUrl,
      'header': instance.header,
      'date': instance.date,
      'readTime': instance.readTime,
      'isNew': instance.isNew,
    };