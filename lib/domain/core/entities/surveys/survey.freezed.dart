// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'survey.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Survey _$SurveyFromJson(Map<String, dynamic> json) {
  return _Survey.fromJson(json);
}

/// @nodoc
mixin _$Survey {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'link')
  String? get link => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'projectID')
  int? get projectID => throw _privateConstructorUsedError;
  @JsonKey(name: 'linkID')
  int? get linkID => throw _privateConstructorUsedError;
  @JsonKey(name: 'formID')
  String? get formID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyCopyWith<Survey> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyCopyWith<$Res> {
  factory $SurveyCopyWith(Survey value, $Res Function(Survey) then) =
      _$SurveyCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'link') String? link,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'projectID') int? projectID,
      @JsonKey(name: 'linkID') int? linkID,
      @JsonKey(name: 'formID') String? formID});
}

/// @nodoc
class _$SurveyCopyWithImpl<$Res> implements $SurveyCopyWith<$Res> {
  _$SurveyCopyWithImpl(this._value, this._then);

  final Survey _value;
  // ignore: unused_field
  final $Res Function(Survey) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? link = freezed,
    Object? description = freezed,
    Object? projectID = freezed,
    Object? linkID = freezed,
    Object? formID = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      projectID: projectID == freezed
          ? _value.projectID
          : projectID // ignore: cast_nullable_to_non_nullable
              as int?,
      linkID: linkID == freezed
          ? _value.linkID
          : linkID // ignore: cast_nullable_to_non_nullable
              as int?,
      formID: formID == freezed
          ? _value.formID
          : formID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SurveyCopyWith<$Res> implements $SurveyCopyWith<$Res> {
  factory _$$_SurveyCopyWith(_$_Survey value, $Res Function(_$_Survey) then) =
      __$$_SurveyCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'link') String? link,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'projectID') int? projectID,
      @JsonKey(name: 'linkID') int? linkID,
      @JsonKey(name: 'formID') String? formID});
}

/// @nodoc
class __$$_SurveyCopyWithImpl<$Res> extends _$SurveyCopyWithImpl<$Res>
    implements _$$_SurveyCopyWith<$Res> {
  __$$_SurveyCopyWithImpl(_$_Survey _value, $Res Function(_$_Survey) _then)
      : super(_value, (v) => _then(v as _$_Survey));

  @override
  _$_Survey get _value => super._value as _$_Survey;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? link = freezed,
    Object? description = freezed,
    Object? projectID = freezed,
    Object? linkID = freezed,
    Object? formID = freezed,
  }) {
    return _then(_$_Survey(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      link: link == freezed
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      projectID: projectID == freezed
          ? _value.projectID
          : projectID // ignore: cast_nullable_to_non_nullable
              as int?,
      linkID: linkID == freezed
          ? _value.linkID
          : linkID // ignore: cast_nullable_to_non_nullable
              as int?,
      formID: formID == freezed
          ? _value.formID
          : formID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Survey implements _Survey {
  _$_Survey(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'link') this.link,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'projectID') this.projectID,
      @JsonKey(name: 'linkID') this.linkID,
      @JsonKey(name: 'formID') this.formID});

  factory _$_Survey.fromJson(Map<String, dynamic> json) =>
      _$$_SurveyFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'link')
  final String? link;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'projectID')
  final int? projectID;
  @override
  @JsonKey(name: 'linkID')
  final int? linkID;
  @override
  @JsonKey(name: 'formID')
  final String? formID;

  @override
  String toString() {
    return 'Survey(id: $id, title: $title, link: $link, description: $description, projectID: $projectID, linkID: $linkID, formID: $formID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Survey &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.link, link) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.projectID, projectID) &&
            const DeepCollectionEquality().equals(other.linkID, linkID) &&
            const DeepCollectionEquality().equals(other.formID, formID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(link),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(projectID),
      const DeepCollectionEquality().hash(linkID),
      const DeepCollectionEquality().hash(formID));

  @JsonKey(ignore: true)
  @override
  _$$_SurveyCopyWith<_$_Survey> get copyWith =>
      __$$_SurveyCopyWithImpl<_$_Survey>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SurveyToJson(this);
  }
}

abstract class _Survey implements Survey {
  factory _Survey(
      {@JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'title') final String? title,
      @JsonKey(name: 'link') final String? link,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'projectID') final int? projectID,
      @JsonKey(name: 'linkID') final int? linkID,
      @JsonKey(name: 'formID') final String? formID}) = _$_Survey;

  factory _Survey.fromJson(Map<String, dynamic> json) = _$_Survey.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'link')
  String? get link;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'projectID')
  int? get projectID;
  @override
  @JsonKey(name: 'linkID')
  int? get linkID;
  @override
  @JsonKey(name: 'formID')
  String? get formID;
  @override
  @JsonKey(ignore: true)
  _$$_SurveyCopyWith<_$_Survey> get copyWith =>
      throw _privateConstructorUsedError;
}
