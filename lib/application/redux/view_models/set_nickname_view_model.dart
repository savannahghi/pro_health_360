// Package imports:
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/feed_content_state.dart';

class SetNicknameViewModel extends Vm {
  SetNicknameViewModel({
    this.wait,
    this.username,
    this.feedContentState,
  }) : super(
          equals: <Object?>[
            wait,
            username,
            feedContentState,
          ],
        );

  factory SetNicknameViewModel.fromStore(AppState state) {
    return SetNicknameViewModel(
      wait: state.wait,
      username: state.clientState?.user?.username,
      feedContentState: state.contentState?.feedContentState,
    );
  }

  final FeedContentState? feedContentState;
  final String? username;
  final Wait? wait;
}
