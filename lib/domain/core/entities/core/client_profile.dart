import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/core/contact.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

part 'client_profile.freezed.dart';
part 'client_profile.g.dart';

@freezed
class ClientProfile with _$ClientProfile {
  factory ClientProfile({
    @JsonKey(name: 'user') User? user,
    @JsonKey(name: 'treatmentEnrollmentDate') String? treatmentEnrollmentDate,
    @JsonKey(name: 'clientType') ClientType? clientType,
    @JsonKey(name: 'active', defaultValue: false) bool? active,
    @JsonKey(name: 'addresses') List<Address>? addresses,
    @JsonKey(name: 'relatedPersons') List<RelatedPerson>? relatedPersons,
    @JsonKey(name: 'facilityID') String? facilityID,
    @JsonKey(name: 'treatmentBuddy') String? treatmentBuddy,
    @JsonKey(name: 'clientCounselled', defaultValue: false)
        bool? clientCounselled,

    ///others
    @JsonKey(name: 'lastMoodRecordedDate') String? lastMoodRecordedDate,
    @JsonKey(name: 'isSignedIn') bool? isSignedIn,
  }) = _ClientProfile;

  factory ClientProfile.fromJson(Map<String, dynamic> json) =>
      _$ClientProfileFromJson(json);

  factory ClientProfile.initial() => ClientProfile(
        user: User.initial(),
        treatmentEnrollmentDate: UNKNOWN,
        clientType: ClientType.UNKNOWN,
        active: false,
        addresses: <Address>[],
        relatedPersons: <RelatedPerson>[],
        facilityID: UNKNOWN,
        treatmentBuddy: UNKNOWN,
        clientCounselled: false,
      );
}

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

@freezed
class RelatedPerson with _$RelatedPerson {
  factory RelatedPerson({
    @JsonKey(name: 'active') bool? active,
    @JsonKey(name: 'relatedTo') String? relatedTo,
    @JsonKey(name: 'relationshipType', defaultValue: RelationshipType.UNKNOWN)
        RelationshipType? relationshipType,
    @JsonKey(name: 'firstName') String? firstName,
    @JsonKey(name: 'lastName') String? lastName,
    @JsonKey(name: 'otherName') String? otherName,
    @JsonKey(name: 'gender') Gender? gender,
    @JsonKey(name: 'dateOfBirth') String? dateOfBirth,
    @JsonKey(name: 'addresses') List<Address>? addresses,
    @JsonKey(name: 'contacts') List<Contact>? contacts,
  }) = _RelatedPerson;

  factory RelatedPerson.fromJson(Map<String, dynamic> json) =>
      _$RelatedPersonFromJson(json);

  factory RelatedPerson.initial() => RelatedPerson(
        active: false,
        relatedTo: UNKNOWN,
        relationshipType: RelationshipType.UNKNOWN,
        firstName: UNKNOWN,
        lastName: UNKNOWN,
        otherName: UNKNOWN,
        gender: Gender.unknown,
        dateOfBirth: UNKNOWN,
        addresses: <Address>[],
        contacts: <Contact>[],
      );
}
