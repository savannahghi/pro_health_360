import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/profile/update_caregiver_information_action.dart';
import 'package:myafyahub/domain/core/entities/profile/caregiver_information.dart';
import 'package:myafyahub/domain/core/entities/profile/edit_information_item.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/personal_information_secondary_widget.dart';
import 'package:myafyahub/presentation/core/widgets/personal_information_widget.dart';
import 'package:myafyahub/presentation/profile/widgets/edit_info_button_widget.dart';
// Package imports:
import 'package:shared_themes/spaces.dart';

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
                        style: boldSize16Text(
                          AppColors.secondaryColor,
                        ),
                      ),
                      Text(
                        myProfileCaregiverDescriptionText,
                        style: normalSize14Text(
                          AppColors.greyTextColor,
                        ),
                      ),
                    ],
                  ),
                  EditInformationButtonWidget(
                    editBtnKey: editPersonalInfoKey,
                    editInformationItem: careGiverEditInfo,
                    submitFunction: (EditInformationItem editInformationItem) {
                      final Map<String, dynamic> variables =
                          <String, dynamic>{};

                      for (final EditInformationInputItem element
                          in editInformationItem.editInformationInputItem) {
                        variables[element.apiFieldValue] =
                            element.inputController.text;
                      }

                      final CaregiverInformation info =
                          CaregiverInformation.fromJson(variables);

                      StoreProvider.dispatch(
                        context,
                        UpdateCaregiverInfoAction(
                          caregiverInformation: info,
                          graphQlClient:
                              AppWrapperBase.of(context)!.graphQLClient,
                        ),
                      );
                    },
                  ),
                ],
              ),

              mediumVerticalSizedBox,
              const PersonalInformationSecondaryWidget(
                fieldName: firstName,
                fieldValue: janeDoe,
              ),
              verySmallVerticalSizedBox,
              const PersonalInformationSecondaryWidget(
                fieldName: phoneNumber,
                fieldValue: hotlineNumberString,
              ),
              verySmallVerticalSizedBox,
              const PersonalInformationSecondaryWidget(
                fieldName: relationText,
                fieldValue: father,
              ),
              largeVerticalSizedBox,

              //preferred language
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    preferredLanguage,
                    style: normalSize16Text(AppColors.secondaryColor),
                  ),
                  EditInformationButtonWidget(
                    editInformationItem: preferredLanguageEditInfo,
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
                    style: normalSize16Text(AppColors.secondaryColor),
                  ),
                  EditInformationButtonWidget(
                    editInformationItem: preferredClinicEditInfo,
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
                    style: normalSize16Text(AppColors.secondaryColor),
                  ),
                  EditInformationButtonWidget(
                    editInformationItem: preferredCommunicationEditInfo,
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
