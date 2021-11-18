// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/misc_state.dart';

void main() {
  test('should convert from/to json', () {
    final MiscState state = MiscState.initial();
    final Map<String, dynamic> result = state.toJson();
    expect(result, isA<Map<String, dynamic>>());
    expect(result['phoneLogin'], isNotNull);

    final MiscState result2 = MiscState.fromJson(<String, dynamic>{
      'libraryListItems': <String>['test']
    });

    expect(result2.healthPagePINInputTime, isNull);
    expect(result2.libraryListItems, isA<List<dynamic>>());
  });
}
