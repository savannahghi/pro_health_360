// Package imports:
import 'package:rxdart/rxdart.dart';

class CardIndexBehaviorObject {
  factory CardIndexBehaviorObject() {
    return _singleton;
  }

  CardIndexBehaviorObject._internal();

  BehaviorSubject<int> cardIndexBehaviorObject = BehaviorSubject<int>();
  BehaviorSubject<int> dependantsIndex = BehaviorSubject<int>();

  static final CardIndexBehaviorObject _singleton =
      CardIndexBehaviorObject._internal();
}
