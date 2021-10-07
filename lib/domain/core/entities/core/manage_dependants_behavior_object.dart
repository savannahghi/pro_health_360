// Package imports:
import 'package:rxdart/rxdart.dart';

class ManageDependantsBehaviorObject {
  static final ManageDependantsBehaviorObject _singleton =
      ManageDependantsBehaviorObject._internal();

  factory ManageDependantsBehaviorObject() {
    return _singleton;
  }

  ManageDependantsBehaviorObject._internal();

  BehaviorSubject<dynamic> dependantMemberNumber = BehaviorSubject<dynamic>();
  BehaviorSubject<dynamic> dependantPayerSladeCode = BehaviorSubject<dynamic>();
}
