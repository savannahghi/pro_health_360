import 'dart:async';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/core/graphql/queries.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_clinical_information_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/exception_tag.dart';

class FetchClinicInformationAction extends ReduxAction<AppState> {
  final BuildContext context;

  FetchClinicInformationAction({required this.context});

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchClinicInformationFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(fetchClinicInformationFlag));
    super.before();
  }

  @override
  Future<AppState?> reduce() async {
    final String facilityId = state.clientState!.facilityID!;
    final bool active = state.clientState!.active!;
    final Map<String, dynamic> variables = <String, dynamic>{
      'id': facilityId,
      'active': active,
    };

    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    /// fetch the data from the api
    final Response response = await _client.query(
      retrieveFacilityQuery,
      variables,
    );

    final Map<String, dynamic> responseMap = _client.toMap(response);
    final String? error = parseError(responseMap);

    if (error != null) {
      reportErrorToSentry(
        context,
        error,
        hint: 'Error while fetching clinic information',
      );

      throw SILException(
        cause: clinicInfoTag,
        message: somethingWentWrongText,
      );
    }
    if (responseMap['data']['retrieveFacility']['name'] != null && responseMap['data']['retrieveFacility']['phone'] != null) {
      dispatch(
         UpdateClinicInformationStateAction(
          facilityName: responseMap['data']['retrieveFacility']['name'] as String,
          phoneNumber: responseMap['data']['retrieveFacility']['phone'] as String,
        ),
      );
    }
  }
}
