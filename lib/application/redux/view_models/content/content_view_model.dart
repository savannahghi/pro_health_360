import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';

class ContentViewModel extends Vm {
  ContentViewModel({
    this.wait,
    this.errorFetchingContent,
    this.timeoutFetchingContent,
    this.feedItems,
  }) : super(
          equals: <Object?>[
            wait,
            errorFetchingContent,
            timeoutFetchingContent,
            feedItems,
          ],
        );

  factory ContentViewModel.fromStore(AppState state) {
    return ContentViewModel(
      wait: state.wait,
      errorFetchingContent: state.contentState!.errorFetchingContent,
      timeoutFetchingContent: state.contentState!.timeoutFetchingContent,
      feedItems: state.contentState!.contentItems,
    );
  }

  final bool? errorFetchingContent;
  final bool? timeoutFetchingContent;
  final List<Content?>? feedItems;
  final Wait? wait;
}
