import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/router/routes.dart';

class WrongResumeWithPinPage extends StatelessWidget {
  const WrongResumeWithPinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginCounterWidget(
      title: tooManyVerificationAttempts,
      subtitle: tooManyVerificationAttemptsSubtitle,
      requestForAssistanceSubtitle: '',
      actionKey: signInButtonKey,
      actionText: signIn,
      onButtonTapped: () =>
          Navigator.of(context).pushReplacementNamed(AppRoutes.phoneLogin),
    );
  }
}
