// Package imports:
import 'package:flutter_test/flutter_test.dart';

Future<void> fireEvent(WidgetTester tester) async {
  await tester.pump(Duration.zero);
}

const String testPhoneNumber = '0710000000';
const String testOTP = '123456';
const String testPin = '1234';
