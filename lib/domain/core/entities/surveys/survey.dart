import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey.freezed.dart';
part 'survey.g.dart';

@freezed
class Survey with _$Survey {
  factory Survey({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'link') String? link,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'projectID') String? projectID,
    @JsonKey(name: 'linkID') String? linkID,
    @JsonKey(name: 'formID') String? formID,
  }) = _Survey;

  factory Survey.fromJson(Map<String, dynamic> json) => _$SurveyFromJson(json);

  factory Survey.initial() => Survey(
        title: UNKNOWN,
        description: UNKNOWN,
        link: UNKNOWN,
        formID: UNKNOWN,
        id: UNKNOWN,
        linkID: UNKNOWN,
        projectID: UNKNOWN,
      );
}
