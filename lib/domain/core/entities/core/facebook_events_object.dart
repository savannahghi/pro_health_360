import 'package:facebook_app_events/facebook_app_events.dart';

class MyAfyaHubFacebookEvents {
  factory MyAfyaHubFacebookEvents() {
    return _singleton;
  }

  MyAfyaHubFacebookEvents._internal();

  final FacebookAppEvents logger = FacebookAppEvents();

  static final MyAfyaHubFacebookEvents _singleton =
      MyAfyaHubFacebookEvents._internal();
}
