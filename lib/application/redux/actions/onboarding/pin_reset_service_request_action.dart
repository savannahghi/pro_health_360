import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class PINResetServiceRequestAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final String pinResetServiceRequestEndpoint;
  final VoidCallback? onError;
  final VoidCallback? onSuccess;
  final String cccNumber;

  PINResetServiceRequestAction({
    required this.client,
    required this.pinResetServiceRequestEndpoint,
    this.onError,
    this.onSuccess,
    required this.cccNumber,
  });
  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(pinResetServiceRequestFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(pinResetServiceRequestFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final String phoneNumber = state.onboardingState?.phoneNumber ?? '';
    final Map<String, dynamic> variables = <String, dynamic>{
      'cccNumber': cccNumber,
      'phoneNumber': phoneNumber,
    };
    final Response response = await client.callRESTAPI(
      endpoint: pinResetServiceRequestEndpoint,
      method: httpPOST,
      variables: variables,
    );
    client.close();

    final Map<String, dynamic> payLoad = client.toMap(response);

    final String? error = parseError(payLoad);

    if (error != null) {
      onError?.call();
      Sentry.captureException(error, hint: 'PIN service request failed');
      return null;
    }
    final bool? status = payLoad['status'] as bool?;
    if (status != null && status) {
      onSuccess?.call();
      dispatch(
        NavigateAction<AppState>.pushNamedAndRemoveUntil(
          AppRoutes.phoneLogin,
          (Route<dynamic> route) => false,
        ),
      );
    }
    return state;
  }
}