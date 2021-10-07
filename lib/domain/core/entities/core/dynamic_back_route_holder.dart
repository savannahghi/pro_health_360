// Package imports:
import 'package:rxdart/subjects.dart';

// Project imports:
import 'package:myafyahub/presentation/router/routes.dart';

/// holds back routes for certain pages such as [CreatePINPage] that one can
/// get to via different routes and may want to go back
class DynamicBackRouteHolder {
  factory DynamicBackRouteHolder() {
    return _singleton;
  }

  DynamicBackRouteHolder._internal();

  /// holds back route for [CreatePinPage] so that the back button can work as expected
  /// depending on where the user came from
  BehaviorSubject<String> createPINPage =
      BehaviorSubject<String>.seeded(BWRoutes.phoneLogin);

  static final DynamicBackRouteHolder _singleton =
      DynamicBackRouteHolder._internal();
}
