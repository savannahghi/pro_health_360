import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/redux/actions/communities/update_group_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/groups_state.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class FetchChannelMembersAction extends ReduxAction<AppState> {
  FetchChannelMembersAction({
    required this.httpClient,
    required this.channelId,
    this.onError,
  });

  final IGraphQlClient httpClient;
  final String channelId;
  final void Function(String?)? onError;

  @override
  void before() {
    super.before();
    dispatch(UpdateGroupStateAction(groupMembers: <GroupMember>[]));
    dispatch(WaitAction<AppState>.add(fetchMembersFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchMembersFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Response response = await httpClient.query(
      listCommunityMembersQuery,
      <String, dynamic>{'communityID': channelId},
    );
    httpClient.close();

    final Map<String, dynamic> payLoad = httpClient.toMap(response);

    final String? error = parseError(payLoad);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      if (error != null) {
        onError?.call(error);
        dispatch(
          UpdateGroupStateAction(groupMembers: <GroupMember>[]),
        );

        Sentry.captureException(UserException(error));
        throw UserException(getErrorMessage());
      }

      final GroupState groupState = GroupState.fromJson(
        payLoad['data'] as Map<String, dynamic>,
      );

      final List<GroupMember?>? groupMembers = groupState.groupMembers;

      final GroupState? newGroupState =
          state.miscState?.groupState?.copyWith(groupMembers: groupMembers);

      final AppState newState = state.copyWith(
        miscState: state.miscState?.copyWith(groupState: newGroupState),
      );

      return newState;
    } else {
      Sentry.captureException(UserException(processedResponse.message));
      throw UserException(getErrorMessage());
    }
  }

  @override
  Object? wrapError(dynamic error) {
    if (error.runtimeType == UserException) {
      return error;
    }

    Sentry.captureException(error);
    return UserException(getErrorMessage());
  }
}
