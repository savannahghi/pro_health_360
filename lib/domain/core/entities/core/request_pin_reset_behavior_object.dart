// Package imports:
import 'package:rxdart/rxdart.dart';

class RequestPinResetBehaviorObject {
  static final RequestPinResetBehaviorObject _singleton =
      RequestPinResetBehaviorObject._internal();

  factory RequestPinResetBehaviorObject() {
    return _singleton;
  }

  RequestPinResetBehaviorObject._internal();

  BehaviorSubject<bool> processing = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> userHasNoAccount = BehaviorSubject<bool>.seeded(false);
}
