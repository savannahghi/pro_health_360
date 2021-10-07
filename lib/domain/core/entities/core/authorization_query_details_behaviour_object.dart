// Package imports:
import 'package:rxdart/rxdart.dart';

class AuthorizationQueryDetailsBehaviorObject {
  static final AuthorizationQueryDetailsBehaviorObject _singleton =
      AuthorizationQueryDetailsBehaviorObject._internal();

  factory AuthorizationQueryDetailsBehaviorObject() {
    return _singleton;
  }

  AuthorizationQueryDetailsBehaviorObject._internal();

  BehaviorSubject<dynamic> authorizationQueryDetailsBehaviorObject =
      BehaviorSubject<dynamic>();
}
