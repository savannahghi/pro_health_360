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

enum ObservationCategoryCodes {
  vital_signs,
  social_history,
  imaging,
  laboratory,
  procedure,
  survey,
  exam,
  therapy,
  activity
}

extension ObservationCategoryCodesEx on ObservationCategoryCodes {
  String get name {
    return describeEnum(this).replaceAll('_', '-');
  }
}

enum MedicationStatusCodes {
  active,
  completed,
  entered_in_error,
  intended,
  stopped,
  on_hold,
  unknown,
  not_taken
}

extension MedicationStatusCodesEx on MedicationStatusCodes {
  String get name {
    return describeEnum(this).replaceAll('_', ' ');
  }
}
