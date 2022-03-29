// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coding.freezed.dart';
part 'coding.g.dart';

/// A reference to a code defined by a terminology system.
@freezed
class Coding with _$Coding {
  factory Coding({
    /// The identification of the code system that defines the meaning of the
    ///  symbol in the code.
    @JsonKey(name: 'system') String? system,

    /// A symbol in syntax defined by the system. The symbol may be a
    ///  predefined code or an expression in a syntax defined by the coding
    ///  system (e.g. post-coordination).
    @JsonKey(name: 'code') String? code,

    /// A representation of the meaning of the code in the system, following
    ///  the rules of the system.
    @JsonKey(name: 'display') String? display,
  }) = _Coding;

  factory Coding.fromJson(Map<String, dynamic> json) => _$CodingFromJson(json);
}
