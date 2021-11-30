// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/client_state.dart';

class ClientProfileViewModel extends Vm {
  final ClientState? clientState;

  ClientProfileViewModel({required this.clientState})
      : super(equals: <Object?>[clientState]);

  static ClientProfileViewModel fromStore(Store<AppState> store) {
    return ClientProfileViewModel(clientState: store.state.clientState);
  }
}
