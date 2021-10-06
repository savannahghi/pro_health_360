import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/notification/notification_actions.dart';

import '../../../mocks.dart';

void main() {
  group('NotificationAction', () {
    test('expects to convert NotificationAction from json', () {
      final NotificationActions notificationActions =
          NotificationActions.fromJson(mockNotificationActions);
      expect(notificationActions, isA<NotificationActions>());
    });
  });
}
