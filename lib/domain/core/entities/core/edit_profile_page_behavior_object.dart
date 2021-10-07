// Package imports:
import 'package:rxdart/rxdart.dart';

class EditProfilePageBehaviorObject {
  factory EditProfilePageBehaviorObject() {
    return _singleton;
  }

  EditProfilePageBehaviorObject._internal();

  BehaviorSubject<bool> loading = BehaviorSubject<bool>.seeded(false);

  static final EditProfilePageBehaviorObject _singleton =
      EditProfilePageBehaviorObject._internal();
}
