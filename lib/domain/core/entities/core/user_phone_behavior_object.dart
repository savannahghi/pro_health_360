// Package imports:
import 'package:rxdart/rxdart.dart';

class UserPhoneBehaviorObject {
  factory UserPhoneBehaviorObject() {
    return _singleton;
  }

  UserPhoneBehaviorObject._internal();

  BehaviorSubject<bool> allowedComm = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> loading = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<String> phoneNumber = BehaviorSubject<String>();

  static final UserPhoneBehaviorObject _singleton =
      UserPhoneBehaviorObject._internal();
}
