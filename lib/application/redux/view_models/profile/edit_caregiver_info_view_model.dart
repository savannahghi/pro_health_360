import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/caregiver_information.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

class CaregiverInfoViewModel extends Vm {
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final CaregiverType? caregiverType;

  CaregiverInfoViewModel(
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.caregiverType,
  ) : super(equals: <Object?>[firstName, lastName, phoneNumber, caregiverType]);

  factory CaregiverInfoViewModel.fromState(AppState state) {
    final CaregiverInformation? infoState =
        state.miscState?.caregiverInformation;

    return CaregiverInfoViewModel(
      infoState?.firstName,
      infoState?.lastName,
      infoState?.phoneNumber,
      infoState?.caregiverType,
    );
  }
}
