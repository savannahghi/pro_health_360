import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/entities/library/library_content_item.dart';
import 'package:myafyahub/presentation/community/community_list_view.dart';
import 'package:myafyahub/presentation/doctors/doctors_page.dart';
import 'package:myafyahub/presentation/engagement/home/pages/home_page.dart';
import 'package:myafyahub/presentation/engagement/library/library.dart';
import 'package:myafyahub/presentation/engagement/library/library_content.dart';
import 'package:myafyahub/presentation/help_center/pages/help_center_page.dart';
import 'package:myafyahub/presentation/medical_tests/medical_tests_landing_page.dart';
import 'package:myafyahub/presentation/medications/medications_landing_page.dart';
import 'package:myafyahub/presentation/onboarding/landing_page/landing_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/basic_details_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/phone_number_login_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/request_pin_reset_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/resume_with_pin_page.dart';
import 'package:myafyahub/presentation/onboarding/security_questions/answer_security_question_page.dart';
import 'package:myafyahub/presentation/onboarding/security_questions/security_questions_page.dart';
import 'package:myafyahub/presentation/onboarding/signup/verify_signup_otp.dart';
import 'package:myafyahub/presentation/onboarding/terms_and_conditions_page.dart';
import 'package:myafyahub/presentation/profile/pages/consent_page.dart';
import 'package:myafyahub/presentation/profile/pages/contact_details.dart';
import 'package:myafyahub/presentation/profile/pages/edit_profile_page.dart';
import 'package:myafyahub/presentation/profile/pages/personal_inforamation_page.dart';
import 'package:myafyahub/presentation/profile/pages/user_profile.dart';
import 'package:myafyahub/presentation/router/router_generator.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:user_profile/term_and_conditions.dart' as webview;

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
  test('Test router returns landing', () {
    const RouteSettings settings = RouteSettings(
        name: BWRoutes.landing, arguments: <String, dynamic>{'test': 'value'});

    final MaterialPageRoute<LandingPage> route =
        routeGenerator(settings) as MaterialPageRoute<LandingPage>;

    expect(route, isA<MaterialPageRoute<LandingPage>>());
    expect(route.builder(context), isA<LandingPage>());
  });
  test('Test router returns phoneLogin', () {
    const RouteSettings settings = RouteSettings(
        name: BWRoutes.phoneLogin,
        arguments: <String, dynamic>{'test': 'value'});

    final MaterialPageRoute<PhoneNumberLoginPage> route =
        routeGenerator(settings) as MaterialPageRoute<PhoneNumberLoginPage>;

    expect(route, isA<MaterialPageRoute<PhoneNumberLoginPage>>());
    expect(route.builder(context), isA<PhoneNumberLoginPage>());
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

    final MaterialPageRoute<PhoneNumberLoginPage> route =
        routeGenerator(settings) as MaterialPageRoute<PhoneNumberLoginPage>;

    expect(route, isA<MaterialPageRoute<PhoneNumberLoginPage>>());
    expect(route.builder(context), isA<PhoneNumberLoginPage>());
  });

  test('Test router returns incoming help center page', () {
    const RouteSettings settings = RouteSettings(name: BWRoutes.helpCenter);

    final MaterialPageRoute<HelpCenterPage> route =
        routeGenerator(settings) as MaterialPageRoute<HelpCenterPage>;

    expect(route, isA<MaterialPageRoute<HelpCenterPage>>());
    expect(route.builder(context), isA<HelpCenterPage>());
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

  test('Test router returns incoming  verifySignUpOTP page', () {
    const RouteSettings settings =
        RouteSettings(name: BWRoutes.verifySignUpOTP);
    final MaterialPageRoute<VerifySignUpOTP> route =
        routeGenerator(settings) as MaterialPageRoute<VerifySignUpOTP>;
    expect(route, isA<MaterialPageRoute<VerifySignUpOTP>>());
    expect(route.builder(context), isA<VerifySignUpOTP>());
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

    final MaterialPageRoute<CommunityListView> route =
        routeGenerator(settings) as MaterialPageRoute<CommunityListView>;
    expect(route, isA<MaterialPageRoute<CommunityListView>>());
    expect(route.builder(context), isA<CommunityListView>());
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
}
