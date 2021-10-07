// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:rxdart/rxdart.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

/// [MyAfyaHubCountryPicker] is used in [MyAfyaHubPhoneLoginPage] select Country Code
///
/// It takes in a required [onChanged] parameter
class MyAfyaHubCountryPicker extends StatefulWidget {
  const MyAfyaHubCountryPicker({Key? key, required this.onChanged})
      : super(key: key);

  final Function onChanged;

  @override
  _MyAfyaHubCountryPickerState createState() => _MyAfyaHubCountryPickerState();
}

class _MyAfyaHubCountryPickerState extends State<MyAfyaHubCountryPicker> {
  Country _country = Country.kenya;
  PhoneInputBehaviorSubject phoneInputBehaviorSubject =
      PhoneInputBehaviorSubject();

  @override
  Widget build(BuildContext context) {
    phoneInputBehaviorSubject.countryCode.add(getCountry(_country)!['code']!);
    return GestureDetector(
      onTap: () async {
        final dynamic _result = await selectCountryModalBottomSheet(context);
        if (_result != null) {
          setState(() {
            _country = _result as Country;
          });
          widget.onChanged(getCountry(_country)!['code']);
          phoneInputBehaviorSubject.countryCode
              .add(getCountry(_country)!['code']!);
        }
      },
      child: SizedBox(
        key: selectCountryKey,
        height: 54,
        width: 78,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                getCountry(this._country)!['code']!,
                key: const Key('countrySelectedKey'),
                style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: AppColors.secondaryColor,
                    fontSize: 15),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              getCountry(this._country)!['flag']!,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class PhoneInputBehaviorSubject {
  static final PhoneInputBehaviorSubject _singleton =
      PhoneInputBehaviorSubject._internal();

  factory PhoneInputBehaviorSubject() {
    return _singleton;
  }

  PhoneInputBehaviorSubject._internal();

  BehaviorSubject<String> countryCode = BehaviorSubject<String>.seeded('+254');
  BehaviorSubject<String> phoneNumber = BehaviorSubject<String>();
}
