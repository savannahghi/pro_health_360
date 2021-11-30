// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart' as http;
import 'package:misc_utilities/misc.dart';
// Project imports:
import 'package:myafyahub/application/core/graphql/mutations.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_home_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/constants.dart';

class CreateHealthDiaryAction extends ReduxAction<AppState> {
  CreateHealthDiaryAction({
    required this.context,
    required this.note,
    required this.mood,
  });

  final BuildContext context;
  final String note;
  final String mood;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(createHealthDiaryFlag));
    super.after();
  }

  @override
  void before() {
    dispatch(WaitAction<AppState>.add(createHealthDiaryFlag));
    super.before();
  }

  @override
  Future<AppState> reduce() async {
    final String? userID = state.clientState!.id;

    final Map<String, dynamic> _variables = <String, dynamic>{
      'clientID': userID!,
      'note': note,
      'mood': mood,
      'reportToStaff': false
    };

    final IGraphQlClient _client = AppWrapperBase.of(context)!.graphQLClient;

    final http.Response result = await _client.query(
      createHealthDiaryEntryMutation,
      _variables,
    );

    final Map<String, dynamic> body = _client.toMap(result);
    final String? error = parseError(body);

    if (error != null) {
      reportErrorToSentry(
        context,
        error,
        hint: errorCreatingHealthDiaryEntryString,
      );

      throw SILException(
        cause: errorCreatingHealthDiaryEntryString,
        message: somethingWentWrongText,
      );
    }

    final Map<String, dynamic> responseMap =
        json.decode(result.body) as Map<String, dynamic>;

    if (responseMap['data']['createHealthDiaryEntry'] != null &&
        responseMap['data']['createHealthDiaryEntry'] == true) {
      dispatch(
        UpdateHomeStateAction(
          createHealthDiaryEntry: true,
        ),
      );
      Navigator.of(context).pop();
    }

    return state;
  }

  @override
  Object wrapError(dynamic error) async {
    if (error.runtimeType == SILException) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(error.message.toString()),
            duration: const Duration(seconds: kShortSnackBarDuration),
            action: dismissSnackBar(
              closeString,
              white,
              context,
            ),
          ),
        );
      return error;
    }
    return error;
  }
}
