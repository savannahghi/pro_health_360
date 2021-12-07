// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/entities/feed/content_category.dart';

class FeedContentViewModel extends Vm {
  FeedContentViewModel({
    this.wait,
    this.errorFetchingContent,
    this.timeoutFetchingContent,
    this.feedItems,
    this.selectedCategory,
  }) : super(
          equals: <Object?>[
            wait,
            errorFetchingContent,
            timeoutFetchingContent,
            feedItems,
            selectedCategory
          ],
        );

  factory FeedContentViewModel.fromStore(AppState state) {
    return FeedContentViewModel(
      wait: state.wait,
      errorFetchingContent: state.contentState!.feedContentState!.errorFetchingContent,
      timeoutFetchingContent: state.contentState!.feedContentState!.timeoutFetchingContent,
      feedItems: state.contentState!.feedContentState!.contentItems,
      selectedCategory:
          state.contentState!.feedContentState!.selectedCategory ?? ContentCategory.initial(),
    );
  }

  final bool? errorFetchingContent;
  final bool? timeoutFetchingContent;
  final List<Content?>? feedItems;
  final Wait? wait;
  final ContentCategory? selectedCategory;
}
