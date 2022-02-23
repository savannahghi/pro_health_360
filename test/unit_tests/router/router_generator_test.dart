// Flutter imports:

// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/feed/content_details.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/assessment/pages/contraceptive_assessment_page.dart';
import 'package:myafyahub/presentation/assessment/widgets/successful_assessment_submission_page.dart';
import 'package:myafyahub/presentation/communities/chat_screen/pages/community_chat_screen_page.dart';
import 'package:myafyahub/presentation/communities/community_list_page.dart';
import 'package:myafyahub/presentation/content/pages/content_details_page.dart';
import 'package:myafyahub/presentation/content/pages/feed_page.dart';
import 'package:myafyahub/presentation/content/widgets/document_content_widget.dart';
import 'package:myafyahub/presentation/core/widgets/handle_deep_link.dart';
import 'package:myafyahub/presentation/health_diary/pages/my_health_diary_page.dart';
import 'package:myafyahub/presentation/health_diary/widgets/mood_selection/mood_feedback_page.dart';
import 'package:myafyahub/presentation/health_diary/widgets/successful_diary_entry_page.dart';
import 'package:myafyahub/presentation/home/pages/home_page.dart';
import 'package:myafyahub/presentation/my_health/pages/appointments_page.dart';
import 'package:myafyahub/presentation/my_health/pages/my_health_page.dart';
import 'package:myafyahub/presentation/notifications/notifications_page.dart';
import 'package:myafyahub/presentation/onboarding/forgot_pin/pages/forgot_pin_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/login_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/pin_input_page.dart';
import 'package:myafyahub/presentation/onboarding/set_new_pin/pages/create_new_pin_page.dart';
import 'package:myafyahub/presentation/onboarding/set_nickname/pages/congratulations_page.dart';
import 'package:myafyahub/presentation/onboarding/set_security_questions/answer_security_question_page.dart';
import 'package:myafyahub/presentation/onboarding/set_security_questions/security_questions_page.dart';
import 'package:myafyahub/presentation/onboarding/terms/terms_and_conditions_page.dart';
import 'package:myafyahub/presentation/onboarding/verify_phone/pages/verify_phone_page.dart';
import 'package:myafyahub/presentation/profile/clinic_information/clinic_information_page.dart';
import 'package:myafyahub/presentation/profile/consent/consent_page.dart';
import 'package:myafyahub/presentation/profile/faqs/faq_detail_view_page.dart';
import 'package:myafyahub/presentation/profile/faqs/profile_faqs_page.dart';
import 'package:myafyahub/presentation/profile/feedback/feedback_page.dart';
import 'package:myafyahub/presentation/profile/medical_data/medical_data_page.dart';
import 'package:myafyahub/presentation/profile/pages/edit_information_page.dart';
import 'package:myafyahub/presentation/profile/pages/user_profile_page.dart';
import 'package:myafyahub/presentation/profile/personal_information/personal_information_page.dart';
import 'package:myafyahub/presentation/profile/saved_posts/saved_posts_page.dart';
import 'package:myafyahub/presentation/profile/settings/settings_page.dart';
import 'package:myafyahub/presentation/router/router_generator.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:myafyahub/presentation/violence_assessment/pages/violence_assessment_page.dart';

import '../../mocks.dart';

