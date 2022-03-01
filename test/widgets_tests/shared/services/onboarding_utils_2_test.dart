// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:myafyahub/application/core/services/datatime_parser.dart';
import './onboarding_utils_2_test.mocks.dart';

@GenerateMocks(<Type>[DateTimeParser])
void main() {
  group('OnboardingUtils 2', () {
    MockDateTimeParser? dateTimeParser;

    setUp(() async {
      dateTimeParser = MockDateTimeParser();

      when(dateTimeParser!.parsedExpireAt(int.parse('3600')))
          .thenReturn('2021-05-11T21:34:25.150');
    });
  });
}
