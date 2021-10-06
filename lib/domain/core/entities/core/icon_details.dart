import 'package:freezed_annotation/freezed_annotation.dart';

part 'icon_details.freezed.dart';
part 'icon_details.g.dart';

@freezed
class IconDetails with _$IconDetails {
  factory IconDetails({
    @JsonKey(name: 'url') required String iconUrlSvgPath,
  }) = _IconDetails;

  factory IconDetails.fromJson(Map<String, dynamic> json) =>
      _$IconDetailsFromJson(json);
}
