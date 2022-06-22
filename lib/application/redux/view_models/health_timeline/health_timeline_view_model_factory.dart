import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:pro_health_360/application/redux/actions/health_timeline/fetch_health_timeline_action.dart';
import 'package:pro_health_360/application/redux/actions/health_timeline/update_health_timeline_action.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/health_timeline/health_timeline_offset_view_model.dart';
import 'package:pro_health_360/presentation/profile/health_timeline/my_health_timeline_container.dart';

class HealthTimelineViewModelFactory
    extends VmFactory<AppState, MyHealthTimelineContainer> {
  final IGraphQlClient client;

  HealthTimelineViewModelFactory({required this.client});

  @override
  HealthTimelineOffsetViewModel fromStore() {
    return HealthTimelineOffsetViewModel(
      wait: state.wait!,
      offset: state.clientState?.healthTimelineState?.offset,
      count: state.clientState?.healthTimelineState?.count ?? 0,
      updateOffset: updateOffset,
      fetchMore: fetchMore,
    );
  }

  void updateOffset(int offset) {
    dispatch(UpdateHealthTimelineAction(offset: offset));
  }

  void fetchMore() {
    dispatch(
      FetchHealthTimelineAction(httpClient: client),
    );
  }
}
