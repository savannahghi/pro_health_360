// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:rxdart/rxdart.dart';
import 'package:unicons/unicons.dart';

// Project imports:
import 'package:myafyahub/domain/core/entities/core/profile_page_items.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class UtilizationBehaviorSubject {
  factory UtilizationBehaviorSubject() {
    return _singleton;
  }

  UtilizationBehaviorSubject._internal();

  /// [authorizations] holds raw authorization as received from backend
  BehaviorSubject<dynamic> authorizations = BehaviorSubject<dynamic>();

  /// [authorizationsFiltered] holds authorizations list that has been filtered
  BehaviorSubject<dynamic> authorizationsFiltered = BehaviorSubject<dynamic>();

  /// [cache] is used to cache server response. this will stop the Ui from
  /// making multiple requests for the same date when the user changes tabs from
  /// utilization to details and back
  BehaviorSubject<dynamic> cache = BehaviorSubject<dynamic>();

  /// [preauthorizations] holds raw preauthorizations received from the backend
  BehaviorSubject<dynamic> preauthorizations = BehaviorSubject<dynamic>();

  /// [preauthorizationsFiltered] hold preauthorizations list that has been filtered
  BehaviorSubject<dynamic> preauthorizationsFiltered =
      BehaviorSubject<dynamic>();

  BehaviorSubject<dynamic> reservedAmountClaimsBehaviorObject =
      BehaviorSubject<dynamic>();

  BehaviorSubject<dynamic> spentAmountClaimsBehaviorObject =
      BehaviorSubject<dynamic>();

  static final UtilizationBehaviorSubject _singleton =
      UtilizationBehaviorSubject._internal();

  /// [hasCache] checks if a cache has been saved
  // ignore: avoid_bool_literals_in_conditional_expressions
  bool hasCache() => this.cache.value != null ? true : false;

  /// [clearCache] removes the caches. Called when navigating from single benefit page
  void clearCache() {
    this.cache.add(null);
    this.reservedAmountClaimsBehaviorObject.add(null);
    this.spentAmountClaimsBehaviorObject.add(null);
    this.authorizations.add(null);
    this.preauthorizations.add(null);
  }
}

/// [BookAppointmentSubject] holds information that will be used when booking/starting
/// a visit. More specifically, the patient, the provider, reasons for the visit
class BookAppointmentSubject {
  factory BookAppointmentSubject() {
    return _singleton;
  }

  BookAppointmentSubject._internal();

  /// [benefitCode] the benefit code that will be used to start a visit
  BehaviorSubject<dynamic> benefitCode = BehaviorSubject<dynamic>();

  /// [benefitType] the benefit that will be used to start a visit
  BehaviorSubject<String> benefitType = BehaviorSubject<String>();

  /// [doctorBranchID] the guid of the the doctor or hospital that will participate in the visit
  BehaviorSubject<dynamic> doctorBranchID = BehaviorSubject<dynamic>();

  /// [doctorPushToken] the device to the doctor that we will send a notification to
  BehaviorSubject<dynamic> doctorPushToken = BehaviorSubject<dynamic>();

  /// [doctorSladeCode] the sladecode of the the doctor or hospital that will participate in the visit
  BehaviorSubject<dynamic> doctorSladeCode = BehaviorSubject<dynamic>();

  /// [isTeleconsult] whether the visit is a teleconsult or physical
  BehaviorSubject<bool> isTeleconsult = BehaviorSubject<bool>.seeded(true);

  /// [patientMSISDN] the phone number that is used for OTP authorization
  BehaviorSubject<String> patientMSISDN = BehaviorSubject<String>();

  /// [patientMemberNumber] the member number of the patient
  BehaviorSubject<String> patientMemberNumber = BehaviorSubject<String>();

  /// [patientOTPCode] otp code used to verify the patient's phone number
  BehaviorSubject<String> patientOTPCode = BehaviorSubject<String>();

  /// [patientSelfieBase64] the base64 string of the photo taken for auth
  BehaviorSubject<String> patientSelfieBase64 = BehaviorSubject<String>();

  /// [patientSelfieContentType] the content type of the photo taken
  BehaviorSubject<String> patientSelfieContentType = BehaviorSubject<String>();

  /// [presentingSymptom] picked from a predefined list of common symptoms
  BehaviorSubject<dynamic> presentingSymptom = BehaviorSubject<dynamic>();

  /// [presentingSymptomProse] free test added by the user. Essential to provided more details to the
  /// presiding doctor
  BehaviorSubject<dynamic> presentingSymptomProse = BehaviorSubject<dynamic>();

  /// [showDependants] the patient's dependants show toggle
  BehaviorSubject<bool> showDependants = BehaviorSubject<bool>();

  /// [userCoordinates] the patient's current location
  BehaviorSubject<dynamic> userCoordinates = BehaviorSubject<dynamic>();

  /// [userPanels ] the patient's panel factor by their geolocation
  BehaviorSubject<dynamic> userPanels = BehaviorSubject<dynamic>();

  static final BookAppointmentSubject _singleton =
      BookAppointmentSubject._internal();

