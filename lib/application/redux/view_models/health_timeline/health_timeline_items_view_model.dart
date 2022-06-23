import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/health_timeline/fhir_resource.dart';

class HealthTimelineItemsViewModel extends Vm {
  final Wait wait;
  final Map<String, List<FhirResource>>? healthTimelineItems;

  HealthTimelineItemsViewModel({
    required this.wait,
    this.healthTimelineItems,
  }) : super(equals: <Object?>[wait, healthTimelineItems]);

  factory HealthTimelineItemsViewModel.fromStore(Store<AppState> store) {
    return HealthTimelineItemsViewModel(
      wait: store.state.wait!,
      healthTimelineItems:
          store.state.clientState?.healthTimelineState?.healthTimelineItems,
    );
  }
}
