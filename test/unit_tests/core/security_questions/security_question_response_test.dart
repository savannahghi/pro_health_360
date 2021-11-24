// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/security_questions/responses/security_question_response.dart';

// Project imports:
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
          userID: 'userId',
          securityQuestionID: 'securityQuestionId',
          response: 'response',
        ).toJson(),
        mockSecurityQuestionResponse,
      );
    });
  });
}
