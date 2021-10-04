import 'package:flutter_test/flutter_test.dart';

import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';
import 'package:myafyahub/domain/core/value_objects/events.dart';

void main() {
  test('consumer_success_contact_veri_', () {
    final String appContext = demoAppContexts.first.toString();

    final String result = hasSuccessfullyVerifiedContactEvent(appContext);

    expect(result, equals('consumer_success_contact_veri_$appContext'));
  });

  test('consumer_failed_contact_veri_', () {
    final String appContext = demoAppContexts.first.toString();

    final String result = hasFailedContactVerificationEvent(appContext);

    expect(result, equals('consumer_failed_contact_veri_$appContext'));
  });
}
