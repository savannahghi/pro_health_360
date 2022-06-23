// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';

import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:shared_themes/constants.dart';

// Project imports:
import 'package:pro_health_360/application/core/graphql/queries.dart';
import 'package:pro_health_360/application/redux/actions/update_terms_and_conditions_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/terms_and_conditions/terms_and_conditions_response.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/exception_tag.dart';

class GetTermsAction extends ReduxAction<AppState> {
  GetTermsAction({
    required this.context,
  });

  final BuildContext context;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(getTermsFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(getTermsFlag));
    super.before();
  }

  @override
  Future<AppState> reduce() async {
    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final http.Response result = await _client.query(
      getTermsQuery,
      <String, dynamic>{'flavour': Flavour.consumer.name},
    );

    final Map<String, dynamic> body = _client.toMap(result);

    _client.close();

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    if (_client.parseError(body) != null || responseMap.isEmpty) {
      throw MyAfyaException(
        cause: getTermsTag,
        message: somethingWentWrongText,
      );
    }

    final TermsAndConditionsResponse termsAndConditionsResponse =
        TermsAndConditionsResponse.fromJson(
      responseMap['data'] as Map<String, dynamic>,
    );

    dispatch(
      UpdateTermsAndConditionsAction(
        id: termsAndConditionsResponse.termsAndConditions.termsId,
        termsString: termsAndConditionsResponse.termsAndConditions.text,
      ),
    );

    return state;
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == MyAfyaException) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(error.message.toString()),
            duration: const Duration(seconds: kShortSnackBarDuration),
          ),
        );
      return error;
    }
    return error;
  }
}
