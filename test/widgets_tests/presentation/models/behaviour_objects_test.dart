// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_ui_components/buttons.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/behavior_objects.dart';
import 'package:myafyahub/domain/core/entities/core/endpoint_context_subject.dart';
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';

void main() {
  group('should test behavior subjects', () {
    testWidgets('should show dependants list', (WidgetTester tester) async {
      final EndPointsContextSubject endPointsContextSubject =
          EndPointsContextSubject();
      endPointsContextSubject.contexts.add(testAppContexts);
      final UtilizationBehaviorSubject utilizationBehaviorSubject =
          UtilizationBehaviorSubject();
      utilizationBehaviorSubject.preauthorizations.add(<dynamic>[]);
      final UserEmailBehaviorObject userEmailBehaviorObject =
          UserEmailBehaviorObject();
      userEmailBehaviorObject.allowedComm.add(true);
      final EditProfilePageBehaviorObject editProfilePageBehaviorObject =
          EditProfilePageBehaviorObject();
      editProfilePageBehaviorObject.loading.add(true);
      final RequestPinResetBehaviorObject requestPinResetBehaviorObject =
          RequestPinResetBehaviorObject();
      requestPinResetBehaviorObject.userHasNoAccount.add(true);
      final ManageDependantsBehaviorObject manageDependantsBehaviorObject =
          ManageDependantsBehaviorObject();
      manageDependantsBehaviorObject.dependantMemberNumber.add('78482');
      final CardIndexBehaviorObject cardIndexBehaviorObject =
          CardIndexBehaviorObject();
      cardIndexBehaviorObject.dependantsIndex.add(1);
      final BookAppointmentSubject bookAppointmentSubject =
          BookAppointmentSubject();
      bookAppointmentSubject.benefitType.add('OUTPATIENT');
      final AuthorizationQueryDetailsBehaviorObject
          authorizationQueryDetailsBehaviorObject =
          AuthorizationQueryDetailsBehaviorObject();
      authorizationQueryDetailsBehaviorObject
          .authorizationQueryDetailsBehaviorObject
          .add('someAuthQuery');
      final UserPhoneBehaviorObject userPhoneBehaviorObject =
          UserPhoneBehaviorObject();
      userPhoneBehaviorObject.allowedComm.add(true);
      expect(endPointsContextSubject.contexts.valueOrNull, testAppContexts);
      expect(userEmailBehaviorObject.allowedComm.valueOrNull, true);
      expect(bookAppointmentSubject.benefitType.valueOrNull, 'OUTPATIENT');
      expect(editProfilePageBehaviorObject.loading.valueOrNull, true);
      expect(requestPinResetBehaviorObject.userHasNoAccount.valueOrNull, true);
      expect(cardIndexBehaviorObject.dependantsIndex.valueOrNull, 1);
      expect(
        manageDependantsBehaviorObject.dependantMemberNumber.valueOrNull,
        '78482',
      );
      expect(
        authorizationQueryDetailsBehaviorObject
            .authorizationQueryDetailsBehaviorObject.valueOrNull,
        'someAuthQuery',
      );
      expect(userPhoneBehaviorObject.allowedComm.valueOrNull, true);
      expect(requestPinResetBehaviorObject.userHasNoAccount.valueOrNull, true);
    });

    testWidgets('should clear bookAppointmentSubject fields',
        (WidgetTester tester) async {
      final BookAppointmentSubject bookAppointmentSubject =
          BookAppointmentSubject();
      await tester.pumpWidget(
        MaterialApp(
          home: SILPrimaryButton(
            onPressed: () {
              bookAppointmentSubject.clearSubject();
            },
          ),
        ),
      );
      final Finder silPrimaryButton = find.byType(SILPrimaryButton);
      await tester.tap(silPrimaryButton);
      await tester.pumpAndSettle();
      expect(bookAppointmentSubject.benefitType.valueOrNull, '');
      expect(bookAppointmentSubject.doctorBranchID.valueOrNull, null);
    });
    testWidgets('should check cache UtilizationBehaviorSubject fields',
        (WidgetTester tester) async {
      final UtilizationBehaviorSubject utilizationBehaviorSubject =
          UtilizationBehaviorSubject();
      utilizationBehaviorSubject.cache.add(true);
      await tester.pumpWidget(
        MaterialApp(
          home: SILPrimaryButton(
            onPressed: () {
              utilizationBehaviorSubject.hasCache();
              utilizationBehaviorSubject.clearCache();
            },
          ),
        ),
      );
      final Finder silPrimaryButton = find.byType(SILPrimaryButton);
      await tester.tap(silPrimaryButton);
      await tester.pumpAndSettle();
      expect(utilizationBehaviorSubject.cache.valueOrNull, null);
    });
  });
}
