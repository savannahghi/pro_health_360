// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import '../../../mocks.dart';

void main() {
  group('NotificationDetails', () {
    test('expects to convert NotificationDetails from json', () {
      final NotificationDetails mockNotificationDetails =
          NotificationDetails.fromJson(mockNotification);
      expect(mockNotificationDetails, isA<NotificationDetails>());
    });
  });
}
