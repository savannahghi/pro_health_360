// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_content_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SavedContentState _$$_SavedContentStateFromJson(Map<String, dynamic> json) =>
    _$_SavedContentState(
      savedContentItems: (json['items'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Content.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorFetchingContent: json['errorFetchingContent'] as bool?,
      timeoutFetchingContent: json['timeoutFetchingContent'] as bool?,
    );

Map<String, dynamic> _$$_SavedContentStateToJson(
        _$_SavedContentState instance) =>
    <String, dynamic>{
      'items': instance.savedContentItems,
      'errorFetchingContent': instance.errorFetchingContent,
      'timeoutFetchingContent': instance.timeoutFetchingContent,
    };