void main() {
  const Route<dynamic> Function(RouteSettings settings) routeGenerator =
      RouteGenerator.generateRoute;

  final BuildContext context = MockBuildContext();

  test('Test router returns default page', () {
    final MockConnectivityPlatform fakePlatform = MockConnectivityPlatform();
    ConnectivityPlatform.instance = fakePlatform;

    const RouteSettings settings = RouteSettings();

    final MaterialPageRoute<LoginPage> route =
        routeGenerator(settings) as MaterialPageRoute<LoginPage>;

    expect(route, isA<MaterialPageRoute<LoginPage>>());
    expect(route.builder(context), isA<LoginPage>());
  });

  test('Test router returns mood feedback page', () {
    const RouteSettings settings = RouteSettings(
      name: AppRoutes.moodFeedbackPage,
      arguments: MoodType.VERY_HAPPY,
    );

    final MaterialPageRoute<MoodFeedbackPage> route =
        routeGenerator(settings) as MaterialPageRoute<MoodFeedbackPage>;

    expect(route, isA<MaterialPageRoute<MoodFeedbackPage>>());
    expect(route.builder(context), isA<MoodFeedbackPage>());
  });

  test('Test router returns phoneLogin', () {
    const RouteSettings settings = RouteSettings(
      name: AppRoutes.phoneLogin,
      arguments: <String, dynamic>{'test': 'value'},
    );

    final MaterialPageRoute<LoginPage> route =
        routeGenerator(settings) as MaterialPageRoute<LoginPage>;

    expect(route, isA<MaterialPageRoute<LoginPage>>());
    expect(route.builder(context), isA<LoginPage>());
  });

  test('Test router returns create new pin page', () {
    const RouteSettings settings = RouteSettings(
      name: AppRoutes.createPin,
      arguments: '0700111222',
    );

    final MaterialPageRoute<CreateNewPINPage> route =
        routeGenerator(settings) as MaterialPageRoute<CreateNewPINPage>;

    expect(route, isA<MaterialPageRoute<CreateNewPINPage>>());
    expect(route.builder(context), isA<CreateNewPINPage>());
  });

  test('Test router returns  verify otp page', () {
    const RouteSettings settings = RouteSettings(
      name: AppRoutes.verifySignUpOTP,
      arguments: '0700111222',
    );

    final MaterialPageRoute<VerifyPhonePage> route =
        routeGenerator(settings) as MaterialPageRoute<VerifyPhonePage>;

    expect(route, isA<MaterialPageRoute<VerifyPhonePage>>());
    expect(route.builder(context), isA<VerifyPhonePage>());
  });

  test('Test router returns  Document page', () {
    const RouteSettings settings = RouteSettings(
      name: AppRoutes.viewDocumentPage,
      arguments: <String, dynamic>{
        'pdfUrl': 'http://www.africau.edu/images/default/sample.pdf',
        'pdfTitle': 'Sample PDF',
      },
    );

    final MaterialPageRoute<DocumentContentPage> route =
        routeGenerator(settings) as MaterialPageRoute<DocumentContentPage>;

    expect(route, isA<MaterialPageRoute<DocumentContentPage>>());
    expect(route.builder(context), isA<DocumentContentPage>());
  });

  test('Test router returns congratulations page', () {
    const RouteSettings settings = RouteSettings(
      name: AppRoutes.congratulationsPage,
      arguments: <String, dynamic>{'duration': '1 year'},
    );

    final MaterialPageRoute<SetNickNamePage> route =
        routeGenerator(settings) as MaterialPageRoute<SetNickNamePage>;

    expect(route, isA<MaterialPageRoute<SetNickNamePage>>());
    expect(route.builder(context), isA<SetNickNamePage>());
  });

  test('Test router returns Home', () {
    const RouteSettings settings = RouteSettings(
      name: AppRoutes.home,
      arguments: <String, dynamic>{'test': 'value'},
    );

    final MaterialPageRoute<HomePage> route =
        routeGenerator(settings) as MaterialPageRoute<HomePage>;

    expect(route, isA<MaterialPageRoute<HomePage>>());
    expect(route.builder(context), isA<HomePage>());
  });

  test('Test router returns phoneLogin Page', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.phoneLogin);

    final MaterialPageRoute<LoginPage> route =
        routeGenerator(settings) as MaterialPageRoute<LoginPage>;

    expect(route, isA<MaterialPageRoute<LoginPage>>());
    expect(route.builder(context), isA<LoginPage>());
  });

  test('Test router returns incoming  userProfile page', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.userProfile);
    final MaterialPageRoute<UserProfilePage> route =
        routeGenerator(settings) as MaterialPageRoute<UserProfilePage>;
    expect(route, isA<MaterialPageRoute<UserProfilePage>>());
    expect(route.builder(context), isA<UserProfilePage>());
  });

  test('Test router returns security questions page', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.securityQuestionsPage);
    final MaterialPageRoute<SecurityQuestionsPage> route =
        routeGenerator(settings) as MaterialPageRoute<SecurityQuestionsPage>;
    expect(route, isA<MaterialPageRoute<SecurityQuestionsPage>>());
    expect(route.builder(context), isA<SecurityQuestionsPage>());
  });

  test('Test router returns answer security question page', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.answerSecurityQuestionPage);
    final MaterialPageRoute<AnswerSecurityQuestionPage> route =
        routeGenerator(settings)
            as MaterialPageRoute<AnswerSecurityQuestionPage>;
    expect(route, isA<MaterialPageRoute<AnswerSecurityQuestionPage>>());
    expect(route.builder(context), isA<AnswerSecurityQuestionPage>());
  });

  test('Test router returns TermsAndConditionsPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.termsAndConditions);
    final MaterialPageRoute<TermsAndConditionsPage> route =
        routeGenerator(settings) as MaterialPageRoute<TermsAndConditionsPage>;
    expect(route, isA<MaterialPageRoute<TermsAndConditionsPage>>());
    expect(route.builder(context), isA<TermsAndConditionsPage>());
  });

  test('Test router returns CommunityListView', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.communityListView);

    final MaterialPageRoute<CommunityListViewPage> route =
        routeGenerator(settings) as MaterialPageRoute<CommunityListViewPage>;
    expect(route, isA<MaterialPageRoute<CommunityListViewPage>>());
    expect(route.builder(context), isA<CommunityListViewPage>());
  });

  test('Test router returns CommunityChatScreenPage', () {
    const RouteSettings settings = RouteSettings(
      name: AppRoutes.communityChatScreenPage,
      arguments: CommunityListItem(
        title: 'title',
        message: 'message',
        lastMessageDate: 'lastMessageDate',
      ),
    );

    final MaterialPageRoute<CommunityChatScreenPage> route =
        routeGenerator(settings) as MaterialPageRoute<CommunityChatScreenPage>;
    expect(route, isA<MaterialPageRoute<CommunityChatScreenPage>>());
    expect(route.builder(context), isA<CommunityChatScreenPage>());
  });

  test('Test router returns  FeedPage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.feedPage);

    final MaterialPageRoute<FeedPage> route =
        routeGenerator(settings) as MaterialPageRoute<FeedPage>;
    expect(route, isA<MaterialPageRoute<FeedPage>>());
    expect(route.builder(context), isA<FeedPage>());
  });

  test('Test router returns ConsentPage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.consent);

    final MaterialPageRoute<ConsentPage> route =
        routeGenerator(settings) as MaterialPageRoute<ConsentPage>;
    expect(route, isA<MaterialPageRoute<ConsentPage>>());
    expect(route.builder(context), isA<ConsentPage>());
  });

  test('Test router returns PersonalInformation Page', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.personalInfo);

    final MaterialPageRoute<PersonalInformationPage> route =
        routeGenerator(settings) as MaterialPageRoute<PersonalInformationPage>;
    expect(route, isA<MaterialPageRoute<PersonalInformationPage>>());
    expect(route.builder(context), isA<PersonalInformationPage>());
  });

  test('Test router returns MedicalDataPage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.medicalData);

    final MaterialPageRoute<MedicalDataPage> route =
        routeGenerator(settings) as MaterialPageRoute<MedicalDataPage>;
    expect(route, isA<MaterialPageRoute<MedicalDataPage>>());
    expect(route.builder(context), isA<MedicalDataPage>());
  });

  test('Test router returns SavedPostsPage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.savedPosts);

    final MaterialPageRoute<SavedPostPage> route =
        routeGenerator(settings) as MaterialPageRoute<SavedPostPage>;
    expect(route, isA<MaterialPageRoute<SavedPostPage>>());
    expect(route.builder(context), isA<SavedPostPage>());
  });

  test('Test router returns AppointmentsPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.appointmentsPage);

    final MaterialPageRoute<AppointmentsPage> route =
        routeGenerator(settings) as MaterialPageRoute<AppointmentsPage>;
    expect(route, isA<MaterialPageRoute<AppointmentsPage>>());
    expect(route.builder(context), isA<AppointmentsPage>());
  });

  test('Test router returns NotificationsPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.notificationsPage);

    final MaterialPageRoute<NotificationsPage> route =
        routeGenerator(settings) as MaterialPageRoute<NotificationsPage>;
    expect(route, isA<MaterialPageRoute<NotificationsPage>>());
    expect(route.builder(context), isA<NotificationsPage>());
  });

  test('Test router returns MyHealthPage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.myHealthPage);

    final MaterialPageRoute<MyHealthPage> route =
        routeGenerator(settings) as MaterialPageRoute<MyHealthPage>;
    expect(route, isA<MaterialPageRoute<MyHealthPage>>());
    expect(route.builder(context), isA<MyHealthPage>());
  });
  test('Test router returns MyHealthDiaryPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.myHealthDiaryPage);

    final MaterialPageRoute<MyHealthDiaryPage> route =
        routeGenerator(settings) as MaterialPageRoute<MyHealthDiaryPage>;
    expect(route, isA<MaterialPageRoute<MyHealthDiaryPage>>());
    expect(route.builder(context), isA<MyHealthDiaryPage>());
  });
  test('Test router returns UserProfilePage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.userProfilePage);
    final MaterialPageRoute<UserProfilePage> route =
        routeGenerator(settings) as MaterialPageRoute<UserProfilePage>;
    expect(route, isA<MaterialPageRoute<UserProfilePage>>());
    expect(route.builder(context), isA<UserProfilePage>());
  });

  test('Test router returns ProfileFaqsPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.profileFaqsPage);
    final MaterialPageRoute<ProfileFaqsPage> route =
        routeGenerator(settings) as MaterialPageRoute<ProfileFaqsPage>;
    expect(route, isA<MaterialPageRoute<ProfileFaqsPage>>());
    expect(route.builder(context), isA<ProfileFaqsPage>());
  });

  test('Test router returns FAQDetailViewPage', () {
    final FAQContent payload = FAQContent.fromJson(<String, dynamic>{
      'title': 'title',
      'body': 'body',
    });

    final RouteSettings settings =
        RouteSettings(name: AppRoutes.faqDetailViewPage, arguments: payload);

    final MaterialPageRoute<FAQDetailViewPage> route =
        routeGenerator(settings) as MaterialPageRoute<FAQDetailViewPage>;

    expect(route, isA<MaterialPageRoute<FAQDetailViewPage>>());
    expect(route.builder(context), isA<FAQDetailViewPage>());
  });

  test('Test router returns ClinicInformationPage', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.clinicInformationPage);
    final MaterialPageRoute<ClinicInformationPage> route =
        routeGenerator(settings) as MaterialPageRoute<ClinicInformationPage>;
    expect(route, isA<MaterialPageRoute<ClinicInformationPage>>());
    expect(route.builder(context), isA<ClinicInformationPage>());
  });

  test('Test router returns SettingsPage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.settingsPage);
    final MaterialPageRoute<SettingsPage> route =
        routeGenerator(settings) as MaterialPageRoute<SettingsPage>;
    expect(route, isA<MaterialPageRoute<SettingsPage>>());
    expect(route.builder(context), isA<SettingsPage>());
  });

  test('Test router returns FeedbackPage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.feedbackPage);
    final MaterialPageRoute<FeedbackPage> route =
        routeGenerator(settings) as MaterialPageRoute<FeedbackPage>;
    expect(route, isA<MaterialPageRoute<FeedbackPage>>());
    expect(route.builder(context), isA<FeedbackPage>());
  });

  test('Test router returns PINInputPage', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.pinInputPage);
    final MaterialPageRoute<PINInputPage> route =
        routeGenerator(settings) as MaterialPageRoute<PINInputPage>;
    expect(route, isA<MaterialPageRoute<PINInputPage>>());
    expect(route.builder(context), isA<PINInputPage>());
  });

  test('Test router returns ContentDetailPage', () {
    final RouteSettings settings = RouteSettings(
      name: AppRoutes.contentDetailPage,
      arguments: ContentDetails(content: mockContent),
    );
    final MaterialPageRoute<ContentDetailPage> route =
        routeGenerator(settings) as MaterialPageRoute<ContentDetailPage>;
    expect(route, isA<MaterialPageRoute<ContentDetailPage>>());
    expect(route.builder(context), isA<ContentDetailPage>());
  });

  test('Test router returns ForgotPINPage', () {
    const RouteSettings settings = RouteSettings(
      name: AppRoutes.forgotPINPage,
      arguments: <String, dynamic>{'test': 'value'},
    );
    final MaterialPageRoute<ForgotPINPage> route =
        routeGenerator(settings) as MaterialPageRoute<ForgotPINPage>;
    expect(route, isA<MaterialPageRoute<ForgotPINPage>>());
    expect(route.builder(context), isA<ForgotPINPage>());
  });

  test('Test router returns EditInformationPage', () {
    final RouteSettings settings = RouteSettings(
      name: AppRoutes.editInformationPage,
      arguments: <String, dynamic>{
        'editInformationItem': nickNameEditInfo('Test')
      },
    );
    final MaterialPageRoute<EditInformationPage> route =
        routeGenerator(settings) as MaterialPageRoute<EditInformationPage>;
    expect(route, isA<MaterialPageRoute<EditInformationPage>>());
    expect(route.builder(context), isA<EditInformationPage>());
  });

  test('Test router returns deep link page', () {
    const RouteSettings settings = RouteSettings(name: AppRoutes.deepLink);

    final MaterialPageRoute<HandleDeepLink> route =
        routeGenerator(settings) as MaterialPageRoute<HandleDeepLink>;

    expect(route, isA<MaterialPageRoute<HandleDeepLink>>());
    expect(route.builder(context), isA<HandleDeepLink>());
  });

  test('Test router returns Successful entry page', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.successfulEntryPage);

    final MaterialPageRoute<SuccessfulDiaryEntryPage> route =
        routeGenerator(settings) as MaterialPageRoute<SuccessfulDiaryEntryPage>;

    expect(route, isA<MaterialPageRoute<SuccessfulDiaryEntryPage>>());
    expect(route.builder(context), isA<SuccessfulDiaryEntryPage>());
  });

  test('Test router returns violence assessment page', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.violenceAssessmentPage);

    final MaterialPageRoute<ViolenceAssessmentPage> route =
        routeGenerator(settings) as MaterialPageRoute<ViolenceAssessmentPage>;

    expect(route, isA<MaterialPageRoute<ViolenceAssessmentPage>>());
    expect(route.builder(context), isA<ViolenceAssessmentPage>());
  });

  test('Test router returns contraceptive assessment page', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.contraceptiveAssessmentPage);

    final MaterialPageRoute<ContraceptiveAssessmentPage> route =
        routeGenerator(settings)
            as MaterialPageRoute<ContraceptiveAssessmentPage>;

    expect(route, isA<MaterialPageRoute<ContraceptiveAssessmentPage>>());
    expect(route.builder(context), isA<ContraceptiveAssessmentPage>());
  });

  test('Test router returns Successful assessment submission page', () {
    const RouteSettings settings =
        RouteSettings(name: AppRoutes.successfulAssessmentSubmissionPage);

    final MaterialPageRoute<SuccessfulAssessmentSubmissionPage> route =
        routeGenerator(settings)
            as MaterialPageRoute<SuccessfulAssessmentSubmissionPage>;

    expect(route, isA<MaterialPageRoute<SuccessfulAssessmentSubmissionPage>>());
    expect(route.builder(context), isA<SuccessfulAssessmentSubmissionPage>());
  });
}
