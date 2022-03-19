// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/address.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

// TODO(abiud): rewrite this action to cater for the new fields
class UpdateClientProfileAction extends ReduxAction<AppState> {
  UpdateClientProfileAction({
    this.id,
    this.active,
    this.lastMoodRecordedDate,
    this.isSignedIn,
    this.treatmentEnrollmentDate,
    this.counselled,
    this.clientType,
    this.facilityID,
    this.treatmentBuddy,
    this.facilityName,
    this.facilityPhoneNumber,
    this.chvUserID,
    this.chvUserName,
    this.addresses,
  });

  final String? id;
  final bool? active;
  final String? lastMoodRecordedDate;
  final bool? isSignedIn;
  final String? treatmentEnrollmentDate;
  final bool? counselled;
  final ClientType? clientType;
  final String? facilityID;
  final String? treatmentBuddy;
  final String? facilityName;
  final String? facilityPhoneNumber;
  final String? chvUserID;
  final String? chvUserName;
  final List<Address>? addresses;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith(
      clientState: state.clientState?.copyWith.call(
        id: this.id ?? state.clientState?.id,
        active: this.active ?? state.clientState?.active,
        isSignedIn: this.isSignedIn ?? state.clientState?.isSignedIn,
        lastMoodRecordedDate: this.lastMoodRecordedDate ??
            state.clientState?.lastMoodRecordedDate,
        treatmentEnrollmentDate: this.treatmentEnrollmentDate ??
            state.clientState!.treatmentEnrollmentDate,
        clientType: this.clientType ?? state.clientState?.clientType,
        counselled: this.counselled ?? state.clientState?.counselled,
        facilityID: this.facilityID ?? state.clientState?.facilityID,
        treatmentBuddy:
            this.treatmentBuddy ?? state.clientState?.treatmentBuddy,
        facilityName: this.facilityName ?? state.clientState?.facilityName,
        facilityPhoneNumber:
            this.facilityPhoneNumber ?? state.clientState?.facilityPhoneNumber,
        chvUserID: this.chvUserID ?? state.clientState?.chvUserID,
        chvUserName: this.chvUserName ?? state.clientState?.chvUserName,
        addresses: this.addresses ?? state.clientState?.addresses,
      ),
    );

    return newState;
  }
}
