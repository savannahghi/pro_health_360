// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class DeepLinkAction extends ReduxAction<AppState> {
  @override
  AppState? reduce() {
    OnboardingPathConfig path;

    if (state.clientState?.user == null) {
      path = OnboardingPathConfig(route: AppRoutes.phoneLogin);
    }

    final DateTime now = DateTime.now();
    final String? tokenExpiryTimestamp =
        state.credentials?.tokenExpiryTimestamp;

    if (tokenExpiryTimestamp == null ||
        tokenExpiryTimestamp.isEmpty ||
        tokenExpiryTimestamp == UNKNOWN) {
      path = OnboardingPathConfig(route: AppRoutes.phoneLogin);
    } else {
      final DateTime expiresAt = DateTime.parse(tokenExpiryTimestamp);

      if (hasTokenExpired(expiresAt, now)) {
        path = OnboardingPathConfig(route: AppRoutes.phoneLogin);
      } else {
        path = onboardingPath(appState: state);
      }
    }

    dispatch(
      NavigateAction<AppState>.pushNamed(
        path.route,
        arguments: path.arguments,
      ),
    );

    return null;
  }
}
