// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/behavior_objects.dart';
import 'package:myafyahub/domain/core/entities/core/event_obj.dart';
import 'package:myafyahub/domain/core/entities/login/onboarding_behavior_subject.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';

void main() {
  group('StartVisitIdentificationOTP', () {
    test('should return singleton ', () {
      final StartVisitIdentificationOTP obj1 = StartVisitIdentificationOTP();
      final StartVisitIdentificationOTP obj2 = StartVisitIdentificationOTP();

      expect(obj1, equals(obj2));
      expect(
          obj1.codeHasTakenLong.valueOrNull, obj2.codeHasTakenLong.valueOrNull);

      obj1.codeHasTakenLong.add(true);

      expect(obj1.codeHasTakenLong.valueOrNull, true);

      expect(
          obj1.codeHasTakenLong.valueOrNull, obj2.codeHasTakenLong.valueOrNull);
    });
  });

  group('SessionUserType', () {
    test('should return singleton ', () {
      final SessionUserType obj1 = SessionUserType();
      final SessionUserType obj2 = SessionUserType();

      expect(obj1, equals(obj2));
    });
  });

  group('EventObject', () {
    test('should return json from EventObject instance', () {
      final EventObject obj = EventObject(
        firstName: 'firstName',
        lastName: 'lastName',
        uid: 'uid',
        primaryPhoneNumber: 'primaryPhoneNumber',
        appVersion: APPVERSION,
      );

      final EventObject obj2 = EventObject.fromJson(<String, dynamic>{
        'first_name': 'firstName',
        'last_name': 'lastName',
        'uid': 'uid',
        'primary_phonenumber': 'primaryPhoneNumber',
      });

      expect(obj.firstName, isNotNull);
      expect(obj.firstName, 'firstName');

      expect(obj2.firstName, isNotNull);
      expect(obj2.firstName, 'firstName');

      expect(obj, equals(obj2));
    });
  });
}
