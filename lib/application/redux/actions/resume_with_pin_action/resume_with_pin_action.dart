import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/onboarding_path_info.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ResumeWithPinAction extends ReduxAction<AppState> {
  final IGraphQlClient httpClient;
  final String endpoint;
  final String pin;
  final VoidCallback? wrongPinCallback;

  ResumeWithPinAction({
    required this.httpClient,
    required this.endpoint,
    required this.pin,
    this.wrongPinCallback,
  });

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(resumeWithPinFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(resumeWithPinFlag));
    super.after();
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
          throw const UserException(wrongPINText);
        }

        Sentry.captureException(error, hint: 'Error while verifying user PIN');
        throw UserException(getErrorMessage());
      }

      if (body['data']['verifyPIN'] != null) {
        final bool pinVerified = body['data']['verifyPIN'] as bool;
        if (pinVerified) {
          final OnboardingPathInfo path = onboardingPath(appState: state);

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
