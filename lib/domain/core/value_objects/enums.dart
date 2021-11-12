// Package imports:
import 'package:domain_objects/value_objects.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';

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

enum MoodType {
  Excited,
  Happy,
  Meh,
  Sad,
  VerySad,
}

/// [MoodTypeEx] extends [MoodType] enum to get the icon values as
/// strings
extension MoodTypeEx on MoodType {
  String get iconString {
    switch (this) {
      case MoodType.Excited:
        return excitedIconSvgPath;

      case MoodType.Happy:
        return happyIconSvgPath;

      case MoodType.Meh:
        return mehIconSvgPath;

      case MoodType.Sad:
        return sadIconSvgPath;

      case MoodType.VerySad:
        return verySadIconSvgPath;
    }
  }
}

enum FeedType { Video, Article }

enum EditInformationInputType { Text, DropDown }
