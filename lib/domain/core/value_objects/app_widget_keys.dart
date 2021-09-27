import 'package:flutter/foundation.dart';

// onboarding keys
const Key landingPageKey = Key('landing_page_key');

const Key globalStoreKey = Key('global-store-provider');
const Key onboardingScaffoldBackButton = Key('onboarding_scaffold_back_button');
const Key welcomeScreensKey = Key('welcome_screens_key');

// landing page keys
const Key loginWithPhoneKey = Key('login_with_phone');
const Key createAccountKey = Key('create_account_key');

// user phone keys
const Key verifyButtonKey = Key('verify_button_key');
const Key allowCommunicationsCheckBoxKey =
    Key('allow_communications_checkbox_key');

//user email keys
const Key emailHintTextKey = Key('email_hint_text_key');
const Key emailTextFieldKey = Key('email_text_field_key');
const Key allowCommunicationsKey = Key('allow_communications_key');
const Key verifyEmailKey = Key('verify_email_key');
//create pin keys
const Key continueKey = Key('continue_button_key');
const Key backKey = Key('back_button_key');
const Key enterPinKey = Key('enter_pin_field');
const Key confirmPinKey = Key('confirm_pin_field');

// sil sliver appbar keys
const Key greetingFormFieldKey = Key('greeting_formField_Key');
const Key sliverSearchKey = Key('sliver_search_key');

//sil loading
const Key loadingIndicatorKey = Key('loading_indicator_key');

// sil help center button keys
const Key helpCenterButtonKey = Key('help_center_button_key');
const Key helpCenterButtonImage = Key('help_center_button_image');
const Key helpCenterContainerKey = Key('help_center_container');
const Key helpCenterCallKey = Key('help_center_call');
const Key helpCenterWhatsAppKey = Key('help_center_whatsApp');
const Key helpCenterEmailKey = Key('help_center_email');
const Key helpCenterDismissKey = Key('help_center_dismiss');
const Key helpCenterColumnKey = Key('help_center_column');
const Key helpCenterBackKey = Key('help_center_back');

//cart coming soon page
const Key cartComingSoonScaffold = Key('cart_scaffold');
const Key cartComingListView = Key('cart_listView');
const Key cartComingImage = Key('cart_coming_soon_image');

//pin verification keys
const Key pinResetKey = Key('pin_verification_key');
const Key pinVerificationInputKey = Key('pin_verification_input_key');

// phone login keys
const Key phoneLoginSubmitButtonKey = Key('phone_login_submit_button_key');
const Key createNewAccountKey = Key('create_new_account_key');
const Key resetPinKey = Key('reset_pin_key');
const Key pinInputKey = Key('pin_input_key');

// phone sign up keys
const Key phoneSignUpCheckboxKey = Key('phone_sign_up_checkbox_key');
const Key phoneSignUpBackKey = Key('phone_sign_up_back_key');

/// bottom sheet keys
const Key bottomSheetKey = Key('bottom_sheet_key');
const Key primaryBottomSheetButtonKey = Key('primary_bottom_sheet_button');
const Key secondaryBottomSheetButtonKey = Key('secondary_bottom_sheet_button');
const Key tertiaryBottomSheetButtonKey = Key('tertiary_bottom_sheet_button');

/// SIL Card keys
const Key benefitCardKey = Key('benefit_card_key');
const Key noVirtualCardViewButtonKey = Key('no_virtual_card_view_button');

// Appointment keys
const Key appointmentsAppBarBackButtonKey = Key('back_button_key');
const Key appointmentsTabBar = Key('tab_bar_key');
const Key appointmentsStack = Key('appointments_stack');
const Key pastAppointmentsListView = Key('past_appointments_listView');
const Key pastAppointmentCard = Key('past_appointments_card');
const Key upcomingAppointmentsListView = Key('upcoming_appointments_listView');
const Key upcomingAppointmentCard = Key('upcoming_appointments_card');
const Key singleAppointmentAppBarKey = Key('single_appointment_appBar_key');

const Key appointmentSilNoBorderButton = Key('appointment_Sil_NoBorder_Button');

const Key silAppBarGestureKey = Key('sil_appBar_gesture_detector');

const Key selfAppointmentBookingKey = Key('self_appointment_booking_key');
const Key dependantAppointmentBookingKey =
    Key('dependant_appointment_booking_key');
const Key visitTypeRadioKey = Key('visit_type_radio');
const Key genericNoDataButtonKey = Key('generic_no_data_button_key');

