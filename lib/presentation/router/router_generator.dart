// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/library/library_content_item.dart';
import 'package:myafyahub/presentation/community/chat_screen/pages/community_chat_screen_page.dart';
import 'package:myafyahub/presentation/community/community_list_page.dart';
import 'package:myafyahub/presentation/profile/pages/saved_posts.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:myafyahub/presentation/engagement/home/pages/home_page.dart';
import 'package:myafyahub/presentation/engagement/library/library.dart';
import 'package:myafyahub/presentation/engagement/library/library_content.dart';
import 'package:myafyahub/presentation/feed/pages/my_afya_hub_feed_page.dart';
import 'package:myafyahub/presentation/my_health/pages/appointments_page.dart';
import 'package:myafyahub/presentation/my_health/pages/my_health_diary_page.dart';
import 'package:myafyahub/presentation/my_health/pages/my_health_page.dart';
import 'package:myafyahub/presentation/notifications/notifications_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/basic_details_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/congratulations_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/create_new_pin_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/request_pin_reset_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/resume_with_pin_page.dart';
import 'package:myafyahub/presentation/onboarding/login/pages/verify_phone_page.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/forgot_pin_otp_widget.dart';
import 'package:myafyahub/presentation/onboarding/login/widgets/my_afya_hub_phone_login_page.dart';
import 'package:myafyahub/presentation/onboarding/security_questions/answer_security_question_page.dart';
import 'package:myafyahub/presentation/onboarding/security_questions/security_questions_page.dart';
import 'package:myafyahub/presentation/onboarding/terms_and_conditions_page.dart';
import 'package:myafyahub/presentation/profile/pages/clinic_information_page.dart';
import 'package:myafyahub/presentation/profile/pages/consent_page.dart';
import 'package:myafyahub/presentation/profile/pages/contact_details.dart';
import 'package:myafyahub/presentation/profile/pages/edit_profile_page.dart';
import 'package:myafyahub/presentation/profile/pages/feedback_page.dart';
import 'package:myafyahub/presentation/profile/pages/medical_data_page.dart';
import 'package:myafyahub/presentation/profile/pages/personal_information_page.dart';
import 'package:myafyahub/presentation/profile/pages/profile_faqs_page.dart';
import 'package:myafyahub/presentation/profile/pages/settings_page.dart';
import 'package:myafyahub/presentation/profile/pages/user_profile.dart';
import 'package:myafyahub/presentation/profile/pages/user_profile_page.dart';
// Package imports:
import 'package:user_profile/term_and_conditions.dart' as webview;

/// The router generator for the app. The arrangement in this config must match that
/// in the routes.dart file
class RouteGenerator {
  /// gets the current route based on the [RouteSettings]
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;

    switch (settings.name) {
      case BWRoutes.createPin:
        return MaterialPageRoute<CreateNewPINPage>(
          builder: (_) => CreateNewPINPage(),
        );

      case BWRoutes.verifySignUpOTP:
        return MaterialPageRoute<VerifyPhonePage>(
          builder: (_) => VerifyPhonePage(
            otp: args['OTP'] as int,
          ),
        );

      case BWRoutes.congratulationsPage:
        return MaterialPageRoute<CongratulationsPage>(
          builder: (_) => CongratulationsPage(
            duration: args['duration'] as String,
          ),
        );

      case BWRoutes.termsAndConditions:
        return MaterialPageRoute<TermsAndConditionsPage>(
          builder: (_) => const TermsAndConditionsPage(),
        );

      case BWRoutes.phoneLogin:
        return MaterialPageRoute<MyAfyaHubPhoneLoginPage>(
            builder: (_) => MyAfyaHubPhoneLoginPage());

      case BWRoutes.basicDetails:
        return MaterialPageRoute<BasicDetailsPage>(
            builder: (_) => BasicDetailsPage());

      case BWRoutes.resetPin:
        return MaterialPageRoute<RequestPinResetPage>(
            builder: (_) => RequestPinResetPage());

      case BWRoutes.resumeWithPin:
        return MaterialPageRoute<ResumeWithPinPage>(
            builder: (_) => ResumeWithPinPage());

      // the homepage route config
      case BWRoutes.home:
        return MaterialPageRoute<HomePage>(builder: (_) => const HomePage());

      case BWRoutes.userProfile:
        return MaterialPageRoute<UserProfile>(builder: (_) => UserProfile());

      case BWRoutes.contactInfo:
        return MaterialPageRoute<ProfileContactDetails>(
            builder: (_) => ProfileContactDetails());

      case BWRoutes.profileFaqsPage:
        return MaterialPageRoute<ProfileFaqsPage>(
            builder: (_) => const ProfileFaqsPage());

      case BWRoutes.library:
        return MaterialPageRoute<Library>(builder: (_) => Library());

      case BWRoutes.libraryContent:
        return MaterialPageRoute<LibraryContent>(
            builder: (_) => LibraryContent(
                libraryContentItem: args as LibraryContentItemData));

      // search page
      case BWRoutes.editProfileSettingsPage:
        return MaterialPageRoute<EditProfilePage>(
          builder: (_) => EditProfilePage(),
        );

      case BWRoutes.webView:
        return MaterialPageRoute<webview.TermsAndConditionsPage>(
            builder: (_) => const webview.TermsAndConditionsPage());

      case BWRoutes.forgotPinOtpWidget:
        return MaterialPageRoute<ForgotPinOtpWidget>(
            builder: (_) => ForgotPinOtpWidget());

      case BWRoutes.securityQuestionsPage:
        return MaterialPageRoute<SecurityQuestionsPage>(
            builder: (_) => const SecurityQuestionsPage());

      case BWRoutes.answerSecurityQuestionPage:
        return MaterialPageRoute<AnswerSecurityQuestionPage>(
            builder: (_) => const AnswerSecurityQuestionPage());

      case BWRoutes.communityListView:
        return MaterialPageRoute<CommunityListViewPage>(
            builder: (_) => const CommunityListViewPage());

      case BWRoutes.communityChatScreenPage:
        return MaterialPageRoute<CommunityChatScreenPage>(
            builder: (_) => const CommunityChatScreenPage());

      case BWRoutes.consent:
        return MaterialPageRoute<ConsentPage>(
          builder: (_) => const ConsentPage(),
        );

      case BWRoutes.personalInfo:
        return MaterialPageRoute<PersonalInformationPage>(
            builder: (_) => PersonalInformationPage());

      case BWRoutes.medicalData:
        return MaterialPageRoute<MedicalDataPage>(
          builder: (_) => const MedicalDataPage(),
        );

      case BWRoutes.savedPosts:
        return MaterialPageRoute<SavedPostPage>(
          builder: (_) => SavedPostPage(),
        );

      case BWRoutes.myAfyaHubFeedPage:
        return MaterialPageRoute<MyAfyaHubFeedPage>(
          builder: (_) => const MyAfyaHubFeedPage(),
        );

      case BWRoutes.notificationsPage:
        return MaterialPageRoute<NotificationsPage>(
          builder: (_) => NotificationsPage(
            notifications: notifications,
          ),
        );

      case BWRoutes.appointmentsPage:
        return MaterialPageRoute<AppointmentsPage>(
            builder: (_) => AppointmentsPage());

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

      default:
        return MaterialPageRoute<HomePage>(builder: (_) => const HomePage());
    }
  }
}
