// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/address.dart';
import 'package:pro_health_360/domain/core/entities/core/client_state.dart';
import 'package:pro_health_360/domain/core/entities/profile/caregiver_information.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';

class UpdateClientProfileAction extends ReduxAction<AppState> {
  UpdateClientProfileAction({
    this.id,
    this.active,
    this.lastMoodRecordedDate,
    this.isSignedIn,
    this.treatmentEnrollmentDate,
    this.counselled,
    this.clientTypes,
    this.facilityID,
    this.treatmentBuddy,
    this.facilityName,
    this.facilityPhoneNumber,
    this.chvUserID,
    this.chvUserName,
    this.addresses,
    this.cccNumber,
    this.caregiverInformation,
    this.notifications,
    this.hasCaregiverInfo,
  });

  final bool? active;
  final List<Address>? addresses;
  final CaregiverInformation? caregiverInformation;
  final String? cccNumber;
  final String? chvUserID;
  final String? chvUserName;
  final List<ClientType>? clientTypes;
  final bool? counselled;
  final String? facilityID;
  final String? facilityName;
  final String? facilityPhoneNumber;
  final bool? hasCaregiverInfo;
  final String? id;
  final bool? isSignedIn;
  final String? lastMoodRecordedDate;
  final List<NotificationDetails?>? notifications;
  final String? treatmentBuddy;
  final String? treatmentEnrollmentDate;

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
        clientTypes: this.clientTypes ?? state.clientState?.clientTypes,
        counselled: this.counselled ?? state.clientState?.counselled,
        facilityID: this.facilityID ?? state.clientState?.facilityID,
        treatmentBuddy:
            this.treatmentBuddy ?? state.clientState?.treatmentBuddy,
        facilityName: this.facilityName ?? state.clientState?.facilityName,
        facilityPhoneNumber:
            this.facilityPhoneNumber ?? state.clientState?.facilityPhoneNumber,
        chvUserID: this.chvUserID ?? state.clientState?.chvUserID,
        chvUserName: this.chvUserName ?? state.clientState?.chvUserName,
        cccNumber: this.cccNumber ?? state.clientState?.cccNumber,
        addresses: this.addresses ?? state.clientState?.addresses,
        caregiverInformation: this.caregiverInformation ??
            state.clientState?.caregiverInformation,
        notifications: this.notifications ?? state.clientState?.notifications,
        hasCareGiverInfo:
            this.hasCaregiverInfo ?? state.clientState?.hasCareGiverInfo,
      ),
    );

    return newState;
  }
}

class UpdateClientStateAction extends ReduxAction<AppState> {
  UpdateClientStateAction({this.clientState});

  final ClientState? clientState;

  @override
  AppState reduce() {
    final AppState newState =
        state.copyWith(clientState: clientState ?? state.clientState);

    return newState;
  }
}