const Key physicalVisitTypeRadioKey = Key('physical_visit_type_radio');

// terms and conditions keys
const Key acceptTermsAndConditionsKey = Key('accept_terms_and_conditions');
const Key rejectTermsAndConditionsKey = Key('reject_terms_and_conditions');
const Key termsAndConditionsColumnKey = Key('terms_and_conditions_column');
const Key termsAndConditionsLinkKey = Key('terms_and_conditions_link');

// phone number verification
const Key phoneNumberVerificationKey = Key('phone_number_verification');

// global actions page keys
const Key wellnessCheckupPageKey = Key('wellness_checkup_key');

// search page keys
const Key searchPageKey = Key('search_page_key');
const Key searchActionCardKey = Key('search_action_card_key');
const Key searchFormKey = Key('search_form');
const Key searchBackButtonKey = Key('search_back_button');
const Key searchTopResultKey = Key('search_top_result');
const Key searchPossibleResultKey = Key('search_possible_result');

// wellness page keys
const Key wellnessPageKey = Key('wellness_page');
const Key earnPointsTabDetailsKey = Key('earn_points_tab_details');
const Key historyTabDetailsKey = Key('history_tab_details');
const Key payWithWellnessPointsCardKey = Key('pay_with_wellness_points_card');
const Key earnPointsTabCardKey = Key('earn_points_tab_card');
const Key historyTabCardTitleKey = Key('history_tab_card_title');
const Key historyTabCardDetailsKey = Key('history_tab_card_details');
const Key wellnessHistoryPageKey = Key('wellness_page_history_page');
const Key wellnessPayPageKey = Key('wellness_pay_scaffold_key');
const Key wellnessPageComingSoon = Key('wellness_page_coming_soon_scaffold');
const Key wellnessListViewKey = Key('wellness_list_view');
const Key wellnessComingSoonCardKey = Key('wellness_coming_soon_card');

// feed keys
const Key feedComponentKey = Key('feed_component_key');

// homepage content keys
const Key homepageContentKey = Key('home_page_content_scaffold');

// health records
const Key healthRecordsPageKey = Key('my_health_profile');

// medical loans
const Key medicalLoansPageKey = Key('medical_loan');

// payer list
const Key payersListKey = Key('payers-list');

// test pages
const Key getTestedButtonKey = Key('get_tested_button_key');
const Key doctorsPrescriptionTappableCardKey =
    Key('doctors_prescription_tappable_card_Key');
const Key noDoctorsPrescriptionTappableCardKey =
    Key('no_doctors_prescription_tappable_card_Key');

// user profile keys
const Key editProfileKey = Key('save_profile');
const Key toggleEditButtonKey = Key('toggle-edit');
const Key enableEditForm = Key('edit_form');
const Key editProfileAnimatedSwitchKey = Key('animated_switch');
const Key editProfileTesterPaddingKey = Key('tester_padding');
const Key editProfileTesterButtonKey = Key('tester_button');
const Key editProfileChangePinKey = Key('change_pin');

const Key editProfileFirstNameKey = Key('first_name');
const Key editProfileLastNameKey = Key('last_name');
const Key editProfileSaveKey = Key('save_button');
const Key updateEmailContainerKey = Key('update_email_container');
const Key profileMasterDetailRowKey = Key('profile_master_detail_row');

// login page
const Key loginWithPhoneButton = Key('login_with_phone_button');
const Key requestPinResetWidgetKey = Key('request_pin_reset_widget_key');
const Key startLoginButtonKey = Key('start_login_button_key');
const Key phoneLoginGesture = Key('phone_login_gesture');
const Key enterSignUpNumberKey = Key('enter_sign_up_number');
const Key enterSignUpNumberButtonKey = Key('enter_sign_up_number_button');

const Key coachPageScaffoldKey = Key('coach_scaffold');

//set confirm pin
const String setPinColumn = 'set_pin_column';

//communication alert
const Key commBottomSheetKey = Key('comm_bottom_sheet_key');
const Key commContainerKey = Key('comm_container_key');

//communication consent page
const Key commConsentPrimaryButtonKey = Key('comm_consent_primary_button_key');
const Key commConsentNoBorderButtonKey =
    Key('comm_consent_no_border_button_key');
//onboarding page wrapper
const Key onboardingNoBorderButtonKey = Key('onboarding_flat_button_key');
const Key onboardingSingleChildKey = Key('onboarding_single_child_key');
const Key onboardingContainerKey = Key('onboarding_container_key');

