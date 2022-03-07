import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/communities/group.dart';

class GroupsViewModel extends Vm {
  final Wait wait;
  final List<Group?>? recommendedGroups;

  GroupsViewModel({
    required this.wait,
    this.recommendedGroups,
  }) : super(
          equals: <Object?>[
            wait,
            recommendedGroups,
          ],
        );

  factory GroupsViewModel.fromStore(Store<AppState> store) {
    return GroupsViewModel(
      wait: store.state.wait!,
      recommendedGroups: store.state.miscState?.groupState?.recommendedGroups,
    );
  }
}
