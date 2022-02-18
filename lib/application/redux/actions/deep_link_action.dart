// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';

// Project imports:
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/onboarding_path_config.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class DeepLinkAction extends ReduxAction<AppState> {
  @override
  AppState? reduce() {
    OnboardingPathConfig path;

    if (state.clientState?.user == null) {
      path = OnboardingPathConfig(AppRoutes.phoneLogin);
    }

    final DateTime now = DateTime.now();
    final String? tokenExpiryTimestamp =
        state.credentials?.tokenExpiryTimestamp;

    if (tokenExpiryTimestamp == null ||
        tokenExpiryTimestamp.isEmpty ||
        tokenExpiryTimestamp == UNKNOWN) {
      path = OnboardingPathConfig(AppRoutes.phoneLogin);
    } else {
      final DateTime expiresAt = DateTime.parse(tokenExpiryTimestamp);

      if (hasTokenExpired(expiresAt, now)) {
        path = OnboardingPathConfig(AppRoutes.phoneLogin);
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
