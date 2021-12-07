// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';

class SavedContentViewModel extends Vm {
  SavedContentViewModel({
    this.wait,
    this.errorFetchingContent,
    this.timeoutFetchingContent,
    this.savedItems,
  }) : super(
          equals: <Object?>[
            wait,
            errorFetchingContent,
            timeoutFetchingContent,
            savedItems,
          ],
        );

  factory SavedContentViewModel.fromStore(AppState state) {
    return SavedContentViewModel(
      wait: state.wait,
      errorFetchingContent: state.contentState!.savedContentState!.errorFetchingContent,
      timeoutFetchingContent: state.contentState!.savedContentState!.timeoutFetchingContent,
      savedItems: state.contentState!.savedContentState!.savedContentItems,
    );
  }

  final bool? errorFetchingContent;
  final bool? timeoutFetchingContent;
  final List<Content?>? savedItems;
  final Wait? wait;
}
