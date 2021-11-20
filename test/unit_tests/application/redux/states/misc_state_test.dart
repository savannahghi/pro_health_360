// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/misc_state.dart';

void main() {
  group('MiscState', () {
    test('should convert to and from JSON', () {
      final MiscState clientState = MiscState.initial();

      final Map<String, dynamic> clientStateJson = clientState.toJson();

      expect(clientStateJson.containsKey('healthPagePINInputTime'), true);

      final Map<String, dynamic> miscState = <String, dynamic>{
        'healthPagePINInputTime': '21 May 2021',
      };

      expect(
        MiscState.fromJson(miscState).healthPagePINInputTime,
        '21 May 2021',
      );
    });
  });
}
