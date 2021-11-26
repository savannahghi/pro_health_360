import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/onboarding/update_initial_route_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class CheckTokenAction extends ReduxAction<AppState> {
  CheckTokenAction({
    required this.httpClient,
    required this.refreshTokenEndpoint,
  });

  final IGraphQlClient httpClient;
  final String refreshTokenEndpoint;

  @override
  Future<AppState?> reduce() async {
    final bool? isSignedIn = state.credentials?.isSignedIn;

    if (isSignedIn != null && isSignedIn) {
      // check if token has expired
      final DateTime now = DateTime.now();

      final DateTime expiresAt = DateTime.parse(
        state.credentials?.tokenExpiryTimestamp ?? now.toIso8601String(),
      );

      if (hasTokenExpired(expiresAt, now)) {
        dispatch(UpdateInitialRouteAction(initialRoute: BWRoutes.phoneLogin));
        return null;
      } else {
        // TODO: Implement refresh token functionality once endpoint is available
        dispatch(UpdateInitialRouteAction(initialRoute: BWRoutes.home));
        return null;
      }
    }

    dispatch(UpdateInitialRouteAction(initialRoute: BWRoutes.phoneLogin));
  }
}