  /// [clearSubject] resets everything to null. Should be called when the user aborts starting a visit or when
  /// a successful visit has been created
  void clearSubject() {
    this.patientMemberNumber.add('');
    this.patientMSISDN.add('');
    this.patientOTPCode.add('');
    this.patientSelfieBase64.add('');
    this.patientSelfieContentType.add('');
    this.doctorBranchID.add(null);
    this.doctorSladeCode.add(null);
    this.doctorPushToken.add(null);
    this.presentingSymptom.add(null);
    this.presentingSymptomProse.add(null);
    this.isTeleconsult.add(false);
    this.benefitCode.add(null);
    this.benefitType.add('');
    this.userCoordinates.add(null);
    this.userPanels.add(null);
    this.showDependants.add(false);
  }
}

class AuthorizationQueryDetailsBehaviorObject {
  factory AuthorizationQueryDetailsBehaviorObject() {
    return _singleton;
  }

  AuthorizationQueryDetailsBehaviorObject._internal();

  BehaviorSubject<dynamic> authorizationQueryDetailsBehaviorObject =
      BehaviorSubject<dynamic>();

  static final AuthorizationQueryDetailsBehaviorObject _singleton =
      AuthorizationQueryDetailsBehaviorObject._internal();
}

class CardIndexBehaviorObject {
  factory CardIndexBehaviorObject() {
    return _singleton;
  }

  CardIndexBehaviorObject._internal();

  BehaviorSubject<int> cardIndexBehaviorObject = BehaviorSubject<int>();
  BehaviorSubject<int> dependantsIndex = BehaviorSubject<int>();

  static final CardIndexBehaviorObject _singleton =
      CardIndexBehaviorObject._internal();
}

class ManageDependantsBehaviorObject {
  factory ManageDependantsBehaviorObject() {
    return _singleton;
  }

  ManageDependantsBehaviorObject._internal();

  BehaviorSubject<dynamic> dependantMemberNumber = BehaviorSubject<dynamic>();
  BehaviorSubject<dynamic> dependantPayerSladeCode = BehaviorSubject<dynamic>();

  static final ManageDependantsBehaviorObject _singleton =
      ManageDependantsBehaviorObject._internal();
}

class RequestPinResetBehaviorObject {
  factory RequestPinResetBehaviorObject() {
    return _singleton;
  }

  RequestPinResetBehaviorObject._internal();

  BehaviorSubject<bool> processing = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> userHasNoAccount = BehaviorSubject<bool>.seeded(false);

  static final RequestPinResetBehaviorObject _singleton =
      RequestPinResetBehaviorObject._internal();
}

class UserPhoneBehaviorObject {
  factory UserPhoneBehaviorObject() {
    return _singleton;
  }

  UserPhoneBehaviorObject._internal();

  BehaviorSubject<bool> allowedComm = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> loading = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<String> phoneNumber = BehaviorSubject<String>();

  static final UserPhoneBehaviorObject _singleton =
      UserPhoneBehaviorObject._internal();
}

class UserEmailBehaviorObject {
  factory UserEmailBehaviorObject() {
    return _singleton;
  }

  UserEmailBehaviorObject._internal();

  BehaviorSubject<bool> allowedComm = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> loading = BehaviorSubject<bool>.seeded(false);

  static final UserEmailBehaviorObject _singleton =
      UserEmailBehaviorObject._internal();
}

class EditProfilePageBehaviorObject {
  factory EditProfilePageBehaviorObject() {
    return _singleton;
  }

  EditProfilePageBehaviorObject._internal();

  BehaviorSubject<bool> loading = BehaviorSubject<bool>.seeded(false);

  static final EditProfilePageBehaviorObject _singleton =
      EditProfilePageBehaviorObject._internal();
}

class StartVisitIdentificationOTP {
  factory StartVisitIdentificationOTP() {
    return _singleton;
  }

  StartVisitIdentificationOTP._internal();

  BehaviorSubject<bool> codeHasTakenLong = BehaviorSubject<bool>.seeded(false);

  /// [StartVisitIdentificationOTP]
  BehaviorSubject<String> startVisitIdentificationOTP =
      BehaviorSubject<String>();

  static final StartVisitIdentificationOTP _singleton =
      StartVisitIdentificationOTP._internal();
}

class ProfileSubject {
  factory ProfileSubject() {
    return _singleton;
  }

  ProfileSubject._internal();

  BehaviorSubject<Color> color =
      BehaviorSubject<Color>.seeded(Colors.purple[100]!);

  BehaviorSubject<String> selectedTile =
      BehaviorSubject<String>.seeded(contactInfo);

  BehaviorSubject<ValueNotifier<ProfileItems>> selection =
      BehaviorSubject<ValueNotifier<ProfileItems>>.seeded(
    ValueNotifier<ProfileItems>(
      const ProfileItems(
        text: contactInfo,
        section: ProfileItemType.account,
        onTapRoute: BWRoutes.contactInfo,
        iconData: UniconsLine.user_circle,
      ),
    ),
  );

  static final ProfileSubject _singleton = ProfileSubject._internal();
}

class InternetConnectivitySubject {
  factory InternetConnectivitySubject() {
    return _singleton;
  }

  InternetConnectivitySubject._internal();

  BehaviorSubject<bool> connectivitySubject =
      BehaviorSubject<bool>.seeded(true);

  static final InternetConnectivitySubject _singleton =
      InternetConnectivitySubject._internal();
}

class DeepLinkSubject {
  factory DeepLinkSubject() {
    return _singleton;
  }

  DeepLinkSubject._internal();

  BehaviorSubject<bool> hasLink = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<String> link = BehaviorSubject<String>();
  GlobalKey<NavigatorState>? navigatorKey;

  static final DeepLinkSubject _singleton = DeepLinkSubject._internal();
}
