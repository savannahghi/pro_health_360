// Flutter imports:
import 'package:flutter/foundation.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';

enum AppErrorType { UserFeedError }

enum UserType { normal, anonymous }

enum AuthTokenStatus { okay, requiresLogin, requiresPin }

enum TimelineItemType {
  DiaryText,
  DiaryImage,
  Appointment,
}

enum FollowUpChoice { Yes, No, Unknown }

enum MoodType {
  VERY_HAPPY,
  HAPPY,
  NEUTRAL,
  SAD,
  VERY_SAD,
}

/// [MoodTypeEx] extends [MoodType] enum to get the icon values as
/// strings
extension MoodTypeEx on MoodType {
  String get iconString {
    switch (this) {
      case MoodType.VERY_HAPPY:
        return excitedIconSvgPath;

      case MoodType.HAPPY:
        return happyIconSvgPath;

      case MoodType.NEUTRAL:
        return mehIconSvgPath;

      case MoodType.SAD:
        return sadIconSvgPath;

      case MoodType.VERY_SAD:
        return verySadIconSvgPath;
    }
  }

  String get name {
    switch (this) {
      case MoodType.VERY_HAPPY:
        return veryHappyString;

      case MoodType.HAPPY:
        return happyString;

      case MoodType.NEUTRAL:
        return neutralString;

      case MoodType.SAD:
        return sadString;

      case MoodType.VERY_SAD:
        return verySadString;
    }
  }

  String get value {
    return describeEnum(this).toUpperCase();
  }
}

/// The type of content being served to the user
enum ContentType { AUDIO_VIDEO, DOCUMENT, ARTICLE, UNKNOWN }

enum FeaturedMediaType { AUDIO, MEDIA, VIDEO, UNKNOWN }

enum EditInformationInputType { Text, DropDown }

/// The type of the client
enum ClientType { PMTCT, OVC, UNKNOWN }

/// The type of the address being used
enum AddressType { POSTAL, PHYSICAL, BOTH, UNKNOWN }

/// The relationship type. Used in next of kin
enum RelationshipType {
  NEXT_OF_KIN,
  EMPLOYER,
  EMERGENCY_CONTACT,
  CHILD,
  OTHER,
  UNKNOWN
}

/// The type of contact being used
enum ContactType { PHONE, EMAIL, UNKNOWN }

/// Security Questions response type
enum SecurityQuestionResponseType { NUMBER, TEXT, DATE, UNKNOWN }

/// [SecurityQuestionResponseTypeEx] extends [SecurityQuestionResponseType] enum to get the values as
/// strings
extension SecurityQuestionResponseTypeEx on SecurityQuestionResponseType {
  String get name {
    return describeEnum(this).toUpperCase();
  }
}
