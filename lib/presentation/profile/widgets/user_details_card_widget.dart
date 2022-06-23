// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:pro_health_360/application/core/services/utils.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/client_profile_view_model.dart';
import 'package:pro_health_360/domain/core/entities/core/user.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';

class UserDetailsCard extends StatelessWidget {
  /// [UserDetailsCard] is a shared widget used in [UserProfilePage]

  const UserDetailsCard();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ClientProfileViewModel>(
      converter: (Store<AppState> store) =>
          ClientProfileViewModel.fromStore(store),
      builder: (BuildContext context, ClientProfileViewModel vm) {
        final User? user = vm.clientState?.user;
        final bool addressIsEmpty = vm.clientState?.addresses?.isEmpty ?? true;
        final String address = addressIsEmpty
            ? locationNotRecorded
            : vm.clientState?.addresses?.first.text ?? locationNotRecorded;

        final String phone = user?.primaryContact?.value ?? UNKNOWN;
        final String name = getDisplayName(user);
        final String cccNumber = vm.clientState?.cccNumber ?? UNKNOWN;
        final String dateOfBirth = vm.clientState?.user?.dateOfBirth ?? UNKNOWN;
        final String age = calculateAge(dateOfBirth);
        final String nickName = vm.clientState?.user?.username ?? '';

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: AppColors.extraLightGray,
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurRadius: 5,
                color: Colors.grey.withOpacity(0.2),
              )
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                child: Text(
                  extractNamesInitials(name: name),
                  style: const TextStyle(
                    fontSize: 22,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              smallHorizontalSizedBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: const TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  smallVerticalSizedBox,
                  Text(
                    'CCC No: $cccNumber',
                    style: const TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  smallVerticalSizedBox,
                  Text(
                    'Age: $age yrs',
                    style: const TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  smallVerticalSizedBox,
                  Text(
                    'Nickname: $nickName',
                    style: const TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  largeVerticalSizedBox,
                  Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        phoneCallIcon,
                        color: AppColors.secondaryColor,
                        width: 14,
                        height: 18,
                      ),
                      size15HorizontalSizedBox,
                      Text(
                        phone,
                        style: const TextStyle(
                          color: AppColors.secondaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  size15VerticalSizedBox,
                  Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        homeLocationIcon,
                        color: AppColors.secondaryColor,
                        width: 15,
                        height: 15,
                      ),
                      size15HorizontalSizedBox,
                      Text(
                        address,
                        style: const TextStyle(
                          color: AppColors.secondaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
