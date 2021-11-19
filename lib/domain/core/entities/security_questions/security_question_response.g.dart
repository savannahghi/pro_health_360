// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_question_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SecurityQuestionResponse _$_$_SecurityQuestionResponseFromJson(
    Map<String, dynamic> json) {
  return _$_SecurityQuestionResponse(
    id: json['id'] as String?,
    timeStamp: json['timeStamp'] as String?,
    userId: json['userId'] as String?,
    securityQuestionId: json['securityQuestionId'] as String?,
    response: json['response'] as String?,
  );
}

Map<String, dynamic> _$_$_SecurityQuestionResponseToJson(
        _$_SecurityQuestionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timeStamp': instance.timeStamp,
      'userId': instance.userId,
      'securityQuestionId': instance.securityQuestionId,
      'response': instance.response,
    };
