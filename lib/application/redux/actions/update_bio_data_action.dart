// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/failures.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/bottom_nav_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/home/bottom_nav_items.dart';
import 'package:myafyahub/domain/core/entities/login/basic_details_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class UpdateBioDataAction extends ReduxAction<AppState> {
  UpdateBioDataAction({
    required this.flag,
    required this.context,
    required this.userBasicDetails,
  });

  final BuildContext context;
  final String flag;
  final UserBasicDetails userBasicDetails;

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
    // call register device token here but don't wait for it
    registerDeviceToken(client: AppWrapperBase.of(context)!.graphQLClient);
    final Map<String, dynamic> userProfileVariables =
        userBasicDetails.getUserProfileVariables();

    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final http.Response result = await _client.query(updateUserProfileMutation,
        updateUserProfileMutationVariables(userProfileVariables));
    final Map<String, dynamic> body = _client.toMap(result);

    if (_client.parseError(body) != null) {
      throw SILException(
          error: body, cause: 'sign_in_error', message: 'update error');
    }

    if (body['data'] == null) {
      throw SILException(
          error: body,
          cause: 'update_bio_data_error',
          message: 'no data error');
    }

    await store.dispatch(
      UpdateUserProfileAction(
        userBioData: BioData(
            firstName: Name.withValue(
              userProfileVariables['firstName'].toString(),
            ),
            lastName: Name.withValue(
              userProfileVariables['lastName'].toString(),
            ),
            dateOfBirth: userProfileVariables['dateOfBirth'].toString(),
            gender:
                genderFromString(userProfileVariables['gender'].toString())),
      ),
    );

    final Map<String, dynamic> routeContext = onboardingPath(store.state);
    if (routeContext['route'] == BWRoutes.home) {
      // set the home as the current bottom nav index
      await store.dispatch(
          BottomNavAction(currentBottomNavIndex: BottomNavIndex.home.index));
    }
    Navigator.pushReplacementNamed(context, routeContext['route'].toString(),
        arguments: routeContext['args']);

    return state;
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == SILException && error.error != null) {
      reportErrorToSentry(context, error.error, hint: errorUpdatingBioData);
    }
    return actionWrapError(error: error, context: context);
  }
}
