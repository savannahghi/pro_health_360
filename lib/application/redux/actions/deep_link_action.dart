// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';

// Project imports:
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/nav_path_config.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class DeepLinkAction extends ReduxAction<AppState> {
  @override
  AppState? reduce() {
    late AppNavConfig navConfig;

    if (state.clientState?.user == null) {
      navConfig =
          AppNavConfig(nextRoute: AppRoutes.phoneLogin, previousRoute: '');
    }

    final DateTime now = DateTime.now();
    final String? tokenExpiryTimestamp =
        state.credentials?.tokenExpiryTimestamp;

    if (tokenExpiryTimestamp == null ||
        tokenExpiryTimestamp.isEmpty ||
        tokenExpiryTimestamp == UNKNOWN) {
      navConfig =
          AppNavConfig(nextRoute: AppRoutes.phoneLogin, previousRoute: '');
    } else {
      final DateTime expiresAt = DateTime.parse(tokenExpiryTimestamp);

      if (hasTokenExpired(expiresAt, now)) {
        navConfig =
            AppNavConfig(nextRoute: AppRoutes.phoneLogin, previousRoute: '');
      } else {
        navConfig = navPathConfig(appState: state);
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
