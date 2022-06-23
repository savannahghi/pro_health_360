// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/domain/core/entities/core/related_person.dart';
import '../../../mocks.dart';

void main() {
  test('RelatedPerson fromJson', () {
    expect(
      RelatedPerson.fromJson(mockRelatedPerson),
      isA<RelatedPerson>(),
    );
  });

  test('RelatedPerson initial is set', () {
    final RelatedPerson initialRelatedPerson = RelatedPerson.initial();

    expect(
      initialRelatedPerson.contacts!.length,
      0,
    );
  });
}
