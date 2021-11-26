import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:misc_utilities/refresh_token_manager.dart';
import 'package:myafyahub/application/core/services/datatime_parser.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/actions/manage_token_action.dart';
import 'package:myafyahub/application/redux/actions/onboarding/update_initial_route_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/auth_credentials.dart';
import 'package:myafyahub/domain/core/entities/core/onboarding_path_config.dart';
import 'package:myafyahub/domain/core/entities/login/processed_response.dart';
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

      final DateTimeParser dateTimeParser = DateTimeParser();
      final int expiresIn = int.parse(state.credentials?.expiresIn ?? '0');
      final String stringExpiresAt = dateTimeParser.parsedExpireAt(expiresIn);
      final DateTime expiresAt = DateTime.parse(stringExpiresAt);

      if (hasTokenExpired(expiresAt, now)) {
        // if so, user needs to log in
        dispatch(UpdateInitialRouteAction(initialRoute: BWRoutes.phoneLogin));
        return null;
      } else {
        final Response httpResponse = await requestForANewToken(
          httpClient: httpClient,
          refreshTokenEndpoint: refreshTokenEndpoint,
          refreshToken: state.credentials?.refreshToken ?? UNKNOWN,
        );

        final ProcessedResponse processedResponse =
            processHttpResponse(httpResponse);

        if (processedResponse.ok) {
          final Map<String, dynamic> parsed =
              jsonDecode(processedResponse.response.body)
                  as Map<String, dynamic>;

          final AuthCredentials authCredentials =
              AuthCredentials.fromJson(parsed);

          if (authCredentials.idToken != null &&
              authCredentials.refreshToken != null &&
              authCredentials.expiresIn != null) {
            dispatch(
              ManageTokenAction(
                refreshToken: authCredentials.refreshToken!,
                idToken: authCredentials.idToken!,
                refreshTokenManger: RefreshTokenManger(),
                expiresIn: authCredentials.expiresIn!,
              ),
            );
          } else {
            dispatch(
              UpdateInitialRouteAction(initialRoute: BWRoutes.phoneLogin),
            );
            return null;
          }
        } else {
          dispatch(
            UpdateInitialRouteAction(initialRoute: BWRoutes.phoneLogin),
          );
          return null;
        }
      }

      final OnboardingPathConfig pathConfig = onboardingPath(
        appState: state,
        calledOnResume: true,
      );

      dispatch(UpdateInitialRouteAction(initialRoute: pathConfig.route));

      return null;
    }

    dispatch(UpdateInitialRouteAction(initialRoute: BWRoutes.phoneLogin));
  }
}
