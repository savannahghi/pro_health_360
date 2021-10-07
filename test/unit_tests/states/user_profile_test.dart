// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/user_profile_state.dart';

void main() {
  test('should convert to and from json', () {
    final UserProfileState state = UserProfileState.initial();
    final Map<String, dynamic> result = state.toJson();
    expect(result, isA<Map<String, dynamic>>());
    expect(result['userProfile'], isNotNull);
    expect(result['auth'], isNotNull);
    expect(result['communicationSettings'], isNotNull);

    final UserProfileState result2 =
        UserProfileState.fromJson(<String, dynamic>{
      'userProfile': <String, dynamic>{
        'id': 'ff83b587-d78a-498f-b0df-4d8cc9d4eb04',
        'primaryEmailAddress': null,
        'primaryPhone': '+254718376163',
        'pushTokens': <String>[
          'cYk02pveSheo5QiEvmoyZ6:APA91bFdBqBJSbhbaTlG5Nylpz9LiMpzFbLLKvfOi6JuwfGt_vRHlLTC8UV9NczbqcV5YR4MTh4Awok8ssKRRpGOQDJK2yeVhaZjCBRHGmR8_AqBdUNBOJXFnGvdiPwWh1vjFt-FkcIe'
        ],
        'secondaryEmailAddresses': null,
        'secondaryPhoneNumbers': <String>['+254712654897', '+254723369852'],
        'suspended': false,
        'terms_accepted': true,
        'userBioData': <String, dynamic>{
          'dateOfBirth': '1996-02-07',
          'firstName': 'Dex',
          'gender': 'unknown',
          'lastName': 'ter'
        },
        'userName': '@suspicious_ishizaka8254254',
        'verifiedIdentifiers': <Map<String, dynamic>>[
          <String, dynamic>{
            'loginProvider': 'PHONE',
            'timeStamp': '2021-02-19T10:04:39.795501Z',
            'uid': 'tGeoFDacVxOaXNoBZhqqhbXINZr1'
          }
        ],
        'verifiedUIDS': <String>['tGeoFDacVxOaXNoBZhqqhbXINZr1']
      }
    });

    expect(result2, isA<UserProfileState>());
    expect(result2.userProfile, isNotNull);
    expect(result2.auth, isNull);
  });
}
