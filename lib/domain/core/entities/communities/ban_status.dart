// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ban_status.freezed.dart';
part 'ban_status.g.dart';

@freezed
class ExtraData with _$ExtraData {
  factory ExtraData({
    @Default(false) @JsonKey(name: 'bannedInCommunity') bool bannedInCommunity,
  }) = _ExtraData;

  factory ExtraData.fromJson(Map<String, dynamic> json) =>
      _$ExtraDataFromJson(json);
}
