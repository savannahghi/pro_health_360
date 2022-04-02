import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/core/health_timeline_state.dart';
import 'package:myafyahub/domain/core/entities/health_timeline/fhir_resource.dart';

void main() {
  group('HealthTimelineState', () {
    test('from json should deserialize correctly', () {
      final Map<String, dynamic> medicalResource = <String, dynamic>{
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

      final HealthTimelineState state =
          HealthTimelineState.fromJson(<String, dynamic>{
        'healthTimelineItems': <String, dynamic>{
          '30/0302022': <dynamic>[medicalResource],
        }
      });

      expect(state.healthTimelineItems.length, 1);
      expect(
        state.healthTimelineItems['30/0302022']!.first,
        isInstanceOf<AllergyIntolerance>(),
      );
    });
  });
}
