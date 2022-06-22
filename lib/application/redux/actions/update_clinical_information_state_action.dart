import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/client_state.dart';

class UpdateClinicInformationStateAction extends ReduxAction<AppState> {
  final String? facilityName;
  final String? phoneNumber;

  UpdateClinicInformationStateAction({this.facilityName, this.phoneNumber});
  @override
  Future<AppState?> reduce() async {
    final ClientState? newState = state.clientState?.copyWith(
      facilityName: facilityName ?? state.clientState?.facilityName,
      facilityPhoneNumber:
          phoneNumber ?? state.clientState?.facilityPhoneNumber,
    );
    return state.copyWith(clientState: newState);
  }
}
