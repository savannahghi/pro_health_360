// Package imports:
import 'package:domain_objects/value_objects.dart';

List<String> kGenderTypes = <String>[
  Gender.male.name,
  Gender.female.name,
  Gender.unknown.name
];

enum AppErrorType { UserFeedError }

enum UserType { normal, anonymous }

enum AuthTokenStatus { okay, requiresLogin, requiresPin }

/// [BorderRadiusSides] helps determine the exact side the border radius
/// for widgets should be set
enum BorderRadiusSides {
  TopOnly,
  BottomOnly,
  None,
  All,
}
enum TimelineItemType {
  DiaryText,
  DiaryImage,
  Appointment,
}

enum FollowUpChoice { Yes, No, Unknown }
