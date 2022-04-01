// Package imports:
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/medical_data/medical_data.dart';

class MedicalDataViewModel extends Vm {
  final Wait? wait;
  final MedicalData? medicalData;

  MedicalDataViewModel({required this.medicalData, required this.wait})
      : super(equals: <Object?>[wait, medicalData]);

  static MedicalDataViewModel fromStore(Store<AppState> store) {
    return MedicalDataViewModel(
      medicalData: store.state.clientState?.medicalDataState?.medicalData,
      wait: store.state.wait,
    );
  }
}
