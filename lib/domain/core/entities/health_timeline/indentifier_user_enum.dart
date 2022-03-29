// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

/// The purpose of an identifier
enum IdentifierUseEnum {
  @JsonValue('usual')
  usual,
  @JsonValue('official')
  official,
  @JsonValue('temp')
  temp,
  @JsonValue('secondary')
  secondary,
  @JsonValue('old')
  old,
}
