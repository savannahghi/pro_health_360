// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContentState _$$_ContentStateFromJson(Map<String, dynamic> json) =>
    _$_ContentState(
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
      categoriesList: json['categoriesList'] == null
          ? null
          : ListContentCategory.fromJson(
              json['categoriesList'] as Map<String, dynamic>),
      contentEngagementState: json['contentEngagementState'] == null
          ? null
          : ContentEngagementState.fromJson(
              json['contentEngagementState'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ContentStateToJson(_$_ContentState instance) =>
    <String, dynamic>{
      'feedContentState': instance.feedContentState,
      'savedContentState': instance.savedContentState,
      'recentContentState': instance.recentContentState,
      'categoriesList': instance.categoriesList,
      'contentEngagementState': instance.contentEngagementState,
    };
