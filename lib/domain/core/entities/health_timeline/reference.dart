// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reference.freezed.dart';
part 'reference.g.dart';

/// A reference from one resource to another
@freezed
class Reference with _$Reference {
  factory Reference({
    /// A reference to a location at which the other resource is found.
    ///
    ///  The reference may be a relative reference, in which case it is
    ///  relative to the service base URL, or an absolute URL that resolves
    ///  to the location where the resource is found. The reference may be
    ///  version specific or not. If the reference is not to a FHIR RESTful
    ///  server, then it should be assumed to be version specific. Internal
    ///  fragment references (start with '#') refer to contained resources.
    @JsonKey(name: 'Reference') String? reference,
    @JsonKey(name: 'Display') String? display,
  }) = _Reference;

  factory Reference.fromJson(Map<String, dynamic> json) =>
      _$ReferenceFromJson(json);
}
