// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/congratulations_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/create_new_pin_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/verify_phone_page.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/forgot_pin_otp_widget.dart';
import 'package:myafyahub/presentation/profile/pages/clinic_information_page.dart';
import 'package:myafyahub/presentation/profile/pages/profile_faqs_page.dart';
import 'package:myafyahub/presentation/profile/pages/settings_page.dart';
import 'package:myafyahub/presentation/profile/pages/user_profile_page.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/my_afya_hub_phone_login_page.dart';
import 'package:user_profile/term_and_conditions.dart' as webview;

// Project imports:
import 'package:myafyahub/domain/core/entities/library/library_content_item.dart';
import 'package:myafyahub/presentation/community/chat_screen/pages/community_chat_screen_page.dart';
import 'package:myafyahub/presentation/community/community_list_page.dart';
import 'package:myafyahub/presentation/doctors/doctors_page.dart';
import 'package:myafyahub/presentation/engagement/home/pages/home_page.dart';
import 'package:myafyahub/presentation/engagement/library/library.dart';
import 'package:myafyahub/presentation/engagement/library/library_content.dart';
import 'package:myafyahub/presentation/feed/pages/my_afya_hub_feed_page.dart';
import 'package:myafyahub/presentation/medical_tests/medical_tests_landing_page.dart';
import 'package:myafyahub/presentation/medications/medications_landing_page.dart';
import 'package:myafyahub/presentation/my_health/pages/appointments_page.dart';
import 'package:myafyahub/presentation/my_health/pages/my_health_diary_page.dart';
import 'package:myafyahub/presentation/my_health/pages/my_health_page.dart';
import 'package:myafyahub/presentation/notifications/notifications_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/basic_details_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/request_pin_reset_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/resume_with_pin_page.dart';
import 'package:myafyahub/presentation/onboarding/security_questions/answer_security_question_page.dart';
import 'package:myafyahub/presentation/onboarding/security_questions/security_questions_page.dart';
import 'package:myafyahub/presentation/onboarding/terms_and_conditions_page.dart';
import 'package:myafyahub/presentation/profile/pages/consent_page.dart';
import 'package:myafyahub/presentation/profile/pages/contact_details.dart';
import 'package:myafyahub/presentation/profile/pages/edit_profile_page.dart';
import 'package:myafyahub/presentation/profile/pages/medical_data_page.dart';
import 'package:myafyahub/presentation/profile/pages/personal_information_page.dart';
import 'package:myafyahub/presentation/profile/pages/saved_posts.dart';
import 'package:myafyahub/presentation/profile/pages/user_profile.dart';
import 'package:myafyahub/presentation/router/router_generator.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import '../../mocks.dart';

