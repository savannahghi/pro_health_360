// Package imports:
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/client_state.dart';

class ClientProfileViewModel extends Vm {
  final Wait? wait;
  final ClientState? clientState;
  final String? facilityName;

  ClientProfileViewModel({
    required this.wait,
    required this.clientState,
    required this.facilityName,
  }) : super(equals: <Object?>[wait, clientState]);

  static ClientProfileViewModel fromStore(Store<AppState> store) {
    return ClientProfileViewModel(
      clientState: store.state.clientState,
      wait: store.state.wait,
      facilityName: store.state.clientState?.facilityName,
    );
  }
}
