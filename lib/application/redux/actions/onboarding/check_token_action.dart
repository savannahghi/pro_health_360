// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:myafyahub/application/core/services/custom_client.dart';
import 'package:myafyahub/application/redux/actions/onboarding/update_initial_route_action.dart';
import 'package:myafyahub/application/redux/actions/update_credentials_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';
import 'package:myafyahub/domain/core/entities/home/bottom_nav_items.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class CheckTokenAction extends ReduxAction<AppState> {
  CheckTokenAction({
    required this.httpClient,
    required this.refreshTokenEndpoint,
  });

  final CustomClient httpClient;
  final String refreshTokenEndpoint;

  @override
  Future<AppState?> reduce() async {
    final bool isSignedIn = state.credentials?.isSignedIn ?? false;

    String initialRoute = AppRoutes.phoneLogin;
    final int currentIndex =
        state.bottomNavigationState?.currentBottomNavIndex ?? 0;

    if (isSignedIn) {
      final DateTime now = DateTime.now();

      final DateTime expiresAt = DateTime.parse(
        state.credentials?.tokenExpiryTimestamp ?? now.toIso8601String(),
      );

      if (hasTokenExpired(expiresAt, now)) {
        AuthCredentials? authCredentials = await httpClient.refreshToken();

        if (authCredentials?.idToken != null &&
            authCredentials?.expiresIn != null &&
            authCredentials?.refreshToken != null) {
          final DateTime expiryTimestamp =
              getTokenExpiryTimestamp(authCredentials?.expiresIn);

          authCredentials = authCredentials?.copyWith(
            tokenExpiryTimestamp: expiryTimestamp.toIso8601String(),
          );

          dispatch(
            UpdateCredentialsAction(
              idToken: authCredentials?.idToken,
              refreshToken: authCredentials?.refreshToken,
              expiresIn: authCredentials?.expiresIn,
              tokenExpiryTimestamp: authCredentials?.tokenExpiryTimestamp,
            ),
          );

          initialRoute = bottomNavItems[currentIndex].onTapRoute;
        } else {
          initialRoute = AppRoutes.phoneLogin;
        }
      } else {
        initialRoute = bottomNavItems[currentIndex].onTapRoute;
      }
    }

    dispatch(UpdateInitialRouteAction(initialRoute: initialRoute));
  }
}
