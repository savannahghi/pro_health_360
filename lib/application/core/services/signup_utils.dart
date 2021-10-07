// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:misc_utilities/refresh_token_manager.dart';
import 'package:user_feed/user_feed.dart';

// Project imports:
import 'package:myafyahub/application/core/services/connectivity_helper.dart';
import 'package:myafyahub/application/core/services/datatime_parser.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/change_pin_action.dart';
import 'package:myafyahub/application/redux/actions/phone_signup_action.dart';
import 'package:myafyahub/application/redux/actions/phone_signup_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_pin_status_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/event_obj.dart';
import 'package:myafyahub/domain/core/value_objects/events.dart';

class SignUpUtils {
  Future<void> signUpUser({
    required bool validateFormFields,
    required BuildContext context,
    required String createPin,
    required String confirmPin,
  }) async {
    final AppState state = StoreProvider.state<AppState>(context)!;
    final String appContext =
        getEnvironmentContext(AppWrapperBase.of(context)!.appContexts);
    if (validateFormFields) {
      /// [PhoneSignUpStateAction] is a Redux action used to handle a `NEW` user sign up
      StoreProvider.dispatch(
        context,
        PhoneSignUpStateAction(
            createPin: createPin,
            confirmPin: confirmPin,
            invalidCredentials: false),
      );
      if (state.miscState!.userPin!.isChangingPin) {
        /// [ChangePinAction] is a Redux Action whose job is to update a users PIN from an old one,
        ///  to the  new provided one
        await StoreProvider.dispatch(
          context,
          UpdatePinStatusAction(forgotPIN: false),
        );
        await StoreProvider.dispatch<AppState>(
          context,
          ChangePinAction(context: context, flag: createPinFlag),
        );

        publishEvent(
          hasChangedPinSuccessfullyEvent(appContext),
          EventObject(
            firstName: state
                .userProfileState!.userProfile!.userBioData!.firstName!
                .getValue(),
            lastName: state
                .userProfileState!.userProfile!.userBioData!.lastName!
                .getValue(),
            uid: state.userProfileState!.auth!.uid,
            primaryPhoneNumber: state
                .userProfileState!.userProfile!.primaryPhoneNumber!
                .getValue(),
            flavour: Flavour.CONSUMER.name,
            timestamp: DateTime.now(),
          ),
        );
      } else if (state.miscState!.userPin!.forgotPIN) {
        /// [ChangePinAction] is a Redux Action whose job is to update a users PIN from an old one,
        ///  to the  new provided one
        await StoreProvider.dispatch<AppState>(
          context,
          ChangePinAction(context: context, flag: createPinFlag),
        );

        publishEvent(
          hasResetPinSuccessfullyEvent(appContext),
          EventObject(
            firstName: state
                .userProfileState!.userProfile!.userBioData!.firstName!
                .getValue(),
            lastName: state
                .userProfileState!.userProfile!.userBioData!.lastName!
                .getValue(),
            uid: state.userProfileState!.auth!.uid,
            primaryPhoneNumber: state
                .userProfileState!.userProfile!.primaryPhoneNumber!
                .getValue(),
            flavour: Flavour.CONSUMER.name,
            timestamp: DateTime.now(),
          ),
        );
      } else {
        /// [PhoneSignUpAction] is a Redux Action whose job is to verify a `NEW` user has satisfied Sign Up preconditions and there after successfully created
        await StoreProvider.dispatch<AppState>(
          context,
          PhoneSignUpAction(
            context: context,
            flag: createPinFlag,
            tokenManger: RefreshTokenManger(),
            dateTimeParser: DateTimeParser(),
          ),
        );
      }
    }
  }
}
