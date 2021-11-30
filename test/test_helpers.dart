// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:myafyahub/application/core/services/app_setup_data.dart';
import 'package:myafyahub/application/core/services/localization.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';
import 'package:myafyahub/domain/core/value_objects/app_name_constants.dart';
import 'package:myafyahub/domain/core/value_objects/global_keys.dart';
import 'package:myafyahub/presentation/router/router_generator.dart';
import 'widgets_tests/shared/utils_test.mocks.dart';

final BaseGraphQlClient baseGraphQlClientMock = BaseGraphQlClient();

void queryWhenThenAnswer({
  required String queryString,
  required Map<String, dynamic> variables,
  required http.Response response,
}) {
  when(
    baseGraphQlClientMock.query(
      queryString,
      variables,
    ),
  ).thenAnswer(
    (_) => Future<http.Response>.value(
      response,
    ),
  );
}

void callRESTAPIWhenThenAnswer({
  required String endpoint,
  required Map<String, dynamic> variables,
  required http.Response response,
}) {
  when(
    baseGraphQlClientMock.callRESTAPI(
      endpoint: endpoint,
      variables: variables,
      method: 'POST',
    ),
  ).thenAnswer(
    (_) => Future<http.Response>.value(
      response,
    ),
  );
}

void toMapWhenThenReturn({
  required http.Response argument,
  required Map<String, dynamic> returnVal,
}) {
  when(baseGraphQlClientMock.toMap(argument)).thenReturn(returnVal);
}

Future<void> buildTestWidget({
  required WidgetTester tester,
  required Store<AppState> store,
  required IGraphQlClient client,
  required Widget widget,
  List<NavigatorObserver>? navigatorObservers,
}) async {
  FlutterConfig.loadValueForTesting(<String, String>{
    'DEV_SENTRY_DNS': 'test_dev_sentry_dns',
    'PROD_SENTRY_DNS': 'test_prod_sentry_dns',
  });

  NavigateAction.setNavigatorKey(appGlobalNavigatorKey);

  return tester.pumpWidget(
    StoreProvider<AppState>(
      store: store,
      child: AppWrapper(
        appName: testAppName,
        appContexts: testAppContexts,
        graphQLClient: client,
        baseContext: devAppSetupData.customContext,
        child: MaterialApp(
          localizationsDelegates: localizationDelegates,
          supportedLocales: locales,
          navigatorKey: appGlobalNavigatorKey,
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorObservers: navigatorObservers ?? <NavigatorObserver>[],
          home: Scaffold(
            body: Center(
              child: widget,
            ),
          ),
        ),
      ),
    ),
  );
}
