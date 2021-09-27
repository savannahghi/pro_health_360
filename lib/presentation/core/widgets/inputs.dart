import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_themes/colors.dart';

import '../helpers.dart';

/// ExpandableQuestion
///
/// [ExpandableQuestion] collects answers to secret questions.
///
/// Every other property here is the normal one except the following:
///   1. [isSearchField] is used to make the input box expanded in height
///       to fit the needs of `patient identification search`
///   2. [isSearchFieldSmall] is used to make the input field smaller than normal
///       so it can look like a nice search box
///   3. [autoFocus] - if this value is set to true, the input is automatically
///       focused the moment the UI containing that widget is rendered
///   4. [context] is used when applying the active and focused colors depending
///       on the provided context. For example getting colors from [Theme.of(context)]
class ExpandableQuestion extends StatelessWidget {
  const ExpandableQuestion({
    required this.question,
    this.color,
    Key? key,
    this.enabled,
    this.controller,
    this.onSaved,
    this.onTap,
    this.labelText,
    this.hintText,
    this.initialValue,
    required this.onChanged,
    this.onFieldSubmit,
    this.focusNode,
    this.keyboardType,
    this.formatters,
    this.maxLines,
    this.maxLength,
    this.textStyle,
    this.suffixIcon,
    this.isSearchField = false,
    this.obscureText,
    this.autoValidate = false,
    this.isSearchFieldSmall = false,
    this.autoFocus,
    this.inputFormatters,
    this.prefixIcon,
    this.textInputAction,
    this.customFillColor,
    this.hintColor,
    this.hintTextColor,
    this.borderColor,
    this.textFieldBackgroundColor,
    this.decoration,
    this.fieldKey,
  })  : assert(initialValue == null || controller == null,
            'When a controller is specified, initialValue must be null'),
        super(key: key);

  final String question;
  final Color? color;
  final bool? autoFocus;
  final bool? autoValidate;
  final Color? borderColor;
  final TextEditingController? controller;
  final Color? customFillColor;
  final InputDecoration? decoration;
  final bool? enabled;
  final Key? fieldKey;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? formatters;
  final Color? hintColor;
  final String? hintText;
  // jhfdf
  final Color? hintTextColor;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final bool isSearchField;
  final bool isSearchFieldSmall;
  final TextInputType? keyboardType;
  final String? labelText;
  final int? maxLength;
  final int? maxLines;
  final bool? obscureText;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onFieldSubmit;
  final FormFieldSetter<String>? onSaved;
  final Function? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? textFieldBackgroundColor;
  final TextInputAction? textInputAction;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: white),
      child: InputDecorator(
        decoration: InputDecoration(
          fillColor: white,
          focusColor: Colors.grey[200],
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color ?? white),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
        ),
        child: Theme(
          data: ThemeData().copyWith(
            dividerColor: Colors.transparent,
            unselectedWidgetColor: black,
            accentColor: Colors.black,
          ),
          child: Column(
            children: <Widget>[
              ExpansionTile(
                iconColor: black,
                title: Text(
                  question,
                  style: const TextStyle(
                      color: black,
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal),
                ),
                children: <Widget>[
                  TextFormField(
                    key: fieldKey,
                    enabled: enabled ?? true,
                    maxLines: maxLines,
                    maxLength: maxLength,
                    autovalidateMode: autoValidate ?? false
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    initialValue: initialValue,
                    decoration: decoration ??
                        InputDecoration(
                          filled: true,
                          fillColor: (enabled != null && !enabled!)
                              ? Colors.grey[200]
                              : customFillColor ?? Colors.grey[200],
                          alignLabelWithHint: alignLabelWithHint(maxLines),
                          contentPadding: isSearchField
                              ? const EdgeInsets.all(20)
                              : EdgeInsets.symmetric(
                                  vertical: isSearchFieldSmall ? 10 : 15,
                                  horizontal: 15),
                          labelText: labelText,
                          hintText: hintText,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: hintColor ?? grey, fontSize: 16),
                          suffix: suffixIcon,
                          prefixIcon: prefixIcon,
                          labelStyle: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: grey, fontSize: 16),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: customFillColor ??
                                    borderColor ??
                                    Colors.white24),
                            borderRadius: BorderRadius.all(
                                Radius.circular(isSearchField ? 1 : 5)),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[200]!),
                            borderRadius: BorderRadius.all(
                                Radius.circular(isSearchField ? 1 : 5)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[200]!),
                            borderRadius: BorderRadius.all(
                                Radius.circular(isSearchField == true ? 1 : 5)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: red),
                            borderRadius: BorderRadius.all(
                                Radius.circular(isSearchField == true ? 1 : 5)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: red),
                            borderRadius: BorderRadius.all(
                                Radius.circular(isSearchField == true ? 1 : 5)),
                          ),
                          focusColor: black,
                        ),
                    cursorColor: black,
                    autofocus: autoFocus ?? false,
                    style: textStyle ??
                        Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: black, fontSize: 16),
                    onFieldSubmitted: onFieldSubmit,
                    textInputAction: textInputAction ?? TextInputAction.done,
                    textAlignVertical: TextAlignVertical.center,
                    onChanged: onChanged,
                    onSaved: onSaved,
                    onTap: onTap != null ? () => onTap!() : null,
                    controller: controller,
                    focusNode: focusNode,
                    obscureText: obscureText ?? false,
                    keyboardType: keyboardType ?? TextInputType.text,
                    inputFormatters: inputFormatters,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
