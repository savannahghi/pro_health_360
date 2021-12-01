// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_diary_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HealthDiaryEdge _$_$_HealthDiaryEdgeFromJson(Map<String, dynamic> json) {
  return _$_HealthDiaryEdge(
    entries: (json['getClientHealthDiaryEntries'] as List<dynamic>?)
        ?.map((e) => HealthDiaryEntry.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_HealthDiaryEdgeToJson(_$_HealthDiaryEdge instance) =>
    <String, dynamic>{
      'getClientHealthDiaryEntries': instance.entries,
    };

_$_HealthDiaryEntry _$_$_HealthDiaryEntryFromJson(Map<String, dynamic> json) {
  return _$_HealthDiaryEntry(
    mood: json['mood'] as String?,
    note: json['note'] as String?,
    entryType: json['entryType'] as String?,
    createdAt: json['createdAt'] as String?,
    active: json['active'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_HealthDiaryEntryToJson(
        _$_HealthDiaryEntry instance) =>
    <String, dynamic>{
      'mood': instance.mood,
      'note': instance.note,
      'entryType': instance.entryType,
      'createdAt': instance.createdAt,
      'active': instance.active,
    };
