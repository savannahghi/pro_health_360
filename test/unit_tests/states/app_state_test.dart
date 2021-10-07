// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';

void main() {
  test('should convert from/to json', () {
    final AppState state = AppState.initial();
    final Map<String, dynamic> result = state.toJson();
    expect(result, isA<Map<String, dynamic>>());

    final AppState result2 = AppState.fromJson(<String, dynamic>{
      'miscState': <String, dynamic>{
        'libraryListItems': <String>['test']
      }
    });

    expect(result2.userProfileState, isNull);
    expect(result2.miscState, isNotNull);
  });
}
