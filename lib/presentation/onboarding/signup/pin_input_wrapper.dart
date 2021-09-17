import 'package:myafyahub/application/core/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_ui_components/inputs.dart';

class PinInputWrapper extends StatelessWidget {
  const PinInputWrapper({
    required this.pinController,
    required this.pinInputKey,
    required this.hintText,
    required this.labelText,
    this.onChanged,
  });

  final TextEditingController pinController;
  final Key pinInputKey;
  final String hintText;
  final String labelText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SILFormTextField(
      key: pinInputKey,
      borderColor: Colors.grey.withOpacity(0.5),
      maxLength: 4,
      maxLines: 1,
      keyboardType: TextInputType.number,
      obscureText: true,
      hintText: hintText,
      labelText: labelText,
      controller: pinController,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      validator: userPinValidator,
      onChanged: onChanged != null ? (String value) => onChanged!(value) : null,
    );
  }
}
