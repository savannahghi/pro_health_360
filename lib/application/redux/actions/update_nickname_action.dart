// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/user.dart';

class UpdateNickNameAction extends ReduxAction<AppState> {
  UpdateNickNameAction({this.nickName});

  final String? nickName;

  @override
  AppState reduce() {
    final User? newUserState =
        state.clientState?.user?.copyWith(username: nickName);

    final AppState newState =
        state.copyWith.clientState!.call(user: newUserState);

    return newState;
  }
}
