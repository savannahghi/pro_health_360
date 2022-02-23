// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/feed/content_details.dart';
import 'package:myafyahub/domain/core/entities/feed/gallery_image.dart';
import 'package:myafyahub/domain/core/entities/profile/edit_information_item.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/assessment/pages/contraceptive_assessment_page.dart';
import 'package:myafyahub/presentation/assessment/pages/tuberculosis_assessment_page.dart';
import 'package:myafyahub/presentation/assessment/widgets/successful_assessment_submission_page.dart';
import 'package:myafyahub/presentation/communities/chat_screen/pages/community_chat_screen_page.dart';
import 'package:myafyahub/presentation/communities/community_list_page.dart';
import 'package:myafyahub/presentation/content/pages/content_details_page.dart';
import 'package:myafyahub/presentation/content/pages/feed_page.dart';
import 'package:myafyahub/presentation/content/pages/gallery_images_page.dart';
import 'package:myafyahub/presentation/content/widgets/document_content_widget.dart';
import 'package:myafyahub/presentation/core/widgets/handle_deep_link.dart';
import 'package:myafyahub/presentation/health_assessment/pages/health_assessment_page.dart';
import 'package:myafyahub/presentation/health_diary/pages/my_health_diary_page.dart';
import 'package:myafyahub/presentation/health_diary/screening_tools/screening_tools_list_page.dart';
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
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:myafyahub/presentation/violence_assessment/pages/violence_assessment_page.dart';

/// The router generator for the app. The arrangement in this config must match that
/// in the routes.dart file
class RouteGenerator {
  /// gets the current route based on the [RouteSettings]
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.deepLink:
        return MaterialPageRoute<HandleDeepLink>(
          builder: (BuildContext context) => const HandleDeepLink(),
        );

      case AppRoutes.createPin:
        return MaterialPageRoute<CreateNewPINPage>(
          builder: (_) => CreateNewPINPage(phoneNumber: args as String),
        );

      case AppRoutes.verifySignUpOTP:
        return MaterialPageRoute<VerifyPhonePage>(
          builder: (_) => VerifyPhonePage(phoneNumber: args as String),
        );

      case AppRoutes.congratulationsPage:
        return MaterialPageRoute<SetNickNamePage>(
          builder: (_) => SetNickNamePage(),
        );

      case AppRoutes.termsAndConditions:
        return MaterialPageRoute<TermsAndConditionsPage>(
          builder: (_) => const TermsAndConditionsPage(),
        );

      case AppRoutes.phoneLogin:
        return MaterialPageRoute<LoginPage>(
          builder: (_) => LoginPage(),
        );

      // the homepage route config
      case AppRoutes.home:
        return MaterialPageRoute<HomePage>(
          builder: (_) => HomePage(),
        );

      case AppRoutes.moodFeedbackPage:
        return MaterialPageRoute<MoodFeedbackPage>(
          builder: (_) => MoodFeedbackPage(moodType: args as MoodType),
        );

      case AppRoutes.successfulEntryPage:
        return MaterialPageRoute<SuccessfulDiaryEntryPage>(
          builder: (_) => const SuccessfulDiaryEntryPage(),
        );

      case AppRoutes.editInformationPage:
        final EditInformationItem editInformationItem =
            args['editInformationItem'] as EditInformationItem;

        void Function(EditInformationItem editInformationItem) submitFunction;

        ///Sanity checks
        if (args['onSubmit'] != null) {
          submitFunction = args['onSubmit'] as void Function(
            EditInformationItem editInformationItem,
          );
        } else {
          submitFunction = (EditInformationItem editInformationItem) {};
        }

        return MaterialPageRoute<EditInformationPage>(
          builder: (_) => EditInformationPage(
            editInformationItem: editInformationItem,
            onSubmit: submitFunction,
          ),
        );

      case AppRoutes.userProfile:
        return MaterialPageRoute<UserProfilePage>(
          builder: (_) => UserProfilePage(),
        );

      case AppRoutes.profileFaqsPage:
        return MaterialPageRoute<ProfileFaqsPage>(
          builder: (_) => const ProfileFaqsPage(),
        );

      case AppRoutes.securityQuestionsPage:
        return MaterialPageRoute<SecurityQuestionsPage>(
          builder: (_) => const SecurityQuestionsPage(),
        );

      case AppRoutes.answerSecurityQuestionPage:
        return MaterialPageRoute<AnswerSecurityQuestionPage>(
          builder: (_) => const AnswerSecurityQuestionPage(),
        );

      case AppRoutes.communityListView:
        return MaterialPageRoute<CommunityListViewPage>(
          builder: (_) => const CommunityListViewPage(),
        );

