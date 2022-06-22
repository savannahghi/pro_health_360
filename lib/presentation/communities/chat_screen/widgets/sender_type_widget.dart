// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class SenderTypeWidget extends StatelessWidget {
  /// [SenderTypeWidget] used within [ReceivedMessageItem] to the type of sender
  ///  i.e. moderator or doctor.
  ///
  /// [senderTitle] and [senderIcon] are all required.
  ///
  const SenderTypeWidget({
    required this.senderTitle,
    required this.senderIcon,
  });

  final String senderTitle;
  final String senderIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SvgPicture.asset(
          senderIcon,
          color: AppColors.whiteColor,
          width: 16,
          height: 16,
        ),
        verySmallHorizontalSizedBox,
        Text(
          senderTitle,
          style: normalSize10Text().copyWith(color: AppColors.whiteColor),
        ),
      ],
    );
  }
}
