// Package imports:
import 'package:rxdart/rxdart.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/enums.dart';

class SessionUserType {
  static final SessionUserType _SessionUserType = SessionUserType._internal();

  factory SessionUserType() {
    return _SessionUserType;
  }

  SessionUserType._internal();

  BehaviorSubject<UserType> userType = BehaviorSubject<UserType>();
}
