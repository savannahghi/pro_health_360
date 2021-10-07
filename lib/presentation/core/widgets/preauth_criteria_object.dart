// Package imports:
import 'package:rxdart/rxdart.dart';

class PreAuthCriteriaObj {
  factory PreAuthCriteriaObj() {
    return _singleton;
  }

  static final PreAuthCriteriaObj _singleton = PreAuthCriteriaObj._internal();

  PreAuthCriteriaObj._internal();

  /// dental
  BehaviorSubject<bool> isDentalChecked = BehaviorSubject<bool>.seeded(false);

  /// inpatient
  BehaviorSubject<bool> isInpatientChecked =
      BehaviorSubject<bool>.seeded(false);

  /// lab
  BehaviorSubject<bool> isLabChecked = BehaviorSubject<bool>.seeded(false);

  /// maternity
  BehaviorSubject<bool> isMaternityChecked =
      BehaviorSubject<bool>.seeded(false);

  /// optical
  BehaviorSubject<bool> isOpticalChecked = BehaviorSubject<bool>.seeded(false);

  /// prescription
  BehaviorSubject<bool> isPrescriptionChecked =
      BehaviorSubject<bool>.seeded(false);

  /// radiology
  BehaviorSubject<bool> isRadiologyChecked =
      BehaviorSubject<bool>.seeded(false);
}
