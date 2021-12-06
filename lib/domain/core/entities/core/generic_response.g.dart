// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GenericResponse _$_$_GenericResponseFromJson(Map<String, dynamic> json) {
  return _$_GenericResponse(
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as Map<String, dynamic>)
        .toList(),
    data: json['data'] as Map<String, dynamic>?,
  );
}

Map<String, dynamic> _$_$_GenericResponseToJson(_$_GenericResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'data': instance.data,
    };
