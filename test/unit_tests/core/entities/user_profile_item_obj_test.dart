// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:pro_health_360/domain/core/entities/core/user_profile_item_obj.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

void main() {
  final Map<String, dynamic> data = <String, dynamic>{
    'iconAssetPath': feedbackIcon,
    'title': 'Feedback',
    'route': AppRoutes.feedbackPage,
  };
  test('UserProfileItemObj toJson', () {
    expect(
      UserProfileItemObj(
        iconAssetPath: feedbackIcon,
        title: 'Feedback',
        route: AppRoutes.feedbackPage,
      ).toJson(),
      data,
    );
  });

  test('UserProfileItemObj fromJson', () {
    expect(
      UserProfileItemObj.fromJson(data),
      isA<UserProfileItemObj>(),
    );
  });
}
