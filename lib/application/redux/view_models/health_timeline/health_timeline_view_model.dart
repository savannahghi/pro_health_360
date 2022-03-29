import 'package:async_redux/async_redux.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/fhir_resource.dart';

class HealthTimelineViewModel extends Vm {
  final Wait wait;
  final Map<String, List<FhirResource>>? healthTimelineItems;

  HealthTimelineViewModel({
    required this.wait,
    this.healthTimelineItems,
  }) : super(equals: <Object?>[wait, healthTimelineItems]);

  factory HealthTimelineViewModel.fromStore(Store<AppState> store) {
    return HealthTimelineViewModel(
      wait: store.state.wait!,
      healthTimelineItems:
          store.state.clientState?.healthTimelineState?.healthTimelineItems,
    );
  }
}
