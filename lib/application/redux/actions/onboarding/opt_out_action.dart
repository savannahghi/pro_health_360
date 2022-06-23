import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:pro_health_360/application/core/graphql/mutations.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';

class OptOutAction extends ReduxAction<AppState> {
  OptOutAction({
    required this.client,
    required this.onSuccess,
    required this.onError,
  });

  final IGraphQlClient client;
  final VoidCallback onSuccess;
  final VoidCallback onError;

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(optOutFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(optOutFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final String phoneNumber =
        state.clientState?.user?.primaryContact?.value ?? '';

    final Map<String, dynamic> variables = <String, dynamic>{
      'phoneNumber': phoneNumber,
      'flavour': Flavour.consumer.name,
    };

    final Response response = await client.query(
      optOutMutation,
      variables,
    );
    client.close();

    final Map<String, dynamic> payLoad = client.toMap(response);
    final String? errors = client.parseError(payLoad);
    if (errors != null) {
      onError.call();
      return null;
    }
    final bool? optOutStatus = payLoad['data']['optOut'] as bool?;

    if (optOutStatus ?? false) {
      onSuccess.call();
    } else {
      onError.call();

      return null;
    }
  }
}
