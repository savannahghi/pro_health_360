import 'package:freezed_annotation/freezed_annotation.dart';

part 'communities_state.freezed.dart';
part 'communities_state.g.dart';

@freezed
class CommunitiesState with _$CommunitiesState {
  factory CommunitiesState() = _CommunitiesState;

  factory CommunitiesState.fromJson(Map<String, dynamic> json) =>
      _$CommunitiesStateFromJson(json);

  factory CommunitiesState.initial() => CommunitiesState(

      ///   - RecentContentState
      ///   - SuggestedGroupsState
      );
}
