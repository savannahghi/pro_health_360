// Package imports:
import 'package:rxdart/rxdart.dart';

class UserEmailBehaviorObject {
  static final UserEmailBehaviorObject _singleton =
      UserEmailBehaviorObject._internal();

  factory UserEmailBehaviorObject() {
    return _singleton;
  }

  UserEmailBehaviorObject._internal();

  BehaviorSubject<bool> loading = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> allowedComm = BehaviorSubject<bool>.seeded(false);
}
