import 'package:myafyahub/application/redux/states/connectivity_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should convert to json', () {
    final ConnectivityState state = ConnectivityState(isConnected: true);
    final Map<String, dynamic> result = state.toJson();
    expect(result, isA<Map<String, dynamic>>());
    expect(result['isConnected'], true);
  });

  test('should convert from json', () {
    final Map<String, dynamic> json = <String, dynamic>{'isConnected': false};
    final ConnectivityState state = ConnectivityState.fromJson(json);
    expect(state, isA<ConnectivityState>());
    expect(state.isConnected, false);
  });

  test('should convert intial to json', () {
    final ConnectivityState state = ConnectivityState.initial();
    final Map<String, dynamic> result = state.toJson();
    expect(result, isA<Map<String, dynamic>>());
    expect(result['isConnected'], false);
  });
}
