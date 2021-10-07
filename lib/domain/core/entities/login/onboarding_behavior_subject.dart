// Package imports:
import 'package:rxdart/rxdart.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/enums.dart';

class OnboardingAppBarValuesSubject {
  static final OnboardingAppBarValuesSubject _singleton =
      OnboardingAppBarValuesSubject._internal();

  factory OnboardingAppBarValuesSubject() {
    return _singleton;
  }

  OnboardingAppBarValuesSubject._internal();

  /// title
  BehaviorSubject<String> title =
      BehaviorSubject<String>.seeded('Provide a title here');

  /// description
  BehaviorSubject<String> description =
      BehaviorSubject<String>.seeded('Supply a nice title description here');
}

class SessionUserType {
  static final SessionUserType _SessionUserType = SessionUserType._internal();

  factory SessionUserType() {
    return _SessionUserType;
  }

  SessionUserType._internal();

  BehaviorSubject<UserType> userType = BehaviorSubject<UserType>();
}
