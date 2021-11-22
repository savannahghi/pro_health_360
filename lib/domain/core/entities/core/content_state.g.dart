// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContentState _$_$_ContentStateFromJson(Map<String, dynamic> json) {
  return _$_ContentState(
    contentItems: (json['items'] as List<dynamic>?)
        ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_ContentStateToJson(_$_ContentState instance) =>
    <String, dynamic>{
      'items': instance.contentItems,
    };
