// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/address.dart';
import 'package:myafyahub/domain/core/entities/core/health_diary_state.dart';
import 'package:myafyahub/domain/core/entities/core/related_person.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

part 'client_state.freezed.dart';
part 'client_state.g.dart';

@freezed
class ClientState with _$ClientState {
  factory ClientState({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'active', defaultValue: false) bool? active,
    @JsonKey(name: 'addresses') List<Address>? addresses,
    @JsonKey(name: 'counselled', defaultValue: false)
        bool? counselled,
    @JsonKey(name: 'clientType', defaultValue: ClientType.UNKNOWN)
        ClientType? clientType,
    @JsonKey(name: 'facilityID') String? facilityID,
    @JsonKey(name: 'relatedPersons') List<RelatedPerson>? relatedPersons,
    @JsonKey(name: 'treatmentBuddy') String? treatmentBuddy,
    @JsonKey(name: 'treatmentEnrollmentDate') String? treatmentEnrollmentDate,
    @JsonKey(name: 'user') User? user,

    ///others
    @JsonKey(name: 'lastMoodRecordedDate') String? lastMoodRecordedDate,
    @JsonKey(name: 'isSignedIn') bool? isSignedIn,
    @JsonKey(name: 'facilityName') String? facilityName,
    @JsonKey(name: 'facilityPhoneNumber') String? facilityPhoneNumber,
    @JsonKey(name: 'chvUserID') String? chvUserID,
    @JsonKey(name: 'chvUserName') String? chvUserName,



    /// The client's health diary state
    HealthDiaryState? healthDiaryState,
  }) = _ClientState;

  factory ClientState.fromJson(Map<String, dynamic> json) =>
      _$ClientStateFromJson(json);

  factory ClientState.initial() => ClientState(
        id: UNKNOWN,
        user: User.initial(),
        treatmentEnrollmentDate: UNKNOWN,
        clientType: ClientType.UNKNOWN,
        active: false,
        addresses: <Address>[],
        relatedPersons: <RelatedPerson>[],
        facilityID: UNKNOWN,
        treatmentBuddy: UNKNOWN,
        counselled: false,
        lastMoodRecordedDate: UNKNOWN,
        isSignedIn: false,
        facilityName: UNKNOWN,
        healthDiaryState: HealthDiaryState.initial(),
      );
}
