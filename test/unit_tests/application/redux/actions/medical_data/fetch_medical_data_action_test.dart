import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myafyahub/application/redux/actions/medical_data/fetch_medical_data_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/medical_data/medical_data.dart';

import '../../../../../mocks.dart';
import 'fetch_medical_data_action_test.mocks.dart';

@GenerateMocks(<Type>[IGraphQlClient])
void main() {
  group('FetchMedicalData', () {
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
          jsonEncode(<String, dynamic>{'data': mockMedicalDataResponse}),
          200,
        ),
      );

      storeTester.dispatch(FetchMedicalDataAction(httpClient: client));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchMedicalDataAction);

      final MedicalData? medicalData =
          info.state.clientState?.medicalDataState?.medicalData;

      expect(medicalData?.regimen?.category?.text, 'Pneumonia');
      expect(medicalData?.bmi?[0]?.valueString, 'some-bmi-value');
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

      storeTester.dispatch(FetchMedicalDataAction(httpClient: client));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchMedicalDataAction);

      final MedicalData? medicalData =
          info.state.clientState?.medicalDataState?.medicalData;

      expect(medicalData?.allergies?.valueString, UNKNOWN);
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

      storeTester.dispatch(FetchMedicalDataAction(httpClient: client));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchMedicalDataAction);

      final MedicalData? medicalData =
          info.state.clientState?.medicalDataState?.medicalData;

      expect(medicalData?.allergies?.valueString, UNKNOWN);
      expect(info.errors.removeLast(), UserException(getErrorMessage()));
    });

    test('throws catch unhandled error', () async {
      final MockIGraphQlClient client = MockIGraphQlClient();

      when(
        client.query(any, any),
      ).thenThrow(MyAfyaException(cause: 'cause', message: 'message'));

      storeTester.dispatch(FetchMedicalDataAction(httpClient: client));

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchMedicalDataAction);

      final MedicalData? medicalData =
          info.state.clientState?.medicalDataState?.medicalData;

      expect(medicalData?.allergies?.valueString, UNKNOWN);
      expect(info.errors.removeLast(), UserException(getErrorMessage()));
    });
  });
}
