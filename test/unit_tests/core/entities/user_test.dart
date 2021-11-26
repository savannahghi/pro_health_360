// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/contact.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import '../../../mocks.dart';

void main() {
  test('User fromJson', () {
    expect(
      User.fromJson(mockUser),
      isA<User>(),
    );
  });

  test('User toJson', () {
    final User user = User(
      userId: 'some-user-id',
      username: 'Kowalski',
      active: true,
      displayName: 'Kowalski',
      firstName: 'Juha',
      gender: Gender.male,
      languages: <String>['en', 'sw'],
      suspended: false,
      avatar: 'https://i.postimg.cc/9XpbrC25/profile-image.png',
      primaryContact: Contact(
        active: true,
        value: '+254717356476',
        contactType: ContactType.PHONE,
        optedIn: true,
      ),
      secondaryContacts: <Contact>[
        Contact(
          active: true,
          value: '+254717356476',
          contactType: ContactType.PHONE,
          optedIn: true,
        ),
      ],
      lastName: 'Kalulu',
      pinChangeRequired: false,
      termsAccepted: true,
      dateOfBirth: '21 Nov 2002',
    );

    expect(
      user.toJson(),
      isA<Map<String, dynamic>>(),
    );
  });

  test('User initial is set', () {
    final User initialUser = User.initial();

    expect(
      initialUser.secondaryContacts!.length,
      0,
    );
  });
}
