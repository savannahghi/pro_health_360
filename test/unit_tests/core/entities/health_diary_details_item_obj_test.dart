import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/core/health_diary_details_item_obj.dart';

import '../../../mocks.dart';

void main() {
  final Map<String, dynamic> data = <String, dynamic>{
    'description': mockDiaryItems.first.detailsList.first.description,
    'svgIconPath': mockDiaryItems.first.detailsList.first.svgIconPath,
    'time': mockDiaryItems.first.detailsList.first.time,
    'title': mockDiaryItems.first.detailsList.first.title
  };
  test('HealthDiaryItemObj toJson', () {
    expect(
      HealthDiaryDetailsItemObj(
              description: mockDiaryItems.first.detailsList.first.description,
              svgIconPath: mockDiaryItems.first.detailsList.first.svgIconPath,
              time: mockDiaryItems.first.detailsList.first.time,
              title: mockDiaryItems.first.detailsList.first.title)
          .toJson(),
      data,
    );
  });

  test('HealthDiaryItemObj fromJson', () {
    expect(
      HealthDiaryDetailsItemObj.fromJson(data),
      isA<HealthDiaryDetailsItemObj>(),
    );
  });
}
