// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
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
