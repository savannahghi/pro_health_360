// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/security_questions/security_question_response.dart';
import '../../../mocks.dart';

void main() {
  group('SecurityQuestionResponse', () {
    test('expects to convert SecurityQuestionResponse from json', () {
      final SecurityQuestionResponse mockResponse =
          SecurityQuestionResponse.fromJson(mockSecurityQuestionResponse);
      expect(mockResponse, isA<SecurityQuestionResponse>());
    });

    test('SecurityQuestionResponse toJson', () {
      expect(
        SecurityQuestionResponse(
          id: 'id',
          timeStamp: '2021-05-06T05:34:24Z',
          userId: 'userId',
          securityQuestionId: 'securityQuestionId',
          response: 'response',
        ).toJson(),
        mockSecurityQuestionResponse,
      );
    });
  });
}
