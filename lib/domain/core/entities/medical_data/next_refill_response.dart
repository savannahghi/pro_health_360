// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/medical_data/next_refill_data.dart';

part 'next_refill_response.freezed.dart';
part 'next_refill_response.g.dart';

@freezed
class NextRefillResponse with _$NextRefillResponse {
  factory NextRefillResponse({
    @JsonKey(name: 'data') NextRefillData? data,
  }) = _NextRefillResponse;

  factory NextRefillResponse.fromJson(Map<String, dynamic> json) =>
      _$NextRefillResponseFromJson(json);

  factory NextRefillResponse.initial() => NextRefillResponse(
        data: NextRefillData.initial(),
      );
}
