// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/entities/feed/content_category.dart';

class ContentViewModel extends Vm {
  ContentViewModel({
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

  factory ContentViewModel.fromStore(AppState state) {
    return ContentViewModel(
      wait: state.wait,
      errorFetchingContent: state.contentState!.errorFetchingContent,
      timeoutFetchingContent: state.contentState!.timeoutFetchingContent,
      feedItems: state.contentState!.contentItems,
      selectedCategory:
          state.contentState!.selectedCategory ?? ContentCategory.initial(),
    );
  }

  final bool? errorFetchingContent;
  final bool? timeoutFetchingContent;
  final List<Content?>? feedItems;
  final Wait? wait;
  final ContentCategory? selectedCategory;
}
