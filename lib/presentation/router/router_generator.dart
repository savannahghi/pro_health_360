// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/community_list_item.dart';
import 'package:user_profile/term_and_conditions.dart' as webview;

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/faqs/faq_content.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/entities/profile/edit_information_item.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/communities/chat_screen/pages/community_chat_screen_page.dart';
import 'package:myafyahub/presentation/communities/community_list_page.dart';
import 'package:myafyahub/presentation/content/pages/content_details_page.dart';
import 'package:myafyahub/presentation/content/pages/feed_page.dart';
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
import 'package:myafyahub/presentation/profile/saved_posts/saved_posts.dart';
import 'package:myafyahub/presentation/profile/settings/settings_page.dart';
import 'package:myafyahub/presentation/router/routes.dart';

/// The router generator for the app. The arrangement in this config must match that
/// in the routes.dart file
class RouteGenerator {
  /// gets the current route based on the [RouteSettings]
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;

    switch (settings.name) {
      case BWRoutes.deepLink:
        return MaterialPageRoute<HandleDeepLink>(
          builder: (BuildContext context) => const HandleDeepLink(),
        );

      case BWRoutes.createPin:
        return MaterialPageRoute<CreateNewPINPage>(
          builder: (_) => CreateNewPINPage(),
        );

      case BWRoutes.verifySignUpOTP:
        return MaterialPageRoute<VerifyPhonePage>(
          builder: (_) => VerifyPhonePage(),
        );

      case BWRoutes.congratulationsPage:
        return MaterialPageRoute<SetNickNamePage>(
          builder: (_) => SetNickNamePage(),
        );

      case BWRoutes.termsAndConditions:
        return MaterialPageRoute<TermsAndConditionsPage>(
          builder: (_) => const TermsAndConditionsPage(),
        );

      case BWRoutes.phoneLogin:
        return MaterialPageRoute<LoginPage>(
          builder: (_) => LoginPage(),
        );

      // the homepage route config
      case BWRoutes.home:
        return MaterialPageRoute<HomePage>(builder: (_) => HomePage());

      case BWRoutes.moodFeedbackPage:
        return MaterialPageRoute<MoodFeedbackPage>(
          builder: (_) => MoodFeedbackPage(moodType: args as MoodType),
        );

      case BWRoutes.successfulEntryPage:
        return MaterialPageRoute<SuccessfulDiaryEntryPage>(
          builder: (_) => const SuccessfulDiaryEntryPage(),
        );

      case BWRoutes.editInformationPage:
        final EditInformationItem editInformationItem =
            args['editInformationItem'] as EditInformationItem;

        Function submitFunction;

        ///Sanity checks
        if (args['onSubmit'] != null) {
          submitFunction = args['onSubmit'] as Function;
        } else {
          submitFunction = (EditInformationItem editInformationItem) {};
        }

        return MaterialPageRoute<EditInformationPage>(
          builder: (_) => EditInformationPage(
            editInformationItem: editInformationItem,
            onSubmit: submitFunction,
          ),
        );

      case BWRoutes.userProfile:
        return MaterialPageRoute<UserProfilePage>(
          builder: (_) => UserProfilePage(),
        );

      case BWRoutes.profileFaqsPage:
        return MaterialPageRoute<ProfileFaqsPage>(
          builder: (_) => const ProfileFaqsPage(),
        );

      case BWRoutes.webView:
        return MaterialPageRoute<webview.TermsAndConditionsPage>(
          builder: (_) => const webview.TermsAndConditionsPage(),
        );

      case BWRoutes.securityQuestionsPage:
        return MaterialPageRoute<SecurityQuestionsPage>(
          builder: (_) => const SecurityQuestionsPage(),
        );

      case BWRoutes.answerSecurityQuestionPage:
        return MaterialPageRoute<AnswerSecurityQuestionPage>(
          builder: (_) => const AnswerSecurityQuestionPage(),
        );

      case BWRoutes.communityListView:
        return MaterialPageRoute<CommunityListViewPage>(
          builder: (_) => const CommunityListViewPage(),
        );

      case BWRoutes.communityChatScreenPage:
        final CommunityListItem chatDetailArguments = args as CommunityListItem;
        return MaterialPageRoute<CommunityChatScreenPage>(
          builder: (_) => CommunityChatScreenPage(
            communityChatData: chatDetailArguments,
          ),
        );

      case BWRoutes.consent:
        return MaterialPageRoute<ConsentPage>(
          builder: (_) => const ConsentPage(),
        );

      case BWRoutes.personalInfo:
        return MaterialPageRoute<PersonalInformationPage>(
          builder: (_) => PersonalInformationPage(),
        );

      case BWRoutes.medicalData:
        return MaterialPageRoute<MedicalDataPage>(
          builder: (_) => const MedicalDataPage(),
        );

      case BWRoutes.savedPosts:
        return MaterialPageRoute<SavedPostPage>(
          builder: (_) => SavedPostPage(),
        );

      case BWRoutes.feedPage:
        return MaterialPageRoute<FeedPage>(
          builder: (_) => const FeedPage(),
        );

      case BWRoutes.notificationsPage:
        return MaterialPageRoute<NotificationsPage>(
          builder: (_) => NotificationsPage(
            notifications: notifications,
          ),
        );

      case BWRoutes.appointmentsPage:
        return MaterialPageRoute<AppointmentsPage>(
          builder: (_) => AppointmentsPage(),
        );

      case BWRoutes.myHealthPage:
        return MaterialPageRoute<MyHealthPage>(
          builder: (_) => MyHealthPage(),
        );

      case BWRoutes.myHealthDiaryPage:
        return MaterialPageRoute<MyHealthDiaryPage>(
          builder: (_) => MyHealthDiaryPage(),
        );

      case BWRoutes.userProfilePage:
        return MaterialPageRoute<UserProfilePage>(
          builder: (_) => UserProfilePage(),
        );

      case BWRoutes.clinicInformationPage:
        return MaterialPageRoute<ClinicInformationPage>(
          builder: (_) => ClinicInformationPage(),
        );

      case BWRoutes.settingsPage:
        return MaterialPageRoute<SettingsPage>(
          builder: (_) => SettingsPage(),
        );

      case BWRoutes.feedbackPage:
        return MaterialPageRoute<FeedbackPage>(
          builder: (_) => const FeedbackPage(),
        );

      case BWRoutes.pinInputPage:
        return MaterialPageRoute<PINInputPage>(
          builder: (_) => PINInputPage(),
        );

      case BWRoutes.contentDetailPage:
        return MaterialPageRoute<ContentDetailPage>(
          builder: (_) => ContentDetailPage(contentDetails: args as Content),
        );

      case BWRoutes.faqDetailViewPage:
        return MaterialPageRoute<FAQDetailViewPage>(
          builder: (_) => FAQDetailViewPage(payload: args as FAQContent),
        );

      case BWRoutes.forgotPINPage:
        return MaterialPageRoute<ForgotPINPage>(
          builder: (_) => const ForgotPINPage(),
        );

      default:
        return MaterialPageRoute<LoginPage>(builder: (_) => LoginPage());
    }
  }
}
