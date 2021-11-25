import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'author.freezed.dart';
part 'author.g.dart';


@freezed
class Author with _$Author {
  factory Author({@JsonKey(name: 'ID') String? id}) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  factory Author.initial() => Author(id: UNKNOWN);
}
