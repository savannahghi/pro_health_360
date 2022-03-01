// Flutter imports:
import 'dart:convert';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/profile/clinic_information/clinic_information_item_widget.dart';
import 'package:myafyahub/presentation/profile/clinic_information/clinic_information_page.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('ClinicInformationPage', () {
    late Store<AppState> store;
    final MockShortSILGraphQlClient mockShortSILGraphQlClient =
        MockShortSILGraphQlClient.withResponse(
      'idToken',
      'endpoint',
      Response(
        json.encode(<String, dynamic>{
          'data': <String, dynamic>{
            'retrieveFacility': <String, dynamic>{
              'ID': 'abcd',
              'name': 'Some hospital',
              'code': 12345,
              'county': 'Nairobi',
              'active': true,
              'phone': '+25412345678',
              'description': 'Some Hospital'
            }
          }
        }),
        201,
      ),
    );

    setUpAll(() {
      store = Store<AppState>(
        initialState: AppState.initial()
          ..clientState!.copyWith(facilityID: 'id'),
      );
    });
    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: ClinicInformationPage(),
      );
      expect(find.byType(ClinicInformationItemWidget), findsNWidgets(3));

      await tester.tap(find.byKey(hotlineCallButtonKey));
      expect(find.byType(ClinicInformationPage), findsWidgets);
    });

    testWidgets('shows loading indicator correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockShortSILGraphQlClient,
        widget: ClinicInformationPage(),
      );

      store.dispatch(WaitAction<AppState>.add(fetchClinicInformationFlag));
      await tester.pump();

      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });
  });
}
