import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myafyahub/domain/core/entities/core/address.dart';
import 'package:myafyahub/domain/core/entities/core/related_person.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

part 'client_state.freezed.dart';
part 'client_state.g.dart';

@freezed
class ClientState with _$ClientState {
  factory ClientState({
    @JsonKey(name: 'active', defaultValue: false) bool? active,
    @JsonKey(name: 'addresses') List<Address>? addresses,
    @JsonKey(name: 'clientCounselled', defaultValue: false)
        bool? clientCounselled,
    @JsonKey(name: 'clientType') ClientType? clientType,
    @JsonKey(name: 'facilityID') String? facilityID,
    @JsonKey(name: 'relatedPersons') List<RelatedPerson>? relatedPersons,
    @JsonKey(name: 'treatmentBuddy') String? treatmentBuddy,
    @JsonKey(name: 'treatmentEnrollmentDate') String? treatmentEnrollmentDate,
    @JsonKey(name: 'user') User? user,

    ///others
    @JsonKey(name: 'lastMoodRecordedDate') String? lastMoodRecordedDate,
    @JsonKey(name: 'isSignedIn') bool? isSignedIn,
  }) = _ClientState;

  factory ClientState.fromJson(Map<String, dynamic> json) =>
      _$ClientStateFromJson(json);

  factory ClientState.initial() => ClientState(
        user: User.initial(),
        treatmentEnrollmentDate: UNKNOWN,
        clientType: ClientType.UNKNOWN,
        active: false,
        addresses: <Address>[],
        relatedPersons: <RelatedPerson>[],
        facilityID: UNKNOWN,
        treatmentBuddy: UNKNOWN,
        clientCounselled: false,
        lastMoodRecordedDate: UNKNOWN,
        isSignedIn: false,
      );
}
