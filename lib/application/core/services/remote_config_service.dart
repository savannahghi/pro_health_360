// Package imports:
import 'package:firebase_remote_config/firebase_remote_config.dart';

const String showCircleResponseBubbles = 'show_circle_response_bubbles';

class RemoteConfigService {
  RemoteConfigService({required RemoteConfig remoteConfig})
      : _remoteConfig = remoteConfig;

  static RemoteConfigService? _instance;

  final Map<String, dynamic> _defaultParameters = <String, dynamic>{
    showCircleResponseBubbles: false,
  };

  final RemoteConfig _remoteConfig;

  static Future<RemoteConfigService> getInstance() async {
    _instance ??= RemoteConfigService(
      remoteConfig: RemoteConfig.instance,
    );

    return _instance!;
  }

  /// determines whether circular bubbles should be shown
  bool get showCircleBubbles =>
      _remoteConfig.getBool(showCircleResponseBubbles);

  Future<void> init() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );

    _remoteConfig.setDefaults(
      _defaultParameters,
    );

    await _remoteConfig.fetchAndActivate();
  }
}
