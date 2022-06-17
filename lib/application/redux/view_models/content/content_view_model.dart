// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/connectivity_state.dart';
import 'package:myafyahub/domain/core/entities/core/feed_content_state.dart';
import 'package:myafyahub/domain/core/entities/core/recent_content_state.dart';
import 'package:myafyahub/domain/core/entities/core/saved_content_state.dart';

class ContentViewModel extends Vm {
  ContentViewModel({
    this.wait,
    this.feedContentState,
    this.recentContentState,
    this.savedContentState,
    this.selectedCategory,
    this.listContentCategory,
    this.connectivityState,
  }) : super(
          equals: <Object?>[
            wait,
            feedContentState,
            savedContentState,
            recentContentState,
            selectedCategory,
            listContentCategory,
            connectivityState,
          ],
        );

  factory ContentViewModel.fromStore(AppState state) {
    return ContentViewModel(
      wait: state.wait,
      feedContentState: state.contentState?.feedContentState,
      savedContentState: state.contentState?.savedContentState,
      recentContentState: state.contentState?.recentContentState,
      selectedCategory: state.contentState?.feedContentState?.selectedCategory,
      listContentCategory: state.contentState?.categoriesList,
      connectivityState: state.connectivityState,
    );
  }

  final FeedContentState? feedContentState;
  final RecentContentState? recentContentState;
  final SavedContentState? savedContentState;
  final ContentCategory? selectedCategory;
  final ListContentCategory? listContentCategory;
  final ConnectivityState? connectivityState;
  final Wait? wait;
}
