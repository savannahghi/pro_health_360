// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/entities/profile/edit_information_item.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/assessment/pages/alcohol_substance_use_page.dart';
import 'package:myafyahub/presentation/assessment/pages/contraceptive_assessment_page.dart';
import 'package:myafyahub/presentation/assessment/pages/tuberculosis_assessment_page.dart';
import 'package:myafyahub/presentation/assessment/widgets/successful_assessment_submission_page.dart';
import 'package:myafyahub/presentation/communities/community_list_page.dart';
import 'package:myafyahub/presentation/communities/invited_groups/pages/accept_group_invites_page.dart';
import 'package:myafyahub/presentation/communities/invited_groups/pages/invited_groups_page.dart';
import 'package:myafyahub/presentation/content/pages/content_details_page.dart';
import 'package:myafyahub/presentation/content/pages/feed_page.dart';
import 'package:myafyahub/presentation/content/pages/gallery_images_page.dart';
import 'package:myafyahub/presentation/content/widgets/document_content_widget.dart';
import 'package:myafyahub/presentation/content/widgets/successful_feedback_submission.dart';
import 'package:myafyahub/presentation/core/widgets/handle_deep_link.dart';
import 'package:myafyahub/presentation/health_diary/pages/my_health_diary_page.dart';
import 'package:myafyahub/presentation/health_diary/widgets/mood_selection/mood_feedback_page.dart';
import 'package:myafyahub/presentation/health_diary/widgets/successful_diary_entry_page.dart';
import 'package:myafyahub/presentation/home/pages/home_page.dart';
import 'package:myafyahub/presentation/my_health/pages/appointments_page.dart';
import 'package:myafyahub/presentation/my_health/pages/my_health_page.dart';
import 'package:myafyahub/presentation/notifications/notifications_page.dart';
import 'package:myafyahub/presentation/onboarding/consent_confirmation/consent_confirmation_page.dart';
import 'package:myafyahub/presentation/onboarding/forgot_pin/pages/forgot_pin_page.dart';
import 'package:myafyahub/presentation/onboarding/forgot_pin/pages/pending_pin_request_page.dart';
import 'package:myafyahub/presentation/onboarding/forgot_pin/pages/pin_request_sent_page.dart';
import 'package:myafyahub/presentation/onboarding/forgot_pin/pages/verify_security_questions_help_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/login_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/pin_input_page.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/login_counter_page.dart';
import 'package:myafyahub/presentation/onboarding/pin_expired/pages/pin_expired_page.dart';
import 'package:myafyahub/presentation/onboarding/set_new_pin/pages/create_new_pin_page.dart';
import 'package:myafyahub/presentation/onboarding/set_nickname/pages/set_nickname_page.dart';
import 'package:myafyahub/presentation/onboarding/set_security_questions/answer_security_question_page.dart';
import 'package:myafyahub/presentation/onboarding/set_security_questions/security_questions_page.dart';
import 'package:myafyahub/presentation/onboarding/terms/terms_and_conditions_page.dart';
import 'package:myafyahub/presentation/onboarding/verify_phone/pages/verify_phone_page.dart';
import 'package:myafyahub/presentation/profile/clinic_information/clinic_information_page.dart';
import 'package:myafyahub/presentation/profile/consent/consent_page.dart';
import 'package:myafyahub/presentation/profile/faqs/profile_faqs_page.dart';
import 'package:myafyahub/presentation/profile/feedback/feedback_page.dart';
import 'package:myafyahub/presentation/profile/health_timeline/my_health_timeline_container.dart';
import 'package:myafyahub/presentation/profile/medical_data/pages/medical_data_page.dart';
import 'package:myafyahub/presentation/profile/pages/edit_information_page.dart';
import 'package:myafyahub/presentation/profile/pages/user_profile_page.dart';
import 'package:myafyahub/presentation/profile/personal_information/personal_information_page.dart';
import 'package:myafyahub/presentation/profile/saved_posts/saved_posts_page.dart';
import 'package:myafyahub/presentation/profile/settings/settings_page.dart';
import 'package:myafyahub/presentation/resume_with_pin/resume_pin_connector.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:myafyahub/presentation/surveys/custom_webview_page.dart';
import 'package:myafyahub/presentation/surveys/surveys_page.dart';
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
          builder: (_) => CreateNewPINPage(),
        );

      case AppRoutes.verifySignUpOTP:
        return MaterialPageRoute<VerifyPhonePage>(
          builder: (_) => const VerifyPhonePage(),
        );

      case AppRoutes.congratulationsPage:
        return MaterialPageRoute<SetNickNamePage>(
          builder: (_) => SetNickNamePage(),
        );

      case AppRoutes.termsAndConditions:
        return MaterialPageRoute<TermsAndConditionsPage>(
          builder: (_) => TermsAndConditionsPage(
            shouldPop: args != null ? args as bool : null,
          ),
        );

      case AppRoutes.phoneLogin:
        return MaterialPageRoute<LoginPage>(
          builder: (_) => const LoginPage(),
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
          builder: (_) => SuccessfulDiaryEntryPage(
            diaryEntrySuccessType: args as DiaryEntrySuccessType,
          ),
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
          builder: (_) => ProfileFaqsPage(),
        );

      case AppRoutes.securityQuestionsPage:
        return MaterialPageRoute<SecurityQuestionsPage>(
          builder: (_) => const SecurityQuestionsPage(),
        );

      case AppRoutes.answerSecurityQuestionPage:
        return MaterialPageRoute<AnswerSecurityQuestionPage>(
          builder: (_) => const AnswerSecurityQuestionPage(),
        );

      case AppRoutes.communityListPage:
        return MaterialPageRoute<CommunityListViewPage>(
          builder: (_) => const CommunityListViewPage(),
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
          builder: (_) => const SavedPostPage(),
        );

      case AppRoutes.feedPage:
        return MaterialPageRoute<FeedPage>(
          builder: (_) => const FeedPage(),
        );

      case AppRoutes.notificationsPage:
        return MaterialPageRoute<NotificationsPage>(
          builder: (_) => NotificationsPage(
            bottomNavIndex: args as int,
          ),
        );

      case AppRoutes.appointmentsPage:
        return MaterialPageRoute<AppointmentsPage>(
          builder: (_) => AppointmentsPage(),
        );

      case AppRoutes.myHealthPage:
        return MaterialPageRoute<MyHealthPage>(
          builder: (_) => const MyHealthPage(),
        );

      case AppRoutes.myHealthDiaryPage:
        return MaterialPageRoute<MyHealthDiaryPage>(
          builder: (_) => const MyHealthDiaryPage(),
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

      case AppRoutes.forgotPINPage:
        return MaterialPageRoute<ForgotPINPage>(
          builder: (_) => const ForgotPINPage(),
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

      case AppRoutes.alcoholSubstanceUsePage:
        return MaterialPageRoute<AlcoholSubstanceUsePage>(
          builder: (_) => const AlcoholSubstanceUsePage(),
        );

      case AppRoutes.successfulAssessmentSubmissionPage:
        return MaterialPageRoute<SuccessfulAssessmentSubmissionPage>(
          builder: (_) => const SuccessfulAssessmentSubmissionPage(),
        );

      case AppRoutes.successfulFeedbackSubmissionPage:
        return MaterialPageRoute<SuccessfulFeedbackSubmissionPage>(
          builder: (_) => const SuccessfulFeedbackSubmissionPage(),
        );

      case AppRoutes.groupInvitesPage:
        return MaterialPageRoute<InvitedGroupsPage>(
          builder: (_) => const InvitedGroupsPage(),
        );

      case AppRoutes.acceptGroupInvitesPage:
        final String groupId = args['groupId'] as String;
        final String groupName = args['groupName'] as String;
        final int numberOfMembers = args['numberOfMembers'] as int;

        return MaterialPageRoute<AcceptGroupInvitesPage>(
          builder: (_) => AcceptGroupInvitesPage(
            groupId: groupId,
            groupName: groupName,
            numberOfMembers: numberOfMembers,
          ),
        );

      case AppRoutes.pinRequestSentPage:
        return MaterialPageRoute<PinRequestSentPage>(
          builder: (_) => const PinRequestSentPage(),
        );

      case AppRoutes.resumeWithPin:
        return MaterialPageRoute<ResumePinConnector>(
          builder: (_) => const ResumePinConnector(),
        );

      case AppRoutes.consentConfirmationPage:
        return MaterialPageRoute<ConsentConfirmationPage>(
          builder: (_) => const ConsentConfirmationPage(),
        );

      case AppRoutes.pendingPINRequestPage:
        return MaterialPageRoute<PendingPINRequestPage>(
          builder: (_) => const PendingPINRequestPage(),
        );

      case AppRoutes.verifySecurityQuestionsHelpPage:
        return MaterialPageRoute<VerifySecurityQuestionsHelpPage>(
          builder: (_) => VerifySecurityQuestionsHelpPage(),
        );

      case AppRoutes.loginCounterPage:
        return MaterialPageRoute<LoginCounterPage>(
          builder: (_) => LoginCounterPage(
            retryTime: args as int?,
          ),
        );

      case AppRoutes.pinExpiredPage:
        return MaterialPageRoute<PinExpiredPage>(
          builder: (_) => const PinExpiredPage(),
        );

      case AppRoutes.myHealthTimeline:
        return MaterialPageRoute<MyHealthTimelineContainer>(
          builder: (_) => const MyHealthTimelineContainer(),
        );

      case AppRoutes.surveysPage:
        return MaterialPageRoute<SurveysPage>(
          builder: (_) => const SurveysPage(),
        );

      case AppRoutes.customWebviewPage:
        return MaterialPageRoute<CustomWebView>(
          builder: (_) => CustomWebView(
            appBarTitle: args['appBarTitle'] as String,
            url: args['url'] as String,
          ),
        );

      default:
        return MaterialPageRoute<LoginPage>(builder: (_) => const LoginPage());
    }
  }
}
