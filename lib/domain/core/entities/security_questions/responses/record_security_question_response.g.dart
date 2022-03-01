// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_security_question_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecordSecurityQuestionResponse _$$_RecordSecurityQuestionResponseFromJson(
        Map<String, dynamic> json) =>
    _$_RecordSecurityQuestionResponse(
      securityQuestionID: json['securityQuestionID'] as String?,
      isCorrect: json['isCorrect'] as bool? ?? true,
    );

Map<String, dynamic> _$$_RecordSecurityQuestionResponseToJson(
        _$_RecordSecurityQuestionResponse instance) =>
    <String, dynamic>{
      'securityQuestionID': instance.securityQuestionID,
      'isCorrect': instance.isCorrect,
    };
