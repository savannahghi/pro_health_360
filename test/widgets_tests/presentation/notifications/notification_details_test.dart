// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/presentation/notifications/notification_details.dart';
import '../../../mocks.dart';

void main() {
  group('NotificationDetails', () {
    test('expects to convert NotificationDetails from json', () {
      final List<NotificationDetails> mockNotificationDetails =
          <NotificationDetails>[];

      for (final Map<String, dynamic> item in mockNotification) {
        mockNotificationDetails.add(NotificationDetails.fromJson(item));
      }

      expect(mockNotificationDetails, isA<List<NotificationDetails>>());
      expect(mockNotificationDetails.first, isA<NotificationDetails>());
    });
  });
}
