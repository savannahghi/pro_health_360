// Package imports:
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';

class UpdateNickNameAction extends ReduxAction<MainAppState> {
  UpdateNickNameAction({this.nickName});

  final String? nickName;

  @override
  MainAppState reduce() {
    final User? newUserState =
        state.clientState?.clientProfile?.user?.copyWith(username: nickName);

    final MainAppState newState =
        state.copyWith.clientState!.clientProfile!.call(user: newUserState);

    return newState;
  }
}
