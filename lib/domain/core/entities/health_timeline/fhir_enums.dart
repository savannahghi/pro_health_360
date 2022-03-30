import 'package:flutter/foundation.dart';

enum AllergyIntoleranceSeverity { mild, moderate, severe }

enum AllergyIntoleranceCategory { food, medication, environment, biologic }

enum ReferenceType { Observation, AllergyIntolerance, MedicationStatement }

enum AllergyIntoleranceType { allergy, intolerance }

enum ObservationStatus {
  Registered,
  Preliminary,
  Final,
  Amended,
  Corrected,
  Cancelled,
  Entered_in_error,
  Unknown
}

extension ObservationStatusEx on ObservationStatus {
  String get name {
    return describeEnum(this).replaceAll('_', ' ');
  }
}
