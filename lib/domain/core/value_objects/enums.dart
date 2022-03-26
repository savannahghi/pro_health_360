// Flutter imports:
import 'package:flutter/foundation.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';

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
enum ContentType { AUDIO_VIDEO, DOCUMENT, ARTICLE, PDF_DOCUMENT, UNKNOWN }

enum ContentDisplayedType { RECENT, FEED, BOOKMARK, UNKNOWN }

enum FeaturedMediaType { audio, video, UNKNOWN }

/// The type of the client
enum ClientType {
  PMTCT,
  OVC,
  OTZ,
  OTZ_PLUS,
  HVL,
  DREAMS,
  HIGH_RISK,
  SPOUSES,
  YOUTH,
  UNKNOWN
}

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

/// The current onboarding workflow that is running
///
/// [Login] stage is when a user is signing up normally. It was combined and
///  tweaked to handle signup as well because once a user has been invited they
///  will still have to login
///
/// [ChangePin] is used when the user's PIN has been changed by someone else
///  like their HCW or an admin
///
/// [PINExpired] is used when a user's PIN has expired
///
/// [PINUpdate] is used when a user's PIN has been changed previously
///
/// The [CurrentOnboardingStage] is stored in the [onboardingState] and must be
///  changed at the end of each workflow
enum CurrentOnboardingStage { Login, ResetPIN, PINExpired, PINUpdate }

// The various states that an appointment can take
enum AppointmentStatus {
  SCHEDULED,
  RESCHEDULED,
  WAITING,
  MISSED,
  COMPLETED,
  INCONSULTATION,
  WALKIN,
  CANCELLED,
  NEEDSRESCHEDULE,
  UNKNOWN,
}

enum AppointmentListTye { Past, Upcoming }