//basic details keys
const Key firstNameKey = Key('first_name');
const Key lastNameKey = Key('last_name');
const Key primaryButtonKey = Key('primary_button');
const Key editButtonKey = Key('edit_button');
const Key cancelButtonKey = Key('cancel_button');
const Key backButtonKey = Key('back_button');
const Key genderOptionFieldKey = Key('gender_option_field');

//welcome page keys
const Key skipOnboardingTourKey = Key('skip_onboarding_tour_key');
const Key welcomePageNextKey = Key('welcome_page_next_key');

// error alert box keys
const Key errorAlertBoxKey = Key('error_alert_box_key');
const Key errorAlertBoxTextKey = Key('error_alert_box_text_key');
//webview page keys
const Key webScaffoldKey = Key('web_scaffold');
const Key webViewKey = Key('web_view');
//product detail page keys
const Key productScrollViewKey = Key('product_scroll_view');
const Key productImageKey = Key('product_image');
const Key productContainerKey = Key('product_container');
const Key productBuyButtonKey = Key('product_buy_button');
const Key productAddCartButtonKey = Key('product_add_cart_button');
const Key productImageGestureKey = Key('product_image_gesture');

//home work settings page keys
const Key homeWorkScrollViewKey = Key('home_work_scroll_view');
const Key homeWorkContainerKey = Key('home_work_container');

//generic empty data keys
const Key genericContainerKey = Key('generic_container');
const Key genericListViewKey = Key('generic_list_view');
const Key genericRetryButtonKey = Key('generic_primary_button');

//medications keys
const Key comingSoonCardKey = Key('coming_soon');

//sign up edi widgets
const Key bottomSheetContainerKey = Key('bottom_sheet_container');
const Key openSettingsButtonKey = Key('open_settings_button');
const Key closeButtonKey = Key('close_button');
const Key documentContainerKey = Key('document_container');

//recover account keys
const Key phoneNumberInputButtonKey = Key('phone_number_input_button');
const Key selectRecoverAccountSilCheckBoxKey =
    Key('recover_account_checkbox_key');

//sil actions bottom sheet keys
const Key actionsContainerKey = Key('actions_container');

const Key sliverAppBarKey = Key('sliver_app_bar_key');

//lib keys
const Key libraryListItemKey = Key('library_list_item');
const Key libraryErrorWidgetKey = Key('library_error_widget');
const Key libraryNullWidgetKey = Key('library_null_widget');
const Key libraryIconButtonKey = Key('library_icon_button_keys');

const Key helpNoDataWidgetKey = Key('help_no_data_widget_key');

//logout button keys
const Key logoutButtonKey = Key('logout_button');

//library keys
const Key libraryColumnKey = Key('library_column');
const Key libraryPageContentKey = Key('library_page_content_key');
const Key libraryContentColumnKey = Key('library_content_column');
const Key libraryFeaturedContentKey = Key('library_featured_content');
const Key libraryListContentKey = Key('library_list_content');
const Key libraryGestureKey = Key('library_gesture_detector_key');
const Key libraryStackKey = Key('library_stack');
const Key libraryContainerKey = Key('library_container');
const Key libraryContentContainerKey = Key('library_content_container');
const Key libraryListViewKey = Key('library_list_view');
const Key libraryScaffoldKey = Key('library_scaffold');
const Key libraryStreamBuilderKey = Key('library_stream_builder');

// sil bottom nav
const Key silBottomNavKey = Key('sil_bottom_nav_key');
const Key silBottomNavItemKey = Key('sil_bottom_nav_item_key');

const Key homeNavigationBarItemKey = Key('home_navigation_bar_item');
const Key coachNavigationBarItemKey = Key('coach_navigation_bar_item');
const Key libraryNavigationBarItemKey = Key('library_navigation_bar_item');
const Key cartNavigationBarItemKey = Key('cart_navigation_bar_item');
const Key coversNavigationBarItemKey = Key('covers_navigation_bar_item');

// patient panel error widget keys
const Key patientsPanelRetryButtonKey = Key('patients_panel_retry_button');

// primary phone number
const Key recoveryOtpButton = Key('recovery_otp_button');

//scaffold header
const Key backButtonToLanding = Key('back_button_landing');

// feedback bottom sheet key
const Key feedbackBottomSheet = Key('feedback_bottom_sheet');

