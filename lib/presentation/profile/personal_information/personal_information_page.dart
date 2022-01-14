import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/profile/edit_caregiver_info_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/router/routes.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/personal_information_secondary_widget.dart';
import 'package:myafyahub/presentation/core/widgets/personal_information_widget.dart';
import 'package:myafyahub/presentation/profile/widgets/edit_info_button_widget.dart';

class PersonalInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: personalInfoPageTitle),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: <Widget>[
              // parent/caregiver/guardian details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        myProfileCaregiverText,
                        style: TextThemes.boldSize16Text(
                          AppColors.secondaryColor,
                        ),
                      ),
                      Text(
                        myProfileCaregiverDescriptionText,
                        style: TextThemes.normalSize14Text(
                          AppColors.greyTextColor,
                        ),
                      ),
                    ],
                  ),
                  EditInformationButtonWidget(
                    editBtnKey: editPersonalInfoKey,
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(BWRoutes.editCaregiverInformationPage);
                    },
                  ),
                ],
              ),

              mediumVerticalSizedBox,

              StoreConnector<AppState, CaregiverInfoViewModel>(
                converter: (Store<AppState> store) {
                  return CaregiverInfoViewModel.fromState(store.state);
                },
                builder: (BuildContext context, CaregiverInfoViewModel vm) {
                  return CaregiverInfoList(
                    firstNameValue: vm.firstName ?? '',
                    lastNameValue: vm.lastName ?? '',
                    phoneNumberValue: vm.phoneNumber ?? '',
                    caregiverType: vm.caregiverType ?? CaregiverType.Sibling,
                  );
                },
              ),

              largeVerticalSizedBox,

              //preferred language
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    preferredLanguage,
                    style:
                        TextThemes.normalSize16Text(AppColors.secondaryColor),
                  ),
                  EditInformationButtonWidget(
                    editBtnKey: editPreferredLanguageKey,
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        BWRoutes.editInformationPage,
                        arguments: <String, dynamic>{
                          'editInformationItem': preferredLanguageEditInfo,
                        },
                      );
                    },
                  ),
                ],
              ),
              smallVerticalSizedBox,
              const PersonalInformationWidget(description: english),
              largeVerticalSizedBox,

              //preferred clinic
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    preferredClinic,
                    style:
                        TextThemes.normalSize16Text(AppColors.secondaryColor),
                  ),
                  EditInformationButtonWidget(
                    editBtnKey: editPreferredClinicKey,
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        BWRoutes.editInformationPage,
                        arguments: <String, dynamic>{
                          'editInformationItem': preferredClinicEditInfo,
                        },
                      );
                    },
                  ),
                ],
              ),

              smallVerticalSizedBox,
              const PersonalInformationWidget(description: clinic),
              largeVerticalSizedBox,

              //preferred communication
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    preferredCommunication,
                    style:
                        TextThemes.normalSize16Text(AppColors.secondaryColor),
                  ),
                  EditInformationButtonWidget(
                    editBtnKey: editPreferredCommunicationKey,
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        BWRoutes.editInformationPage,
                        arguments: <String, dynamic>{
                          'editInformationItem': preferredCommunicationEditInfo,
                        },
                      );
                    },
                  ),
                ],
              ),
              smallVerticalSizedBox,
              const PersonalInformationWidget(description: inApp),
            ],
          ),
        ),
      ),
    );
  }
}

class CaregiverInfoList extends StatelessWidget {
  const CaregiverInfoList({
    Key? key,
    required this.firstNameValue,
    required this.lastNameValue,
    required this.phoneNumberValue,
    required this.caregiverType,
  }) : super(key: key);

  final String firstNameValue;
  final String lastNameValue;
  final String phoneNumberValue;
  final CaregiverType caregiverType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PersonalInformationSecondaryWidget(
          fieldName: firstName,
          fieldValue: firstNameValue,
        ),
        verySmallVerticalSizedBox,
        PersonalInformationSecondaryWidget(
          fieldName: lastName,
          fieldValue: lastNameValue,
        ),
        verySmallVerticalSizedBox,
        PersonalInformationSecondaryWidget(
          fieldName: phoneNumber,
          fieldValue: phoneNumberValue,
        ),
        verySmallVerticalSizedBox,
        PersonalInformationSecondaryWidget(
          fieldName: relationText,
          fieldValue: caregiverType.name,
        ),
      ],
    );
  }
}
