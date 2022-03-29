import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/actions/health_timeline/fetch_health_timeline_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/fhir_resource.dart';

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
      storeTester.dispatch(FetchHealthTimelineAction());

      final TestInfo<AppState> info =
          await storeTester.waitUntil(FetchHealthTimelineAction);

      final Map<String, List<FhirResource>>? items =
          info.state.clientState?.healthTimelineState?.healthTimelineItems;

      expect(
        items?.isNotEmpty,
        true,
      );
      expect(items?.length, 3);
    });
  });
}
