// Flutter imports:
import 'package:flutter/material.dart';

typedef OnBackPressType = void Function(BuildContext context);

typedef OnChangedString = void Function(String);

typedef PhoneNumberFormatterFunc = String Function(
    {required String countryCode, required String phoneNumber});
