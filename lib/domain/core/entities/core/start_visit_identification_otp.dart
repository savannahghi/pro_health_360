// Package imports:
import 'package:rxdart/rxdart.dart';

class StartVisitIdentificationOTP {
  factory StartVisitIdentificationOTP() {
    return _singleton;
  }

  StartVisitIdentificationOTP._internal();

  BehaviorSubject<bool> codeHasTakenLong = BehaviorSubject<bool>.seeded(false);

  /// [StartVisitIdentificationOTP]
  BehaviorSubject<String> startVisitIdentificationOTP =
      BehaviorSubject<String>();

  static final StartVisitIdentificationOTP _singleton =
      StartVisitIdentificationOTP._internal();
}
