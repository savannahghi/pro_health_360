// Project imports:
import 'package:flutter/foundation.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';

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

/// The type of content being served to the user
enum ContentType { VIDEO, AUDIO, ARTICLE }

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
