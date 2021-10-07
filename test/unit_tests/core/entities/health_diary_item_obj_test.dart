// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/health_diary_item_obj.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import '../../../mocks.dart';

void main() {
  final Map<String, dynamic> data = mockDiaryItems.first.toJson();
  test('HealthDiaryItemObj toJson', () {
    expect(
      HealthDiaryItemObj(
        date: mockDiaryItems.first.date,
        detailsList: mockDiaryItems.first.detailsList,
      ).toJson(),
      data,
    );
  });

  test('HealthDiaryItemObj fromJson', () {
    final Map<String, dynamic> _data = <String, dynamic>{
      'date' : '13th January',
      'detailsList': <dynamic>[<String, dynamic>{
        'svgIconPath': sadMoodIconSvgPath,
          'time': '8:00 am',
          'description': 'Description of how you are feeling today',
          'title': 'Sad'
      }]
    };
    final HealthDiaryItemObj obj =
        HealthDiaryItemObj.fromJson(_data);
    expect(
      obj,
      isA<HealthDiaryItemObj>(),
    );
  });
}