const Key feedbackBottomSheetCloseIconKey =
    Key('show_feedback_bottom_sheet_close_icon');

const Key providerPanelBackButton = Key('provider_panel_back_button');
const Key recoverAccountKey = Key('recover_account_button');

const Key logoutIconKey = Key('logout_icon_key');

const Key genericBottomSheetWidgetKey = Key('generic_bottomsheet_widget_key');

const Key stepCounterProgressIndicatorKey =
    Key('step_counter_progress_indicator_key');

const Key searchPageActionLibraryKey = Key('search_page_action_library_key');

const Key bowiSelectRange = Key('bowiSelectRange');
const Key bevSelectRange = Key('bevSelectRange');

const Key bowiFinalStep = Key('bowiFInalStep');
const Key bevFinalStep = Key('bevFinalStep');

const Key bowiAddInfo = Key('bowiAddInfo');
const Key bevAddInfo = Key('bevAddInfo');
const Key addAgeKey = Key('add_age_key');

const Key spouseFirstNameKey = Key('spouse_first_name_key');
const Key spouseLastNameKey = Key('spouse_last_name_key');
const Key principalFirstNameKey = Key('principal_first_name_key');
const Key principalLastNameKey = Key('principal_last_name_key');
const Key spousePhoneNumberKey = Key('spouse_phone_number_key');
const Key spouseIDKey = Key('spouse_id_key');
const Key spouseKRAKey = Key('spouse_kra_key');

const Key parentFirstNameKey = Key('parent_first_name_key');
const Key parentLastNameKey = Key('parent_last_name_key');
const Key parentPhoneNumberKey = Key('parent_phone_number_key');
const Key motherDetailsWidgetKey = Key('mother_details_widget_key');
const Key fatherDetailsWidgetKey = Key('father_details_widget_key');
const Key childFirstNameKey = Key('child_first_name_key');
const Key childLastNameKey = Key('child_last_name_key');
const Key childBirthCertKey = Key('child_birth_cert_key');

const Key diagnosesCardKey = Key('diagnoses_card');

const Key refreshButtonKey = Key('refresh_button_key');
const Key noWidgetKey = Key('no_widget_key');
const Key noWidgetSizedBoxKey = Key('no_widget_sized_box_key');
const Key dismissShowMoreKey = Key('dismiss_show_morek_key');
const Key expansionPanelKey = Key('expansion_panel_key');
const Key hraProgressKey = Key('hra_progress_key');

const Key hrakGridResponseKey = Key('hra_grid_respose_key');
const Key hrakColumnResponseKey = Key('hra_column_respose_key');
const Key circularButtonKey = Key('circular_button_key');
const Key pillButtonKey = Key('pill_button_key');
const Key nextHRAQuestionKey = Key('next_hra_question_key');
const Key backHRAQuestionKey = Key('back_hra_question_key');
//add benefits button key
const Key addAdditionalBenefitsKey = Key('add_additional_benefits');

const Key htmlWrapperImageKey = Key('html_wrapper_image_key');
const Key buyCoverStatusButtonKey = Key('buy_cover_status_button_key');
const Key buyCoverStatusRefreshButtonKey =
    Key('buy_cover_status_refresh_button_key');
const Key buyCoverStatusBackButtonKey = Key('buy_cover_status_back_button_key');
const Key bowiAssistantKey = Key('bowi_assistant_key');
const Key bevAssistantKey = Key('bev_assistant_key');
const Key selectAssistantButtonKey = Key('select_assistant_button_key');
const Key selectCoverageInfoListKey = Key('select_coverage_info_list_key');
const Key selectLoanOrFullAmountListKey =
    Key('select_loan_or_full_amount_list_key');

//principal confirm details keys
const Key principalGenderKey = Key('principal_gender_key');

const Key confirmIdentificationListKey = Key('confirm_identification_list_key');
const Key notifyLaterButtonKey = Key('notify_later_button_key');
const Key refreshStatusButtonKey = Key('refresh_status_button_key');
const Key premiumRangeToggleKey = Key('premium_range_toggle_key');
const Key periodTextKey = Key('period_text_key');
const Key loanTermsButtonKey = Key('loan_terms_button_key');

const Key maleRadioButtonKey = Key('male_radio_button_key');
const Key femaleRadioButtonKey = Key('female_radio_button_key');

const Key continueLaterKey = Key('continue_later_key');

//Notification List Item
const Key notificationIconContainerKey = Key('notification_icon_container_key');
