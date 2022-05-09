import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/health_timeline_state.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/fhir_resource.dart';

class UpdateHealthTimelineAction extends ReduxAction<AppState> {
  final int? offset;
  final int? count;
  final Map<String, List<FhirResource>>? healthTimelineItems;

  UpdateHealthTimelineAction({
    this.offset,
    this.healthTimelineItems,
    this.count,
  });

  @override
  AppState reduce() {
    final HealthTimelineState currentState =
        state.clientState!.healthTimelineState!;
    final HealthTimelineState newHealthTimelineState = currentState.copyWith(
      offset: offset ?? currentState.offset,
      count: count ?? currentState.count,
      healthTimelineItems:
          healthTimelineItems ?? currentState.healthTimelineItems,
    );

    final AppState newAppState = state.copyWith.clientState!
        .call(healthTimelineState: newHealthTimelineState);

    return newAppState;
  }
}
