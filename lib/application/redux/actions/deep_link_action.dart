// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:pro_health_360/application/core/services/onboarding_utils.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/onboarding_path_info.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class DeepLinkAction extends ReduxAction<AppState> {
  @override
  AppState? reduce() {
    late OnboardingPathInfo navConfig;

    if (state.clientState?.user == null) {
      navConfig = OnboardingPathInfo(
        nextRoute: AppRoutes.phoneLogin,
        previousRoute: '',
      );
    }

    final DateTime now = DateTime.now();
    final String? tokenExpiryTimestamp =
        state.credentials?.tokenExpiryTimestamp;

    if (tokenExpiryTimestamp == null ||
        tokenExpiryTimestamp.isEmpty ||
        tokenExpiryTimestamp == UNKNOWN) {
      navConfig = OnboardingPathInfo(
        nextRoute: AppRoutes.phoneLogin,
        previousRoute: '',
      );
    } else {
      final DateTime expiresAt = DateTime.parse(tokenExpiryTimestamp);

      if (hasTokenExpired(expiresAt, now)) {
        navConfig = OnboardingPathInfo(
          nextRoute: AppRoutes.phoneLogin,
          previousRoute: '',
        );
      } else {
        navConfig = onboardingPath(appState: state);
      }
    }

    dispatch(
      NavigateAction<AppState>.pushNamed(
        navConfig.nextRoute,
        arguments: navConfig.arguments,
      ),
    );

    return null;
  }
}
