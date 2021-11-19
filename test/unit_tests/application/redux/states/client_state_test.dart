import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/core/client_state.dart';

void main() {
  group('ClientState', () {
    test('should convert to and from JSON', () {
      final ClientState clientState = ClientState.initial();

      final Map<String, dynamic> clientStateJson = clientState.toJson();

      expect(clientStateJson.containsKey('clientCounselled'), true);

      final Map<String, dynamic> clientStateMap = <String, dynamic>{
        'user': <String, dynamic>{'userId': 'some-user-id'},
        'clientCounselled': true,
      };

      expect(
        ClientState.fromJson(clientStateMap).clientCounselled,
        isNotNull,
      );

      expect(
        ClientState.fromJson(clientStateMap).clientCounselled,
        true,
      );
    });
  });
}
