// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/types.dart';
import 'package:myafyahub/presentation/core/widgets/inputs/hints.dart';

/// A wrapper for [TextFormField] that contains options for a field label.
///
/// For the label to appear the [fieldLabel] must be specified.
/// If [fieldLabel] is specified and [isRequired] is true, then a red asterisk
/// is added to the label.
///
/// For a documentation about the various parameters, see [TextFormField].
class CustomTextField extends StatelessWidget {
  /// A wrapper for [TextFormField] that contains options for a field label.
  ///
  /// For the label to appear the [fieldLabel] must be specified.
  /// If [fieldLabel] is specified and [isRequired] is true, then a red asterisk
  /// is added to the label.
  ///
  /// For a documentation about the various parameters, see [TextFormField].
  const CustomTextField({
    Key? key,
    bool? enabled,
    final bool? obscureText,
    required this.formFieldKey,
    this.focusNode,
    this.fieldLabel,
    this.controller,
    this.onChanged,
    this.hintText,
    this.hintColor,
    this.onSubmitted,
    this.customFillColor,
    this.maxLines,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.borderColor,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.maxLength,
    this.isRequired,
  })  : enabled = enabled ?? true,
        obscureText = obscureText ?? false,
        super(key: key);

  final Key formFieldKey;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? fieldLabel;
  final String? hintText;
  final Color? hintColor;
  final OnChangedString? onChanged;
  final OnChangedString? onSubmitted;
  final bool enabled;
  final Color? customFillColor;
  final int? maxLines;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? borderColor;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final bool? isRequired;

  @override
  Widget build(BuildContext context) {
    final List<Widget> labels = <Widget>[];
    if (fieldLabel != null) {
      labels.addAll(<Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: TextFormHintText(
            hintText: fieldLabel!,
            isRequired: isRequired,
          ),
        ),
        smallVerticalSizedBox,
      ]);
    }

    return Column(
      children: <Widget>[
        ...labels,
        TextFormField(
          maxLength: maxLength,
          keyboardType: keyboardType,
          controller: controller,
          obscureText: obscureText,
          enabled: enabled,
          key: formFieldKey,
          onFieldSubmitted: onSubmitted,
          onChanged: onChanged,
          focusNode: focusNode,
          decoration: InputDecoration(
            filled: true,
            fillColor: (!enabled) ? Colors.grey[200] : customFillColor ?? white,
            alignLabelWithHint: alignLabelWithHint(maxLines),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            labelText: labelText,
            hintText: hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: hintColor ?? grey, fontSize: 16),
            suffix: suffixIcon,
            prefixIcon: prefixIcon,
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w300, color: Colors.grey, fontSize: 15),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: customFillColor ?? borderColor ?? Colors.white24),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: grey),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.secondary),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: red),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: red),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            focusColor: Theme.of(context).colorScheme.secondary,
          ),
          validator: validator,
          inputFormatters: inputFormatters,
        ),
      ],
    );
  }

  bool alignLabelWithHint(int? maxLines) => maxLines != null && maxLines > 1;
}
