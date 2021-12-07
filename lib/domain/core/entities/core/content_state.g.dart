// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContentState _$_$_ContentStateFromJson(Map<String, dynamic> json) {
  return _$_ContentState(
    feedContentState: json['feedContentState'] == null
        ? null
        : FeedContentState.fromJson(
            json['feedContentState'] as Map<String, dynamic>),
    savedContentState: json['savedContentState'] == null
        ? null
        : SavedContentState.fromJson(
            json['savedContentState'] as Map<String, dynamic>),
    recentContentState: json['recentContentState'] == null
        ? null
        : RecentContentState.fromJson(
            json['recentContentState'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ContentStateToJson(_$_ContentState instance) =>
    <String, dynamic>{
      'feedContentState': instance.feedContentState,
      'savedContentState': instance.savedContentState,
      'recentContentState': instance.recentContentState,
    };
