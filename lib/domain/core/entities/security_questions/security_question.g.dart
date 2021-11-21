// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SecurityQuestion _$_$_SecurityQuestionFromJson(Map<String, dynamic> json) {
  return _$_SecurityQuestion(
    securityQuestionID: json['SecurityQuestionID'] as String?,
    questionStem: json['QuestionStem'] as String?,
    description: json['Description'] as String?,
    responseType: json['ResponseType'] as String?,
    active: json['Active'] as bool?,
  );
}

Map<String, dynamic> _$_$_SecurityQuestionToJson(
        _$_SecurityQuestion instance) =>
    <String, dynamic>{
      'SecurityQuestionID': instance.securityQuestionID,
      'QuestionStem': instance.questionStem,
      'Description': instance.description,
      'ResponseType': instance.responseType,
      'Active': instance.active,
    };
