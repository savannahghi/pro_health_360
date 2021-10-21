// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_pin_status_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/behavior_objects.dart';
import 'package:myafyahub/domain/core/entities/core/dynamic_back_route_holder.dart';
import 'package:myafyahub/domain/core/entities/core/onboarding_path_config.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class ResumeWithPinAction extends ReduxAction<AppState> {
  ResumeWithPinAction({
    required this.context,
    required this.flag,
    this.controller,
  });

  final BuildContext context;
  final String flag;
  final TextEditingController? controller;

  @override
  void after() {
    toggleLoadingIndicator(context: context, flag: flag, show: false);
    super.after();
  }

  @override
  void before() {
    toggleLoadingIndicator(context: context, flag: flag);
  }

  @override
  Future<AppState> reduce() async {
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final String? pin = state.miscState!.userPin!.pin;
    final bool isUserChangingPin = state.miscState!.userPin!.isChangingPin;

    // check if the PIN is null or unknown
    if (pin == null || pin == UNKNOWN) {
      return throw SILException(
        cause: 'empty_pin',
        message: 'Please provide a PIN',
      );
    } else {
      final http.Response result = await _client.query(
        resumeWithPinQuery,
        resumeWithPinQueryVariables(pin),
      );

      final Map<String, dynamic> body = _client.toMap(result);

      // check for errors in the response
      if (_client.parseError(body) != null) {
        final String error = _client.parseError(body)!;
        if (error.contains('wrong PIN credentials supplied')) {
          store.dispatch(
            UpdatePinStatusAction(invalidPin: true, controller: controller),
          );
          return throw SILException(
            error: error,
            cause: 'resume_with_pin_error',
            message: wrongPIN,
          );
        }
        return throw SILException(
          error: error,
          cause: 'resume_with_pin_error',
          message: errMsg,
        );
      }

      if (body['data'] != null) {
        if (body['data']['resumeWithPIN'] == true) {
          if (isUserChangingPin == true) {
            DynamicBackRouteHolder().createPINPage.add(BWRoutes.userProfile);
            Navigator.pushReplacementNamed(
              context,
              BWRoutes.createPin,
              arguments: <String, bool>{
                'changingPin': true,
              },
            );
          } else {
            final DeepLinkSubject deepLink = DeepLinkSubject();
            if (deepLink.hasLink.value) {
              deepLink.hasLink.add(false);
              Navigator.pushReplacementNamed(context, deepLink.link.value);
            } else {
              final OnboardingPathConfig routeContext = onboardingPath(state);
              Navigator.pushReplacementNamed(
                context,
                routeContext.route,
                arguments: routeContext.arguments,
              );
            }
          }
        } else {
          store.dispatch(
            UpdatePinStatusAction(invalidPin: true, controller: controller),
          );
          showFeedbackBottomSheet(
            context: context,
            modalContent: wrongPIN,
            imageAssetPath: errorIconUrl,
          );
          return state;
        }
      } else {
        return throw SILException(
          error: body,
          cause: 'empty_body_when_changing_pin',
          message: errMsg,
        );
      }
    }

    return state;
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == SILException && error.error != null) {
      reportErrorToSentry(context, error.error, hint: errorResumingWithPIN);
    }
    return actionWrapError(error: error, context: context);
  }
}
