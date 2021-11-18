// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/client_profile.dart';

class ClientProfileViewModel extends Vm {
  final ClientProfile? clientProfile;

  ClientProfileViewModel({required this.clientProfile})
      : super(equals: <Object?>[clientProfile]);

  static ClientProfileViewModel fromStore(Store<AppState> store) {
    return ClientProfileViewModel(
      clientProfile: store.state.clientState?.clientProfile,
    );
  }
}
