// Package imports:
import 'package:rxdart/subjects.dart';

class AuthCriteriaObject {
  factory AuthCriteriaObject() {
    return _singleton;
  }

  static final AuthCriteriaObject _singleton = AuthCriteriaObject._internal();

  AuthCriteriaObject._internal();

  BehaviorSubject<bool> isCardChecked = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> isFingerPrintChecked =
      BehaviorSubject<bool>.seeded(false);

  BehaviorSubject<bool> isGuardianChecked = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> isOtpChecked = BehaviorSubject<bool>.seeded(false);
}
