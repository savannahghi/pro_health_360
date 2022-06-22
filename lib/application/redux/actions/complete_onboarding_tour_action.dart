// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';

import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

// Project imports:
import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';

/// [CompleteOnboardingTourAction] is a Redux Action whose job is to update a users onboarding tour
/// completion status,
///
/// Otherwise delightfully notify user of any Error that might occur during the process

class CompleteOnboardingTourAction extends ReduxAction<AppState> {
  CompleteOnboardingTourAction({
    required this.client,
    this.userID,
  });

  final IGraphQlClient client;
  final String? userID;

  /// [wrapError] used to wrap error thrown during execution of the `reduce()` method
  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(completeOnboarding));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(completeOnboarding));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    // initializing of the CompleteOnboardingTourAction mutation
    final Map<String, String?> variables = <String, String?>{
      'userID': userID,
      'flavour': Flavour.consumer.name,
    };

    final http.Response result = await client.query(
      completeOnboardingTourMutation,
      variables,
    );
    client.close();

    final Map<String, dynamic> body = client.toMap(result);

    final ProcessedResponse processed = processHttpResponse(result);

    if (processed.ok) {
      final String? errors = client.parseError(body);

      if (errors != null) {
        throw const UserException(somethingWentWrongText);
      }

      if (body['data']['completeOnboardingTour'] != true) {
        throw const UserException(onboardingErrorText);
      }
    } else {
      Sentry.captureException(
        processed.message,
        hint: <String, dynamic>{
          'query': completeOnboardingTourMutation,
          'variables': variables,
          'response': result.body,
        },
      );

      throw const UserException(somethingWentWrongText);
    }
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
