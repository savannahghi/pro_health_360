// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';

// Project imports:
import 'package:myafyahub/application/core/services/datatime_parser.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/onboarding_path_config.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class DeepLinkAction extends ReduxAction<AppState> {
  @override
  AppState? reduce() {
    OnboardingPathConfig path;

    if (state.clientState?.user == null) {
      path = OnboardingPathConfig(BWRoutes.phoneLogin);
    }

    final DateTime now = DateTime.now();
    final String? expiresIn = state.credentials?.expiresIn;

    if (expiresIn == null || expiresIn.isEmpty || expiresIn == UNKNOWN) {
      path = OnboardingPathConfig(BWRoutes.phoneLogin);
    } else {
      final DateTimeParser dateTimeParser = DateTimeParser();
      final int expiresInAsInt = int.parse(expiresIn);
      final String tokenExpiryDateString =
          dateTimeParser.parsedExpireAt(expiresInAsInt);

      final DateTime expiresAt = DateTime.parse(tokenExpiryDateString);

      if (hasTokenExpired(expiresAt, now)) {
        path = OnboardingPathConfig(BWRoutes.phoneLogin);
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