      case AppRoutes.communityChatScreenPage:
        final CommunityListItem chatDetailArguments = args as CommunityListItem;
        return MaterialPageRoute<CommunityChatScreenPage>(
          builder: (_) => CommunityChatScreenPage(
            communityChatData: chatDetailArguments,
          ),
        );

      case AppRoutes.consent:
        return MaterialPageRoute<ConsentPage>(
          builder: (_) => const ConsentPage(),
        );

      case AppRoutes.viewDocumentPage:
        final String pdfTitle = args['pdfTitle'] as String;
        final String pdfUrl = args['pdfUrl'] as String;

        return MaterialPageRoute<DocumentContentPage>(
          builder: (_) => DocumentContentPage(
            pdfTitle: pdfTitle,
            pdfUrl: pdfUrl,
          ),
        );

      case AppRoutes.personalInfo:
        return MaterialPageRoute<PersonalInformationPage>(
          builder: (_) => PersonalInformationPage(),
        );

      case AppRoutes.medicalData:
        return MaterialPageRoute<MedicalDataPage>(
          builder: (_) => const MedicalDataPage(),
        );

      case AppRoutes.savedPosts:
        return MaterialPageRoute<SavedPostPage>(
          builder: (_) => SavedPostPage(),
        );

      case AppRoutes.feedPage:
        return MaterialPageRoute<FeedPage>(
          builder: (_) => const FeedPage(),
        );

      case AppRoutes.notificationsPage:
        return MaterialPageRoute<NotificationsPage>(
          builder: (_) => NotificationsPage(
            notifications: notifications,
          ),
        );

      case AppRoutes.appointmentsPage:
        return MaterialPageRoute<AppointmentsPage>(
          builder: (_) => AppointmentsPage(),
        );

      case AppRoutes.myHealthPage:
        return MaterialPageRoute<MyHealthPage>(
          builder: (_) => MyHealthPage(),
        );

      case AppRoutes.myHealthDiaryPage:
        return MaterialPageRoute<MyHealthDiaryPage>(
          builder: (_) => MyHealthDiaryPage(),
        );

      case AppRoutes.userProfilePage:
        return MaterialPageRoute<UserProfilePage>(
          builder: (_) => UserProfilePage(),
        );

      case AppRoutes.clinicInformationPage:
        return MaterialPageRoute<ClinicInformationPage>(
          builder: (_) => ClinicInformationPage(),
        );

      case AppRoutes.settingsPage:
        return MaterialPageRoute<SettingsPage>(
          builder: (_) => SettingsPage(),
        );

      case AppRoutes.feedbackPage:
        return MaterialPageRoute<FeedbackPage>(
          builder: (_) => const FeedbackPage(),
        );

      case AppRoutes.pinInputPage:
        return MaterialPageRoute<PINInputPage>(
          builder: (_) => PINInputPage(),
        );

      case AppRoutes.contentDetailPage:
        return MaterialPageRoute<ContentDetailPage>(
          builder: (_) => ContentDetailPage(
            payload: args as ContentDetails,
          ),
        );

      case AppRoutes.galleryImagesPage:
        return MaterialPageRoute<ContentDetailPage>(
          builder: (_) => GalleryImagesPage(
            images: args as List<GalleryImage>,
          ),
        );

      case AppRoutes.faqDetailViewPage:
        return MaterialPageRoute<FAQDetailViewPage>(
          builder: (_) => FAQDetailViewPage(payload: args as FAQContent),
        );

      case AppRoutes.forgotPINPage:
        return MaterialPageRoute<ForgotPINPage>(
          builder: (_) => const ForgotPINPage(),
        );

      case AppRoutes.screeningToolsListPage:
        return MaterialPageRoute<ScreeningToolsListPage>(
          builder: (_) => const ScreeningToolsListPage(),
        );

      case AppRoutes.violenceAssessmentPage:
        return MaterialPageRoute<ViolenceAssessmentPage>(
          builder: (_) => const ViolenceAssessmentPage(),
        );

      case AppRoutes.contraceptiveAssessmentPage:
        return MaterialPageRoute<ContraceptiveAssessmentPage>(
          builder: (_) => const ContraceptiveAssessmentPage(),
        );

      case AppRoutes.tuberculosisAssessmentPage:
        return MaterialPageRoute<TuberculosisAssessmentPage>(
          builder: (_) => const TuberculosisAssessmentPage(),
        );

      case AppRoutes.healthAssessmentPage:
        return MaterialPageRoute<HealthAssessmentPage>(
          builder: (_) => const HealthAssessmentPage(),
        );

      case AppRoutes.successfulAssessmentSubmissionPage:
        return MaterialPageRoute<SuccessfulAssessmentSubmissionPage>(
          builder: (_) => const SuccessfulAssessmentSubmissionPage(),
        );

      default:
        return MaterialPageRoute<LoginPage>(builder: (_) => LoginPage());
    }
  }
}
