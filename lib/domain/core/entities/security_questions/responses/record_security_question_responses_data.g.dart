// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_security_question_responses_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecordSecurityQuestionResponsesData
    _$$_RecordSecurityQuestionResponsesDataFromJson(
            Map<String, dynamic> json) =>
        _$_RecordSecurityQuestionResponsesData(
          recordSecurityQuestionResponses:
              (json['recordSecurityQuestionResponses'] as List<dynamic>)
                  .map((e) => RecordSecurityQuestionResponse.fromJson(
                      e as Map<String, dynamic>))
                  .toList(),
        );

Map<String, dynamic> _$$_RecordSecurityQuestionResponsesDataToJson(
        _$_RecordSecurityQuestionResponsesData instance) =>
    <String, dynamic>{
      'recordSecurityQuestionResponses':
          instance.recordSecurityQuestionResponses,
    };
