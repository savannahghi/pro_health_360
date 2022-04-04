import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';

class FetchAvailableScreeningTools extends ReduxAction<AppState> {
  FetchAvailableScreeningTools({
    required this.client,
  });

  final IGraphQlClient client;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchAvailableScreeningToolsFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(fetchAvailableScreeningToolsFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    // todo(byron) implement logic once api is completed
  }
}
