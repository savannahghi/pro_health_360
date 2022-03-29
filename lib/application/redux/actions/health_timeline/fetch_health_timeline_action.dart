import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/health_timeline_state.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/fhir_resource.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/health_timeline_response.dart';

class FetchHealthTimelineAction extends ReduxAction<AppState> {
  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(fetchHealthTimelineFlag));
  }

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchHealthTimelineFlag));
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    // TODO: Make API request once backend is ready

    final HealthTimelineResponse healthTimelineResponse =
        HealthTimelineResponse.fromJson(healthTimelineItems);

    final Map<String, List<FhirResource>> items =
        <String, List<FhirResource>>{};

    final List<FhirResource> responseItems =
        healthTimelineResponse.healthTimelineItems;

    for (int i = 0; i < responseItems.length; i++) {
      final FhirResource responseItem = responseItems[i];
      if (responseItem.timelineDate != null) {
        if (items.containsKey(responseItem.timelineDate)) {
          items[responseItem.timelineDate]!.add(responseItem);
        } else {
          items[responseItem.timelineDate!] = <FhirResource>[responseItem];
        }
      }
    }

    final HealthTimelineState newState =
        HealthTimelineState(healthTimelineItems: items);

    final AppState appState = state.copyWith(
      clientState: state.clientState?.copyWith(healthTimelineState: newState),
    );

    return appState;
  }
}
