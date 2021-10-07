// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config_platform_interface/firebase_remote_config_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:myafyahub/application/core/services/remote_config_service.dart';
import '../../mock_utils.dart';
import '../../mocks.dart';

void main() {
  late RemoteConfigService service;
  setupFirebaseAuthMocks();
  setUpRemoteConfigStubs();

  setUp(() async {
    await Firebase.initializeApp();

    service = await RemoteConfigService.getInstance();

    await service.init();
  });
  group('RemoteConfigService', () {
    FirebaseRemoteConfigPlatform.instance = mockRemoteConfigPlatform;
    test('should return true value of showCircleBubbles', () async {
      final bool value = service.showCircleBubbles;

      verify(mockRemoteConfigPlatform.getBool(showCircleResponseBubbles));
      expect(value, true);
    });

    test('should return false value of showCircleBubbles', () async {
      when(mockRemoteConfigPlatform.getBool(showCircleResponseBubbles))
          .thenReturn(false);
      final bool value = service.showCircleBubbles;

      verify(mockRemoteConfigPlatform.getBool(showCircleResponseBubbles));
      expect(value, false);
    });
  });
}
