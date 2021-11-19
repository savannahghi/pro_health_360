import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/redux/states/client_state.dart';

void main() {
  group('ClientState', () {
    test('should convert to and from JSON', () {
      final ClientState clientState = ClientState.initial();

      final Map<String, dynamic> clientStateJson = clientState.toJson();

      expect(clientStateJson.containsKey('clientProfile'), true);

      final Map<String, dynamic> clientProfile = <String, dynamic>{
        'clientProfile': <String, dynamic>{
          'user': <String, dynamic>{'userId': 'some-user-id'},
          'clientCounselled': true,
        }
      };

      expect(
        ClientState.fromJson(clientProfile).clientProfile?.clientCounselled,
        isNotNull,
      );

      expect(
        ClientState.fromJson(clientProfile).clientProfile?.clientCounselled,
        true,
      );
    });
  });
}
