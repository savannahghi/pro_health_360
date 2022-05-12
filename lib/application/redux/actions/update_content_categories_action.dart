// Flutter imports:

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/list_content_categories.dart';

class UpdateContentCategoriesAction extends ReduxAction<AppState> {
  UpdateContentCategoriesAction({
    this.errorFetchingContentCategories,
    this.timeoutFetchingContentCategories,
    this.contentCategories,
  });

  final List<ContentCategory?>? contentCategories;
  final bool? errorFetchingContentCategories;
  final bool? timeoutFetchingContentCategories;

  @override
  Future<AppState> reduce() async {
    final ListContentCategory? listContentCategory =
        state.contentState?.categoriesList?.copyWith(
      errorFetchingContentCategories: errorFetchingContentCategories ??
          state.contentState?.categoriesList?.errorFetchingContentCategories,
      timeoutFetchingContentCategories: timeoutFetchingContentCategories ??
          state.contentState?.categoriesList?.timeoutFetchingContentCategories,
      contentCategories: contentCategories ??
          state.contentState?.categoriesList?.contentCategories,
    );
    final AppState newState = state.copyWith(
      contentState: state.contentState?.copyWith(
        categoriesList: listContentCategory,
      ),
    );

    return newState;
  }
}
