import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/core/screening_question.dart';

void main() {
  test('ScreeningQuestion initial is set', () {
    final ScreeningQuestion initialScreeningQuestion =
        ScreeningQuestion.initial();

    expect(initialScreeningQuestion.id, UNKNOWN);
    expect(initialScreeningQuestion.questionText, UNKNOWN);
  });
}
