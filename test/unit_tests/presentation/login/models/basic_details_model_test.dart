// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/login/basic_details_model.dart';
import '../../../../mocks.dart';

void main() {
  group('Basic details model tests', () {
    test('should test clearUserDetails routine works', () {
      final UserBasicDetails userBasicDetails = UserBasicDetails();
      userBasicDetails.firstName.add(Name.withValue(testFirstName));
      userBasicDetails.lastName.add(Name.withValue(testLastName));
      userBasicDetails.gender.add(Gender.male);
      userBasicDetails.dateOfBirth.add(testDOB);
      userBasicDetails.clearUserDetails();
      expect(userBasicDetails.firstName.valueOrNull!.getValue(), UNKNOWN);
      expect(userBasicDetails.lastName.valueOrNull!.getValue(), UNKNOWN);
      expect(userBasicDetails.gender.valueOrNull, Gender.unknown);
      expect(userBasicDetails.dateOfBirth.valueOrNull, '');
    });

    test('should test formatDateOfBirth routine works', () {
      final UserBasicDetails userBasicDetails = UserBasicDetails();
      userBasicDetails.firstName.add(Name.withValue(testFirstName));
      userBasicDetails.lastName.add(Name.withValue(testLastName));
      userBasicDetails.gender.add(Gender.male);
      userBasicDetails.dateOfBirth.add(testDOB);
      const String expectedDOB = testFormattedDate;
      final String actualDOB = userBasicDetails.formatDateOfBirth(testDate);
      expect(actualDOB, expectedDOB);
    });
    test('should test setUserProfileVariables routine works', () {
      final UserBasicDetails userBasicDetails = UserBasicDetails();
      userBasicDetails.setUserProfileVariables(
        testFirstName,
        BasicDetailType.firstName,
      );
      expect(userBasicDetails.firstName.valueOrNull!.getValue(), testFirstName);
      userBasicDetails.setUserProfileVariables(
        '1996-12-12',
        BasicDetailType.dateOfBirth,
      );
      expect(userBasicDetails.dateOfBirth.valueOrNull, '1996-12-12');
    });

    test('should test saveUserDetailsToState works', () {
      final Store<AppState> store =
          Store<AppState>(initialState: AppState.initial());
      final UserBasicDetails userBasicDetails = UserBasicDetails();
      userBasicDetails.firstName.add(Name.withValue(testFirstName));
      userBasicDetails.lastName.add(Name.withValue(testLastName));
      userBasicDetails.gender.add(Gender.male);
      userBasicDetails.dateOfBirth.add(testDOB);
      userBasicDetails.clearUserDetails();
      expect(userBasicDetails.firstName.valueOrNull!.getValue(), UNKNOWN);
      expect(userBasicDetails.lastName.valueOrNull!.getValue(), UNKNOWN);
      expect(userBasicDetails.gender.valueOrNull, Gender.unknown);
      expect(userBasicDetails.dateOfBirth.valueOrNull, '');
      userBasicDetails.saveUserDetailsToState(store);
      expect(
        store.state.userProfileState!.userProfile!.userBioData!.firstName!
            .getValue(),
        UNKNOWN,
      );
    });
  });
}
