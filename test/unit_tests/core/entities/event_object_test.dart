// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/core/event_obj.dart';

import '../../../mocks.dart';

void main() {
  test('EventObject fromJson', () {
    expect(
      EventObject.fromJson(mockEventObject),
      isA<EventObject>(),
    );
  });
}
