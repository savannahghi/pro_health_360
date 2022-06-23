import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/domain/core/entities/health_timeline/fhir_resource.dart';

void main() {
  group('FhirResource', () {
    test('from json should deserialize allergy intolerance correctly', () {
      final Map<String, dynamic> medicationResource = <String, dynamic>{
        'category': <String>['medication'],
        'clinicalStatus': <String, dynamic>{
          'coding': <Map<String, dynamic>>[
            <String, dynamic>{
              'code': '165586',
              'display': "Milk powder (cow's milk)",
              'system': '/orgs/CIEL/sources/CIEL/concepts/165586/'
            }
          ],
          'text': "Milk powder (cow's milk)"
        },
        'code': <String, dynamic>{},
        'id': '35fe4b5e-1f26-4d65-89bf-bdc22a4ac9c5',
        'patient': <String, dynamic>{
          'display': '8371c56f-2cc3-4ea9-9db7-2befef290f9c',
          'reference': 'Patient/8371c56f-2cc3-4ea9-9db7-2befef290f9c'
        },
        'reaction': <Map<String, dynamic>>[
          <String, dynamic>{
            'description': "Milk powder (cow's milk)",
            'manifestation': <Map<String, dynamic>>[
              <String, dynamic>{
                'coding': <Map<String, dynamic>>[
                  <String, dynamic>{
                    'code': '512',
                    'display': 'Rash',
                    'system': '/orgs/CIEL/sources/CIEL/concepts/165586/'
                  }
                ],
                'text': 'Rash'
              }
            ],
            'severity': 'severe',
            'substance': <String, dynamic>{
              'coding': <Map<String, dynamic>>[
                <String, dynamic>{
                  'code': '165586',
                  'display': "Milk powder (cow's milk)",
                  'system': '/orgs/CIEL/sources/CIEL/concepts/165586/'
                }
              ],
              'text': "Milk powder (cow's milk)"
            }
          }
        ],
        'recordedDate': '2022-03-04',
        'resourceType': 'AllergyIntolerance',
        'timelineDate': '2022-03-04',
        'type': 'allergy',
        'verificationStatus': <String, dynamic>{}
      };

      final FhirResource resource = FhirResource.fromJson(medicationResource);

      expect(resource, isInstanceOf<AllergyIntolerance>());
    });

    test('from json should deserialize observation correctly', () {
      final Map<String, dynamic> observationResource = <String, dynamic>{
        'category': <Map<String, dynamic>>[
          <String, dynamic>{
            'coding': <Map<String, dynamic>>[
              <String, dynamic>{
                'code': 'vital-signs',
                'display': 'Vital Signs',
                'system':
                    'http://terminology.hl7.org/CodeSystem/observation-category'
              }
            ],
            'text': 'Vital Signs'
          }
        ],
        'code': <String, dynamic>{
          'coding': <Map<String, dynamic>>[
            <String, dynamic>{
              'code': '5088',
              'display': 'Temperature (c)',
              'system': '/orgs/CIEL/sources/CIEL/concepts/5088/'
            }
          ],
          'text': 'Temperature (c)'
        },
        'effectiveDateTime': '2022-05-04',
        'id': '9ce7577a-4975-4e45-b48f-67cea229be45',
        'resourceType': 'Observation',
        'status': 'preliminary',
        'subject': <String, dynamic>{
          'display': '8371c56f-2cc3-4ea9-9db7-2befef290f9c',
          'reference': 'Patient/8371c56f-2cc3-4ea9-9db7-2befef290f9c'
        },
        'timelineDate': '2022-05-04',
        'valueString': '36.5'
      };

      final FhirResource resource = FhirResource.fromJson(observationResource);

      expect(resource, isInstanceOf<Observation>());
    });

    test('from json should deserialize medication statement correctly', () {
      final Map<String, dynamic> medicationStatement = <String, dynamic>{
        'category': <String, dynamic>{
          'coding': <Map<String, dynamic>>[
            <String, dynamic>{
              'code': '114100',
              'display': 'Pneumonia',
              'system': '/orgs/CIEL/sources/CIEL/concepts/114100/'
            }
          ],
          'text': 'Pneumonia'
        },
        'effectiveDateTime': '2022-03-04',
        'id': 'ab7313bb-3688-4f67-87db-e98bb69d0263',
        'medicationCodeableConcept': <String, dynamic>{
          'coding': <Map<String, dynamic>>[
            <String, dynamic>{
              'code': '71160',
              'display': 'Amoxicillin',
              'system': '/orgs/CIEL/sources/CIEL/concepts/71160/'
            }
          ],
          'text': 'Amoxicillin'
        },
        'resourceType': 'MedicationStatement',
        'status': 'unknown',
        'subject': <String, dynamic>{
          'display': '340611da-fcd0-4fc2-bb29-ef6ba3bbcb0b',
          'reference': 'Patient/340611da-fcd0-4fc2-bb29-ef6ba3bbcb0b'
        },
        'timelineDate': '2022-03-04'
      };

      final FhirResource resource = FhirResource.fromJson(medicationStatement);

      expect(resource, isInstanceOf<MedicationStatement>());
    });
  });
}
