import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/fetch_clinic_information_action.dart';
import 'package:myafyahub/application/redux/actions/profile/fetch_caregiver_information.dart';
import 'package:myafyahub/application/redux/actions/profile/update_caregiver_information_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/client_profile_view_model.dart';
import 'package:myafyahub/domain/core/entities/profile/caregiver_information.dart';
import 'package:myafyahub/domain/core/entities/profile/edit_information_item.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
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
        child: StoreConnector<AppState, ClientProfileViewModel>(
          onInit: (Store<AppState> store) {
            store.dispatch(
              FetchCaregiverInformationAction(
                client: AppWrapperBase.of(context)!.graphQLClient,
              ),
            );
            store.dispatch(FetchClinicInformationAction(context: context));
          },
          converter: (Store<AppState> store) {
            return ClientProfileViewModel.fromStore(store);
          },
          builder: (BuildContext context, ClientProfileViewModel vm) {
            if (vm.wait!.isWaitingFor(fetchCaregiverInfoFlag)) {
              return Container(
                height: 300,
                padding: const EdgeInsets.all(20),
                child: const PlatformLoader(),
              );
            } else {
              final CaregiverInformation? caregiverInformation =
                  vm.clientState?.caregiverInformation;
              final String firstName =
                  ((caregiverInformation?.firstName ?? jane) == UNKNOWN)
                      ? jane
                      : caregiverInformation?.firstName ?? jane;
              final String lastName =
                  ((caregiverInformation?.lastName ?? doe) == UNKNOWN)
                      ? doe
                      : caregiverInformation?.lastName ?? doe;
              final String fullNames = '$firstName $lastName';
              final String phoneNumberVal =
                  ((caregiverInformation?.phoneNumber ?? hotlineNumberString) ==
                          UNKNOWN)
                      ? hotlineNumberString
                      : caregiverInformation?.phoneNumber ??
                          hotlineNumberString;

              final String relation = caregiverInformation!.caregiverType!.name;
              final String facilityName = vm.facilityName ?? clinic;

              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  children: <Widget>[
                    // parent/caregiver/guardian details
                    if (vm.clientState?.hasCareGiverInfo ?? false)
                      Column(
                        children: <Widget>[
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
                                  verySmallVerticalSizedBox,
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
                                editInformationItem: getEditCareGiverInfo(
                                  caregiverInformation: caregiverInformation,
                                ),
                                submitFunction:
                                    (EditInformationItem editInformationItem) {
                                  final Map<String, dynamic> variables =
                                      <String, dynamic>{};

                                  for (final EditInformationInputItem element
                                      in editInformationItem
                                          .editInformationInputItem) {
                                    if (element
                                        .inputController.text.isNotEmpty) {
                                      variables[element.apiFieldValue] =
                                          element.inputController.text;
                                    } else {
                                      variables[element.apiFieldValue] =
                                          element.hintText;
                                    }
                                  }

                                  final CaregiverInformation info =
                                      CaregiverInformation.fromJson(variables);

                                  StoreProvider.dispatch(
                                    context,
                                    UpdateCaregiverInfoAction(
                                      caregiverInformation: info,
                                      client: AppWrapperBase.of(context)!
                                          .graphQLClient,
                                      onSuccess: () {
                                        Navigator.of(context).pop();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text(caregiverInfoSavedSuccess),
                                          ),
                                        );
                                        // in order to fetch the new values
                                        StoreProvider.dispatch(
                                          context,
                                          FetchCaregiverInformationAction(
                                            client: AppWrapperBase.of(context)!
                                                .graphQLClient,
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          mediumVerticalSizedBox,
                          PersonalInformationSecondaryWidget(
                            fieldName: fullName,
                            fieldValue: fullNames,
                          ),
                          verySmallVerticalSizedBox,
                          PersonalInformationSecondaryWidget(
                            fieldName: phoneNumber,
                            fieldValue: phoneNumberVal,
                          ),
                          verySmallVerticalSizedBox,
                          PersonalInformationSecondaryWidget(
                            fieldName: relationText,
                            fieldValue: relation,
                          ),
                          largeVerticalSizedBox,
                        ],
                      )
                    else
                      Container(),

                    //preferred language
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          preferredLanguage,
                          style: normalSize16Text(AppColors.secondaryColor),
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
                      ],
                    ),

                    smallVerticalSizedBox,
                    PersonalInformationWidget(description: facilityName),
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
                      ],
                    ),
                    smallVerticalSizedBox,
                    const PersonalInformationWidget(description: inApp),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
