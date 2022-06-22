// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:pro_health_360/domain/core/entities/profile/edit_information_item.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class EditInformationButtonWidget extends StatelessWidget {
  ///[EditInformationButtonWidget] used to edit information in user profile
  const EditInformationButtonWidget({
    required this.editInformationItem,
    this.submitFunction,
    this.editBtnKey,
  });

  final EditInformationItem editInformationItem;
  final void Function(EditInformationItem editInformationItem)? submitFunction;
  final Key? editBtnKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: editBtnKey,
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.editInformationPage,
          arguments: <String, dynamic>{
            'editInformationItem': editInformationItem,
            'onSubmit': submitFunction
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Text(
          editString,
          textAlign: TextAlign.center,
          style: normalSize14Text(AppColors.whiteColor),
        ),
      ),
    );
  }
}
