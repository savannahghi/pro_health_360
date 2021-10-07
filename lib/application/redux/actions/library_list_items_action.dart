// Package imports:
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';

class LibraryListItemsAction extends ReduxAction<AppState> {
  LibraryListItemsAction({required this.libraryListItems});

  final List<dynamic>? libraryListItems;

  @override
  AppState reduce() {
    final AppState newState =
        state.copyWith.miscState!.call(libraryListItems: this.libraryListItems);
    return newState;
  }
}
