// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:myafyahub/domain/core/entities/profile/edit_information_item.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
// Package imports:
import 'package:shared_themes/text_themes.dart';

class EditInformationButtonWidget extends StatelessWidget {
  ///[EditInformationButtonWidget] used to edit information in user profile
  const EditInformationButtonWidget({
    this.submitFunction,
    this.editBtnKey,
    this.onTap,
  });

  final void Function(EditInformationItem editInformationItem)? submitFunction;
  final Key? editBtnKey;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: editBtnKey,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Text(
          editString,
          textAlign: TextAlign.center,
          style: TextThemes.normalSize14Text(AppColors.whiteColor),
        ),
      ),
    );
  }
}
