// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';

enum BasicDetailType { firstName, lastName, gender, dateOfBirth }

class UserBasicDetails {
  BehaviorSubject<String> dateOfBirth = BehaviorSubject<String>();
  BehaviorSubject<Name> firstName =
      BehaviorSubject<Name>.seeded(Name.withValue(UNKNOWN));

  BehaviorSubject<Gender> gender =
      BehaviorSubject<Gender>.seeded(Gender.unknown);

  BehaviorSubject<Name> lastName =
      BehaviorSubject<Name>.seeded(Name.withValue(UNKNOWN));

  void clearUserDetails() {
    firstName.add(Name.withValue(UNKNOWN));
    lastName.add(Name.withValue(UNKNOWN));
    gender.add(Gender.unknown);
    dateOfBirth.add('');
  }

  List<String> get genderTypes => kGenderTypes;

  Map<String, dynamic> getUserProfileVariables() {
    return <String, dynamic>{
      'firstName': firstName.valueOrNull!.getValue(),
      'lastName': lastName.valueOrNull!.getValue(),
      'dateOfBirth': looseFormatDateOfBirth(dateOfBirth.valueOrNull),

      /// without explicit conversion of [gender] to `string` this exception will be thrown
      /// [ERROR:flutter/lib/ui/ui_dart_state.cc(186)] Unhandled Exception: Converting object to an encodable object failed: Instance of 'Gender'
      /// since [Gender] type has no explicitly conversion function
      'gender': gender.valueOrNull!.name.toLowerCase().toString(),
    };
  }

  void setUserProfileVariables(String value, BasicDetailType type) {
    if (type == BasicDetailType.firstName) firstName.add(Name.withValue(value));
    if (type == BasicDetailType.lastName) lastName.add(Name.withValue(value));
    if (type == BasicDetailType.gender) gender.add(genderFromString(value));
    if (type == BasicDetailType.dateOfBirth) {
      dateOfBirth.add(value);
    }
  }

  String formatDateOfBirth(dynamic dateValue) {
    return DateFormat('yyyy-MM-dd')
        .format(DateTime.parse(dateValue.toString()));
  }

  String looseFormatDateOfBirth(dynamic dateValue) {
    final String date =
        DateFormat.yMMMMd('en_GB').parseLoose(dateValue.toString()).toString();
    return DateFormat('yyyy-MM-dd').format(DateTime.parse(date));
  }

  Future<void> saveUserDetailsToState(Store<AppState> store) async {
    await store.dispatch(
      UpdateUserProfileAction(
        userBioData: BioData(
            dateOfBirth: dateOfBirth.valueOrNull,
            firstName: firstName.valueOrNull,
            lastName: lastName.valueOrNull,
            gender: gender.valueOrNull),
      ),
    );
  }
}
