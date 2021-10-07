// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';

class ContactViewModel extends Vm {
  ContactViewModel({
    required this.primaryEmail,
    required this.primaryPhone,
    required this.secondaryEmails,
    required this.secondaryPhones,
    required this.wait,
  });

  final EmailAddress? primaryEmail;
  final PhoneNumber primaryPhone;
  final List<EmailAddress>? secondaryEmails;
  final List<PhoneNumber>? secondaryPhones;
  final Wait wait;

  static ContactViewModel fromStore(Store<AppState> store) {
    final UserProfile profile = store.state.userProfileState!.userProfile!;
    return ContactViewModel(
      primaryEmail: profile.primaryEmailAddress,
      primaryPhone: profile.primaryPhoneNumber!,
      secondaryEmails: profile.secondaryEmailAddresses,
      secondaryPhones: profile.secondaryPhoneNumbers,
      wait: store.state.wait!,
    );
  }
}