void main() {
  const Route<dynamic> Function(RouteSettings settings) routeGenerator =
      RouteGenerator.generateRoute;

  final BuildContext context = MockBuildContext();

  test('Test router returns default page', () {
    const RouteSettings settings = RouteSettings();

    final MaterialPageRoute<HomePage> route =
        routeGenerator(settings) as MaterialPageRoute<HomePage>;

    expect(route, isA<MaterialPageRoute<HomePage>>());
    expect(route.builder(context), isA<HomePage>());
  });
  test('Test router returns phoneLogin', () {
    const RouteSettings settings = RouteSettings(
        name: BWRoutes.phoneLogin,
        arguments: <String, dynamic>{'test': 'value'});

    final MaterialPageRoute<MyAfyaHubPhoneLoginPage> route =
        routeGenerator(settings) as MaterialPageRoute<MyAfyaHubPhoneLoginPage>;

    expect(route, isA<MaterialPageRoute<MyAfyaHubPhoneLoginPage>>());
    expect(route.builder(context), isA<MyAfyaHubPhoneLoginPage>());
  });

  test('Test router returns create new pin page', () {
    const RouteSettings settings = RouteSettings(
      name: BWRoutes.createPin,
    );

    final MaterialPageRoute<CreateNewPINPage> route =
        routeGenerator(settings) as MaterialPageRoute<CreateNewPINPage>;

    expect(route, isA<MaterialPageRoute<CreateNewPINPage>>());
    expect(route.builder(context), isA<CreateNewPINPage>());
  });

  test('Test router returns  verify otp page', () {
    const RouteSettings settings = RouteSettings(
        name: BWRoutes.verifySignUpOTP,
        arguments: <String, dynamic>{'OTP': 1234});

    final MaterialPageRoute<VerifyPhonePage> route =
        routeGenerator(settings) as MaterialPageRoute<VerifyPhonePage>;

    expect(route, isA<MaterialPageRoute<VerifyPhonePage>>());
    expect(route.builder(context), isA<VerifyPhonePage>());
  });

  test('Test router returns congratulations page', () {
    const RouteSettings settings = RouteSettings(
        name: BWRoutes.congratulationsPage,
        arguments: <String, dynamic>{'duration': '1 year'});

    final MaterialPageRoute<CongratulationsPage> route =
        routeGenerator(settings) as MaterialPageRoute<CongratulationsPage>;

    expect(route, isA<MaterialPageRoute<CongratulationsPage>>());
    expect(route.builder(context), isA<CongratulationsPage>());
  });

  test('Test router returns HomePage', () {
    const RouteSettings settings = RouteSettings(
        name: BWRoutes.home, arguments: <String, dynamic>{'test': 'value'});

    final MaterialPageRoute<HomePage> route =
        routeGenerator(settings) as MaterialPageRoute<HomePage>;

    expect(route, isA<MaterialPageRoute<HomePage>>());
    expect(route.builder(context), isA<HomePage>());
  });

  test('Test router returns phoneLogin Page', () {
    const RouteSettings settings = RouteSettings(name: BWRoutes.phoneLogin);

    final MaterialPageRoute<MyAfyaHubPhoneLoginPage> route =
        routeGenerator(settings) as MaterialPageRoute<MyAfyaHubPhoneLoginPage>;

    expect(route, isA<MaterialPageRoute<MyAfyaHubPhoneLoginPage>>());
    expect(route.builder(context), isA<MyAfyaHubPhoneLoginPage>());
  });

  test('Test router returns incoming library page', () {
    const RouteSettings settings = RouteSettings(name: BWRoutes.library);

    final MaterialPageRoute<Library> route =
        routeGenerator(settings) as MaterialPageRoute<Library>;

    expect(route, isA<MaterialPageRoute<Library>>());
    expect(route.builder(context), isA<Library>());
  });

  test('Test router returns incoming  libraryContent page', () {
    final RouteSettings settings = RouteSettings(
      name: BWRoutes.libraryContent,
      arguments: LibraryContentItemData('test', 'test', 'test', 'test',
          libraryContentPublishDate: 'test', libraryContentTitle: 'test'),
    );

    final MaterialPageRoute<LibraryContent> route =
        routeGenerator(settings) as MaterialPageRoute<LibraryContent>;

    expect(route, isA<MaterialPageRoute<LibraryContent>>());
    expect(route.builder(context), isA<LibraryContent>());
  });

  test('Test router returns incoming  seeDoctor page', () {
    const RouteSettings settings = RouteSettings(name: BWRoutes.seeDoctor);

    final MaterialPageRoute<SeeDoctorLandingPage> route =
        routeGenerator(settings) as MaterialPageRoute<SeeDoctorLandingPage>;

    expect(route, isA<MaterialPageRoute<SeeDoctorLandingPage>>());
    expect(route.builder(context), isA<SeeDoctorLandingPage>());
  });
  test('Test router returns incoming  basicDetails page', () {
    const RouteSettings settings = RouteSettings(name: BWRoutes.basicDetails);

    final MaterialPageRoute<BasicDetailsPage> route =
        routeGenerator(settings) as MaterialPageRoute<BasicDetailsPage>;

    expect(route, isA<MaterialPageRoute<BasicDetailsPage>>());
    expect(route.builder(context), isA<BasicDetailsPage>());
  });

  test('Test router returns incoming  resetPin page', () {
    const RouteSettings settings = RouteSettings(name: BWRoutes.resetPin);

    final MaterialPageRoute<RequestPinResetPage> route =
        routeGenerator(settings) as MaterialPageRoute<RequestPinResetPage>;

    expect(route, isA<MaterialPageRoute<RequestPinResetPage>>());
    expect(route.builder(context), isA<RequestPinResetPage>());
  });
  test('Test router returns incoming  resumeWithPin page', () {
    const RouteSettings settings = RouteSettings(name: BWRoutes.resumeWithPin);

    final MaterialPageRoute<ResumeWithPinPage> route =
        routeGenerator(settings) as MaterialPageRoute<ResumeWithPinPage>;

    expect(route, isA<MaterialPageRoute<ResumeWithPinPage>>());
    expect(route.builder(context), isA<ResumeWithPinPage>());
  });

  test('Test router returns incoming  buyMedicine page', () {
    const RouteSettings settings = RouteSettings(name: BWRoutes.buyMedicine);

    final MaterialPageRoute<BuyMedicineLandingPage> route =
        routeGenerator(settings) as MaterialPageRoute<BuyMedicineLandingPage>;

    expect(route, isA<MaterialPageRoute<BuyMedicineLandingPage>>());
    expect(route.builder(context), isA<BuyMedicineLandingPage>());
  });

  test('Test router returns incoming  getTested page', () {
    const RouteSettings settings = RouteSettings(name: BWRoutes.getTested);

    final MaterialPageRoute<MedicalTestsLandingPage> route =
        routeGenerator(settings) as MaterialPageRoute<MedicalTestsLandingPage>;

    expect(route, isA<MaterialPageRoute<MedicalTestsLandingPage>>());
    expect(route.builder(context), isA<MedicalTestsLandingPage>());
  });
  test('Test router returns incoming  seeDoctor page', () {
    const RouteSettings settings = RouteSettings(name: BWRoutes.seeDoctor);
    final MaterialPageRoute<SeeDoctorLandingPage> route =
        routeGenerator(settings) as MaterialPageRoute<SeeDoctorLandingPage>;

    expect(route, isA<MaterialPageRoute<SeeDoctorLandingPage>>());
    expect(route.builder(context), isA<SeeDoctorLandingPage>());
  });
  test('Test router returns incoming  editProfileSettingsPage page', () {
    const RouteSettings settings =
        RouteSettings(name: BWRoutes.editProfileSettingsPage);
    final MaterialPageRoute<EditProfilePage> route =
        routeGenerator(settings) as MaterialPageRoute<EditProfilePage>;
    expect(route, isA<MaterialPageRoute<dynamic>>());
    expect(route.builder(context), isA<EditProfilePage>());
  });
  test('Test router returns incoming  userProfile page', () {
    const RouteSettings settings = RouteSettings(name: BWRoutes.userProfile);
    final MaterialPageRoute<UserProfile> route =
        routeGenerator(settings) as MaterialPageRoute<UserProfile>;
    expect(route, isA<MaterialPageRoute<UserProfile>>());
    expect(route.builder(context), isA<UserProfile>());
  });

  test('Test router returns incoming  webView page', () {
    const RouteSettings settings = RouteSettings(name: BWRoutes.webView);
    final MaterialPageRoute<webview.TermsAndConditionsPage> route =
        routeGenerator(settings)
            as MaterialPageRoute<webview.TermsAndConditionsPage>;
    expect(route, isA<MaterialPageRoute<webview.TermsAndConditionsPage>>());
    expect(route.builder(context), isA<webview.TermsAndConditionsPage>());
  });

  test('Test router returns profile contact details page', () {
    const RouteSettings settings = RouteSettings(name: BWRoutes.contactInfo);
    final MaterialPageRoute<ProfileContactDetails> route =
        routeGenerator(settings) as MaterialPageRoute<ProfileContactDetails>;
    expect(route, isA<MaterialPageRoute<ProfileContactDetails>>());
    expect(route.builder(context), isA<ProfileContactDetails>());
  });

  test('Test router returns security questions page', () {
    const RouteSettings settings =
        RouteSettings(name: BWRoutes.securityQuestionsPage);
    final MaterialPageRoute<SecurityQuestionsPage> route =
        routeGenerator(settings) as MaterialPageRoute<SecurityQuestionsPage>;
    expect(route, isA<MaterialPageRoute<SecurityQuestionsPage>>());
    expect(route.builder(context), isA<SecurityQuestionsPage>());
  });

  test('Test router returns answer security question page', () {
    const RouteSettings settings =
        RouteSettings(name: BWRoutes.answerSecurityQuestionPage);
    final MaterialPageRoute<AnswerSecurityQuestionPage> route =
        routeGenerator(settings)
            as MaterialPageRoute<AnswerSecurityQuestionPage>;
    expect(route, isA<MaterialPageRoute<AnswerSecurityQuestionPage>>());
    expect(route.builder(context), isA<AnswerSecurityQuestionPage>());
  });

  test('Test router returns TermsAndConditionsPage', () {
    const RouteSettings settings =
        RouteSettings(name: BWRoutes.termsAndConditions);
    final MaterialPageRoute<TermsAndConditionsPage> route =
        routeGenerator(settings) as MaterialPageRoute<TermsAndConditionsPage>;
    expect(route, isA<MaterialPageRoute<TermsAndConditionsPage>>());
    expect(route.builder(context), isA<TermsAndConditionsPage>());
  });

  test('Test router returns CommunityListView', () {
    const RouteSettings settings =
        RouteSettings(name: BWRoutes.communityListView);

    final MaterialPageRoute<CommunityListViewPage> route =
        routeGenerator(settings) as MaterialPageRoute<CommunityListViewPage>;
    expect(route, isA<MaterialPageRoute<CommunityListViewPage>>());
    expect(route.builder(context), isA<CommunityListViewPage>());
  });

  test('Test router returns CommunityChatScreenPage', () {
    const RouteSettings settings =
        RouteSettings(name: BWRoutes.communityChatScreenPage);

    final MaterialPageRoute<CommunityChatScreenPage> route =
        routeGenerator(settings) as MaterialPageRoute<CommunityChatScreenPage>;
    expect(route, isA<MaterialPageRoute<CommunityChatScreenPage>>());
    expect(route.builder(context), isA<CommunityChatScreenPage>());
  });

  test('Test router returns  MyAfyaHubFeedPage', () {
    const RouteSettings settings =
        RouteSettings(name: BWRoutes.myAfyaHubFeedPage);

    final MaterialPageRoute<MyAfyaHubFeedPage> route =
        routeGenerator(settings) as MaterialPageRoute<MyAfyaHubFeedPage>;
    expect(route, isA<MaterialPageRoute<MyAfyaHubFeedPage>>());
    expect(route.builder(context), isA<MyAfyaHubFeedPage>());
  });

  test('Test router returns ConsentPage', () {
    const RouteSettings settings = RouteSettings(name: BWRoutes.consent);

    final MaterialPageRoute<ConsentPage> route =
        routeGenerator(settings) as MaterialPageRoute<ConsentPage>;
    expect(route, isA<MaterialPageRoute<ConsentPage>>());
    expect(route.builder(context), isA<ConsentPage>());
  });

  test('Test router returns PersonalInformation Page', () {
    const RouteSettings settings = RouteSettings(name: BWRoutes.personalInfo);

    final MaterialPageRoute<PersonalInformationPage> route =
        routeGenerator(settings) as MaterialPageRoute<PersonalInformationPage>;
    expect(route, isA<MaterialPageRoute<PersonalInformationPage>>());
    expect(route.builder(context), isA<PersonalInformationPage>());
  });

  test('Test router returns MedicalDataPage', () {
    const RouteSettings settings = RouteSettings(name: BWRoutes.medicalData);

    final MaterialPageRoute<MedicalDataPage> route =
        routeGenerator(settings) as MaterialPageRoute<MedicalDataPage>;
    expect(route, isA<MaterialPageRoute<MedicalDataPage>>());
    expect(route.builder(context), isA<MedicalDataPage>());
  });

  test('Test router returns ForgotOTPPage', () {
    const RouteSettings settings =
        RouteSettings(name: BWRoutes.forgotPinOtpWidget);

    final MaterialPageRoute<ForgotPinOtpWidget> route =
        routeGenerator(settings) as MaterialPageRoute<ForgotPinOtpWidget>;
    expect(route, isA<MaterialPageRoute<ForgotPinOtpWidget>>());
    expect(route.builder(context), isA<ForgotPinOtpWidget>());
  });

  test('Test router returns SavedPostsPage', () {
    const RouteSettings settings = RouteSettings(name: BWRoutes.savedPosts);

    final MaterialPageRoute<SavedPostPage> route =
        routeGenerator(settings) as MaterialPageRoute<SavedPostPage>;
    expect(route, isA<MaterialPageRoute<SavedPostPage>>());
    expect(route.builder(context), isA<SavedPostPage>());
  });

  test('Test router returns AppointmentsPage', () {
    const RouteSettings settings =
        RouteSettings(name: BWRoutes.appointmentsPage);

    final MaterialPageRoute<AppointmentsPage> route =
        routeGenerator(settings) as MaterialPageRoute<AppointmentsPage>;
    expect(route, isA<MaterialPageRoute<AppointmentsPage>>());
    expect(route.builder(context), isA<AppointmentsPage>());
  });

  test('Test router returns NotificationsPage', () {
    const RouteSettings settings =
        RouteSettings(name: BWRoutes.notificationsPage);

    final MaterialPageRoute<NotificationsPage> route =
        routeGenerator(settings) as MaterialPageRoute<NotificationsPage>;
    expect(route, isA<MaterialPageRoute<NotificationsPage>>());
    expect(route.builder(context), isA<NotificationsPage>());
  });

  test('Test router returns MyHealthPage', () {
    const RouteSettings settings = RouteSettings(name: BWRoutes.myHealthPage);

    final MaterialPageRoute<MyHealthPage> route =
        routeGenerator(settings) as MaterialPageRoute<MyHealthPage>;
    expect(route, isA<MaterialPageRoute<MyHealthPage>>());
    expect(route.builder(context), isA<MyHealthPage>());
  });
  test('Test router returns MyHealthDiaryPage', () {
    const RouteSettings settings =
        RouteSettings(name: BWRoutes.myHealthDiaryPage);

    final MaterialPageRoute<MyHealthDiaryPage> route =
        routeGenerator(settings) as MaterialPageRoute<MyHealthDiaryPage>;
    expect(route, isA<MaterialPageRoute<MyHealthDiaryPage>>());
    expect(route.builder(context), isA<MyHealthDiaryPage>());
  });
  test('Test router returns UserProfilePage', () {
    const RouteSettings settings =
        RouteSettings(name: BWRoutes.userProfilePage);
    final MaterialPageRoute<UserProfilePage> route =
        routeGenerator(settings) as MaterialPageRoute<UserProfilePage>;
    expect(route, isA<MaterialPageRoute<UserProfilePage>>());
    expect(route.builder(context), isA<UserProfilePage>());
  });

  test('Test router returns ProfileFaqsPage', () {
    const RouteSettings settings =
        RouteSettings(name: BWRoutes.profileFaqsPage);
    final MaterialPageRoute<ProfileFaqsPage> route =
        routeGenerator(settings) as MaterialPageRoute<ProfileFaqsPage>;
    expect(route, isA<MaterialPageRoute<ProfileFaqsPage>>());
    expect(route.builder(context), isA<ProfileFaqsPage>());
  });
  test('Test router returns ClinicInformationPage', () {
    const RouteSettings settings =
        RouteSettings(name: BWRoutes.clinicInformationPage);
    final MaterialPageRoute<ClinicInformationPage> route =
        routeGenerator(settings) as MaterialPageRoute<ClinicInformationPage>;
    expect(route, isA<MaterialPageRoute<ClinicInformationPage>>());
    expect(route.builder(context), isA<ClinicInformationPage>());
  });

  test('Test router returns SettingsPage', () {
    const RouteSettings settings = RouteSettings(name: BWRoutes.settingsPage);
    final MaterialPageRoute<SettingsPage> route =
        routeGenerator(settings) as MaterialPageRoute<SettingsPage>;
    expect(route, isA<MaterialPageRoute<SettingsPage>>());
    expect(route.builder(context), isA<SettingsPage>());
  });
}
