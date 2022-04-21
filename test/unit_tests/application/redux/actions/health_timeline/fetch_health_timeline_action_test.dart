import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myafyahub/application/redux/actions/health_timeline/fetch_health_timeline_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/fhir_resource.dart';

import '../../../../../mocks.dart';
import 'fetch_health_timeline_action_test.mocks.dart';

@GenerateMocks(<Type>[IGraphQlClient])
void main() {
  group('FetchHealthTimeline', () {
    late StoreTester<AppState> storeTester;

    setUp(() {
      storeTester = StoreTester<AppState>(
        initialState: AppState.initial(),
        testInfoPrinter: (TestInfo<dynamic> testInfo) {},
      );
    });

    test('update state correctly', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'data': mockHealthTimelineItems}),
          200,
        ),
      );

      storeTester.dispatch(FetchHealthTimelineAction(httpClient: client));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchHealthTimelineAction);

      final Map<String, List<FhirResource>>? items =
          info.state.clientState?.healthTimelineState?.healthTimelineItems;

      expect(items?.isNotEmpty, true);
      expect(items?.length, 4);
    });

    test('throws error if response contains error', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'error': 'some error'}),
          200,
        ),
      );

      storeTester.dispatch(FetchHealthTimelineAction(httpClient: client));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchHealthTimelineAction);

      final Map<String, List<FhirResource>>? items =
          info.state.clientState?.healthTimelineState?.healthTimelineItems;

      expect(items?.isNotEmpty, false);
      expect(info.errors.removeLast(), UserException(getErrorMessage()));
    });

    test('throws error if http call was not successful', () async {
      final MockShortGraphQlClient client = MockShortGraphQlClient.withResponse(
        '',
        '',
        Response(
          jsonEncode(<String, dynamic>{'error': 'some error'}),
          400,
        ),
      );

      storeTester.dispatch(FetchHealthTimelineAction(httpClient: client));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchHealthTimelineAction);

      final Map<String, List<FhirResource>>? items =
          info.state.clientState?.healthTimelineState?.healthTimelineItems;

      expect(items?.isNotEmpty, false);
      expect(info.errors.removeLast(), UserException(getErrorMessage()));
    });

    test('throws catch unhandled error', () async {
      final MockIGraphQlClient client = MockIGraphQlClient();

      when(
        client.query(any, any),
      ).thenThrow(MyAfyaException(cause: 'cause', message: 'message'));

      storeTester.dispatch(FetchHealthTimelineAction(httpClient: client));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchHealthTimelineAction);

      final Map<String, List<FhirResource>>? items =
          info.state.clientState?.healthTimelineState?.healthTimelineItems;

      expect(items?.isNotEmpty, false);
      expect(info.errors.removeLast(), UserException(getErrorMessage()));
    });
  });
}
