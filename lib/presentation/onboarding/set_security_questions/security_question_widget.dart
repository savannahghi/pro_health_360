// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:afya_moja_core/inputs.dart';
import 'package:domain_objects/value_objects.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/entities/security_questions/questions/security_question.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class SecurityQuestionWidget extends StatefulWidget {
  const SecurityQuestionWidget({
    Key? key,
    required this.securityQuestion,
    required this.response,
    required this.onChanged,
  }) : super(key: key);

  final SecurityQuestion securityQuestion;
  final String? response;
  final ValueChanged<String?> onChanged;

  @override
  _SecurityQuestionWidgetState createState() => _SecurityQuestionWidgetState();
}

class _SecurityQuestionWidgetState extends State<SecurityQuestionWidget> {
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final SecurityQuestion question = widget.securityQuestion;
    final String? initialResponse = widget.response;
    return Container(
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      child: ExpandableQuestion(
        isDateType: question.responseType == SecurityQuestionResponseType.DATE,
        dateController: dateController,
        question: question.questionStem ?? UNKNOWN,
        hintText: answerHereString,
        validator: securityQuestionValidator,
        initialValue: initialResponse,
        questionTextStyle: const TextStyle(
          color: AppColors.greyTextColor,
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
        ),
        keyboardType:
            question.responseType == SecurityQuestionResponseType.NUMBER
                ? TextInputType.number
                : null,
        onChanged: (String? value) {
          widget.onChanged(value);
        },
      ),
    );
  }
}
