// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';

class RecentContentViewModel extends Vm {
  RecentContentViewModel({
    this.wait,
    this.errorFetchingContent,
    this.timeoutFetchingContent,
    this.contentItems,
  }) : super(
          equals: <Object?>[
            wait,
            errorFetchingContent,
            timeoutFetchingContent,
            contentItems,
          ],
        );

  factory RecentContentViewModel.fromStore(AppState state) {
    return RecentContentViewModel(
      wait: state.wait,
      errorFetchingContent:
          state.contentState!.recentContentState!.errorFetchingContent,
      timeoutFetchingContent:
          state.contentState!.recentContentState!.timeoutFetchingContent,
      contentItems: state.contentState!.recentContentState!.contentItems,
    );
  }

  final bool? errorFetchingContent;
  final bool? timeoutFetchingContent;
  final List<Content?>? contentItems;
  final Wait? wait;
}
