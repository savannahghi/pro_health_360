import 'package:flutter/material.dart';

import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/profile/fetch_caregiver_information_action.dart';
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
// Package imports:
import 'package:shared_themes/spaces.dart';

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
          },
          converter: (Store<AppState> store) {
            return ClientProfileViewModel.fromStore(store);
          },
          builder: (BuildContext context, ClientProfileViewModel vm) {
            if (vm.wait!.isWaitingFor(fetchCaregiverInformationFlag)) {
              return const PlatformLoader();
            } else {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                          editInformationItem: careGiverEditInfo(vm: vm),
                          vm: vm,
                          submitFunction:
                              (EditInformationItem editInformationItem) {
                            final Map<String, dynamic> variables =
                                <String, dynamic>{};

                            for (final EditInformationInputItem element
                                in editInformationItem
                                    .editInformationInputItem) {
                              variables[element.apiFieldValue] =
                                  element.inputController.text;
                            }
                            variables['clientID'] = vm.clientState!.id;
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
                    PersonalInformationSecondaryWidget(
                      fieldName: firstName,
                      fieldValue:
                          vm.clientState?.careGiverInformation?.firstName ??
                              janeDoe,
                    ),
                    verySmallVerticalSizedBox,
                    PersonalInformationSecondaryWidget(
                      fieldName: phoneNumber,
                      fieldValue:
                          vm.clientState?.careGiverInformation?.phoneNumber ??
                              hotlineNumberString,
                    ),
                    verySmallVerticalSizedBox,
                    PersonalInformationSecondaryWidget(
                      fieldName: relationText,
                      fieldValue: vm.clientState?.careGiverInformation
                              ?.caregiverType?.name ??
                          father,
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
