import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/core/services/analytics_service.dart';
import 'package:pro_health_360/application/core/services/onboarding_utils.dart';
import 'package:pro_health_360/application/redux/actions/update_misc_state_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/onboarding_path_info.dart';
import 'package:pro_health_360/domain/core/value_objects/app_events.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/enums.dart';
import 'package:pro_health_360/presentation/router/routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ResumeWithPinAction extends ReduxAction<AppState> {
  ResumeWithPinAction({
    required this.httpClient,
    required this.endpoint,
    required this.pin,
    this.wrongPinCallback,
  });

  final String endpoint;
  final IGraphQlClient httpClient;
  final String pin;
  final VoidCallback? wrongPinCallback;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(resumeWithPinFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(resumeWithPinFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final String? userID = state.clientState?.user?.userId;

    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': userID,
      'flavour': Flavour.consumer.name,
      'pin': pin,
    };

    final Response result = await httpClient.query(verifyPinQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(result);
    httpClient.close();

    if (processedResponse.ok) {
      final Map<String, dynamic> body =
          httpClient.toMap(processedResponse.response);

      final String? error = httpClient.parseError(body);

      if (error != null) {
        if (error.contains('8')) {
          wrongPinCallback?.call();
          final int resumeWithPInRetries =
              state.miscState?.resumeWithPINRetries ?? 0;
          if (resumeWithPInRetries < 3) {
            dispatch(
              UpdateMiscStateAction(
                resumeWithPINRetries: resumeWithPInRetries + 1,
              ),
            );
            throw const UserException(wrongPINText);
          } else {
            await dispatch(
              NavigateAction<AppState>.pushNamed(
                AppRoutes.wrongResumeWithPINPage,
              ),
            );
            dispatch(UpdateMiscStateAction(resumeWithPINRetries: 0));
            return state;
          }
        }

        Sentry.captureException(error, hint: 'Error while verifying user PIN');
        throw UserException(getErrorMessage());
      }

      if (body['data']['verifyPIN'] != null) {
        final bool pinVerified = body['data']['verifyPIN'] as bool;
        if (pinVerified) {
          final OnboardingPathInfo path = onboardingPath(appState: state);

          await AnalyticsService().logEvent(
            name: resumeWithPINEvent,
            eventType: AnalyticsEventType.AUTH,
          );

          dispatch(
            NavigateAction<AppState>.pushReplacementNamed(path.nextRoute),
          );
        }
      }
    } else {
      Sentry.captureException(
        processedResponse.message,
        hint: 'Error while verifying user PIN',
      );
      throw UserException(getErrorMessage());
    }

    return null;
  }

  @override
  Object? wrapError(dynamic error) {
    if (error.runtimeType == UserException) {
      return error;
    }

    Sentry.captureException(error);
    return UserException(getErrorMessage());
  }
}
