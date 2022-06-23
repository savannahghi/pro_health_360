import 'package:pro_health_360/domain/core/entities/health_timeline/codeable_concept.dart';
import 'package:pro_health_360/domain/core/entities/health_timeline/fhir_enums.dart';

abstract class Resource {
  Object? get category;
  CodeableConcept? get code;
  ReferenceType? get resourceType;
  String? get timelineDate;
}
