// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/application/redux/states/connectivity_state.dart';

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

  test('should convert initial to json', () {
    final ConnectivityState state = ConnectivityState.initial();
    final Map<String, dynamic> result = state.toJson();
    expect(result, isA<Map<String, dynamic>>());
    expect(result['isConnected'], false);
  });
}
