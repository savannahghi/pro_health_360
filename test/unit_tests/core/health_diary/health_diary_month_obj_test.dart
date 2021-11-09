// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/health_diary/health_diary_month_obj.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import '../../../mocks.dart';

void main() {
  final Map<String, dynamic> data = mockDiaryMonthItems.first.toJson();
  test('HealthDiaryMonthObj toJson', () {
    expect(
      HealthDiaryMonthObj(
        diaryItems: mockDiaryMonthItems.first.diaryItems,
        month: mockDiaryMonthItems.first.month,
        year: mockDiaryMonthItems.first.year,
      ).toJson(),
      data,
    );
  });

  test('HealthDiaryMonthObj fromJson', () {
    final Map<String, dynamic> _data = <String, dynamic>{
      'diaryItems': <dynamic>[
        <String, dynamic>{
          'date': 'Tuesday 13th',
          'detailsList': <dynamic>[
            <String, dynamic>{
              'svgIconPath': sadMoodIconSvgPath,
              'time': '8:00 am',
              'description': 'Description of how you are feeling today',
              'title': 'Sad'
            }
          ]
        }
      ],
      'year': '2021',
      'month': 'August',
    };
    final HealthDiaryMonthObj obj = HealthDiaryMonthObj.fromJson(_data);
    expect(
      obj,
      isA<HealthDiaryMonthObj>(),
    );
  });
}
