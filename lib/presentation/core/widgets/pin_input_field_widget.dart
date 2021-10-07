// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:pin_code_text_field/pin_code_text_field.dart';

/// [PINInputField] is a shared widget to input authentication PIN
///
/// It takes in a required [maxLength] parameter to specify the number of PIN input fields

class PINInputField extends StatelessWidget {
  const PINInputField({
    Key? key,
    required this.maxLength,
    required this.onDone,
    this.onTextChanged,
    this.autoFocus = false,
    this.wrapAlignment = WrapAlignment.spaceBetween,
    this.pinBoxHeight = 50.0,
    this.pinBoxWidth = 50.0,
    this.controller,
    this.keyboardType = TextInputType.number,
    this.focusNode,
  }) : super(key: key);
  final bool? autoFocus;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final int? maxLength;
  final Function onDone;
  final Function? onTextChanged;
  final double? pinBoxHeight;
  final double? pinBoxWidth;
  final WrapAlignment? wrapAlignment;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
        controller: controller,
        autofocus: autoFocus!,
        hideCharacter: true,
        pinBoxBorderWidth: 1.5,
        highlight: true,
        focusNode: focusNode,
        highlightColor: Colors.blue,
        defaultBorderColor: Theme.of(context).primaryColor,
        hasTextBorderColor: Theme.of(context).colorScheme.secondary,
        maxLength: maxLength ?? 4,
        maskCharacter: '⚫',
        pinBoxWidth: pinBoxWidth!,
        pinBoxHeight: pinBoxHeight!,
        wrapAlignment: wrapAlignment!,
        pinBoxDecoration: customRoundedPinBoxDecoration,
        pinTextStyle: const TextStyle(fontSize: 10.0),
        pinTextAnimatedSwitcherTransition:
            ProvidedPinBoxTextAnimation.scalingTransition,
        pinBoxColor: Theme.of(context).backgroundColor,
        pinTextAnimatedSwitcherDuration: const Duration(milliseconds: 300),
        highlightAnimationBeginColor: Colors.black,
        highlightAnimationEndColor: Colors.white12,
        keyboardType: keyboardType,
        onDone: (String val) {
          onDone(val);
        },
        onTextChanged: (String val) =>
            (onTextChanged == null) ? <dynamic>{} : onTextChanged!(val));
  }
}

BoxDecoration customRoundedPinBoxDecoration(
  Color borderColor,
  Color pinBoxColor, {
  double borderWidth = 1.0,
  double? radius,
}) {
  return BoxDecoration(
      border: Border.all(
        color: borderColor,
        width: borderWidth,
      ),
      color: pinBoxColor,
      borderRadius: const BorderRadius.all(Radius.circular(4)));
}
