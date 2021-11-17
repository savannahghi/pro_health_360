import 'package:flutter/cupertino.dart';
import 'package:myafyahub/domain/core/entities/profile/edit_information_item.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/text_themes.dart';

class EditInformationButtonWidget extends StatelessWidget {
  ///[EditInformationButtonWidget] used to edit information in user profile
  const EditInformationButtonWidget({
    required this.editInformationItem,
  });

  final EditInformationItem editInformationItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          BWRoutes.editInformationPage,
          arguments: editInformationItem,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.userInitialsColor,
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