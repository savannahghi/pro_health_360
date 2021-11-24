// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_security_question_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecordSecurityQuestionResponse _$_$_RecordSecurityQuestionResponseFromJson(
    Map<String, dynamic> json) {
  return _$_RecordSecurityQuestionResponse(
    securityQuestionID: json['securityQuestionID'] as String?,
    isCorrect: json['isCorrect'] as bool?,
  );
}

Map<String, dynamic> _$_$_RecordSecurityQuestionResponseToJson(
        _$_RecordSecurityQuestionResponse instance) =>
    <String, dynamic>{
      'securityQuestionID': instance.securityQuestionID,
      'isCorrect': instance.isCorrect,
    };
