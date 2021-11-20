// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/enums.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  factory Address({
    @JsonKey(name: 'addressType') AddressType? addressType,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'country') String? country,
    @JsonKey(name: 'postalCode') String? postalCode,
    @JsonKey(name: 'county') String? county,
    @JsonKey(name: 'active', defaultValue: false) bool? active,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  factory Address.initial() => Address(
        addressType: AddressType.UNKNOWN,
        text: UNKNOWN,
        country: UNKNOWN,
        postalCode: UNKNOWN,
        county: UNKNOWN,
        active: false,
      );
}
