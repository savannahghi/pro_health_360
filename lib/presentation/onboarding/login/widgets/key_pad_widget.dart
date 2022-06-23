// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/svg.dart';
// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class KeyPadWidget extends StatefulWidget {
  /// [KeyPadWidget] is a shared widget used in [PINInputPage]
  ///
  /// It takes in required [pinController], [onChange] and [isCorrectPin] parameters
  const KeyPadWidget({
    Key? key,
    required this.pinController,
    required this.onChange,
    required this.isCorrectPin,
    required this.canEnterPin,
  }) : super(key: key);
  final TextEditingController pinController;
  final Function onChange;
  final bool isCorrectPin;
  final bool canEnterPin;

  @override
  _KeyPadWidgetState createState() => _KeyPadWidgetState();
}

class _KeyPadWidgetState extends State<KeyPadWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildPinScreenButton('1'),
                buildPinScreenButton('2'),
                buildPinScreenButton('3'),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildPinScreenButton('4'),
                buildPinScreenButton('5'),
                buildPinScreenButton('6'),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildPinScreenButton('7'),
                buildPinScreenButton('8'),
                buildPinScreenButton('9'),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const SizedBox(
                  height: 65.0,
                  width: 65.0,
                ),
                buildPinScreenButton('0'),
                SizedBox(
                  height: 65.0,
                  width: 65.0,
                  child: InkWell(
                    key: keyPadBackSpaceButtonKey,
                    borderRadius: BorderRadius.circular(200),
                    highlightColor: AppColors.secondaryColor.withOpacity(0.3),
                    splashColor: AppColors.secondaryColor.withOpacity(0.6),
                    onTap: widget.canEnterPin
                        ? () {
                            setState(() {
                              widget.pinController.text =
                                  widget.pinController.text.substring(
                                0,
                                widget.pinController.text.length - 1,
                              );
                            });
                          }
                        : null,
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      child: SvgPicture.asset(
                        backSpaceIcon,
                        color: widget.canEnterPin
                            ? AppColors.secondaryColor
                            : Colors.grey,
                        width: 26,
                        height: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // ),
    );
  }

  Widget buildPinScreenButton(String buttonText) {
    return SizedBox(
      height: 65.0,
      width: 65.0,
      child: InkWell(
        borderRadius: BorderRadius.circular(200),
        highlightColor: AppColors.secondaryColor.withOpacity(0.3),
        splashColor: AppColors.secondaryColor.withOpacity(0.6),
        onTap: widget.canEnterPin
            ? () {
                if (widget.pinController.text.length <= 4) {
                  widget.pinController.text =
                      widget.pinController.text + buttonText;
                  widget.onChange(widget.pinController.text);
                }
              }
            : null,
        child: Container(
          alignment: AlignmentDirectional.center,
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: lightSize16Text(
              widget.canEnterPin ? AppColors.secondaryColor : Colors.grey,
            ).copyWith(
              fontSize: 47.0,
            ),
          ),
        ),
      ),
    );
  }
}
