// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:misc_utilities/misc.dart';
import 'package:misc_utilities/refresh_token_manager.dart';

// Project imports:
import 'package:myafyahub/application/core/services/datatime_parser.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/check_and_update_connectivity_action.dart';
import 'package:myafyahub/application/redux/actions/phone_login_action.dart';
import 'package:myafyahub/application/redux/actions/phone_login_state_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> signInUser({
  required BuildContext context,
  required String pin,
  required String phoneNumber,
}) async {
  StoreProvider.dispatch(
    context,
    CheckAndUpdateConnectivityAction(),
  );

  if (!validatePhoneNumber(phoneNumber)) {
    showFeedbackBottomSheet(
      context: context,
      modalContent: OnboardingStrings.of(context)!.phoneRequiredText(),
      imageAssetPath: errorIconUrl,
    );
    return;
  }

  // this is the Redux Action that store the phone number and PIN user enters
  StoreProvider.dispatch(
    context,
    PhoneLoginStateAction(
      phoneNumber: phoneNumber,
      pinCode: pin,
    ),
  );

  final bool hasConnection =
      StoreProvider.state<AppState>(context)?.connectivityState?.isConnected ??
          false;

  if (hasConnection) {
    try {
      await StoreProvider.dispatch<AppState>(
        context,
        PhoneLoginAction(
          context: context,
          flag: phoneLoginFlag,
          tokenManger: RefreshTokenManger(),
          dateTimeParser: DateTimeParser(),
        ),
      );
    } catch (e) {
      Sentry.captureException(e, hint: 'Login failed');
    }
  } else {
    const SnackBar snackbar = SnackBar(content: Text(checkInternetText));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
