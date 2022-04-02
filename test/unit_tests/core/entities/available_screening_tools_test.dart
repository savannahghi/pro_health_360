import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/core/available_screening_tools.dart';

void main() {
  test('from json', () {
    expect(
      AvailableScreeningTools.fromJson(
        <String, dynamic>{
          'availableScreeningTools': <dynamic>[
            <String, dynamic>{
              'title': 'some title',
              'description': 'some description',
            },
          ],
        },
      ),
      isA<AvailableScreeningTools>(),
    );
  });
}
