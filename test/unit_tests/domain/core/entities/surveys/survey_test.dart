import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/domain/core/entities/surveys/survey.dart';

void main() {
  test('initial Survey works correctly', () {
    final Survey survey = Survey.initial();
    expect(survey.title, UNKNOWN);
    expect(survey.description, UNKNOWN);
    expect(survey.link, UNKNOWN);
  });
}
