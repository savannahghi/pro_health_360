// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';
import 'package:user_feed/user_feed.dart';

// Project imports:
import 'package:myafyahub/application/core/services/connectivity_helper.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/update_bio_data_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/event_obj.dart';
import 'package:myafyahub/domain/core/entities/login/basic_details_model.dart';
import 'package:myafyahub/domain/core/entities/login/onboarding_behavior_subject.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/events.dart';

class BasicDetailsPage extends StatefulWidget {
  @override
  _BasicDetailsPageState createState() => _BasicDetailsPageState();
}

class _BasicDetailsPageState extends State<BasicDetailsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController dateOfBirthTextController = TextEditingController();
  TextEditingController firstNameCont = TextEditingController();
  TextEditingController lastNameCont = TextEditingController();

  FocusNode firstNameNode = FocusNode();
  FocusNode lastNameNode = FocusNode();

  UserBasicDetails userBasicDetails = UserBasicDetails();
  OnboardingAppBarValuesSubject onboardingAppBarS =
      OnboardingAppBarValuesSubject();

  @override
  void didChangeDependencies() {
    final BioData? bioData = StoreProvider.state<AppState>(context)!
        .userProfileState!
        .userProfile!
        .userBioData;
    if (bioData != null) {
      if (bioData.firstName != null &&
          bioData.firstName!.getValue() != UNKNOWN) {
        firstNameCont.value = firstNameCont.value.copyWith(
          text: bioData.firstName!.getValue(),
        );
      }
      if (bioData.lastName != null && bioData.lastName!.getValue() != UNKNOWN) {
        lastNameCont.value = lastNameCont.value.copyWith(
          text: bioData.lastName!.getValue(),
        );
      }
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    firstNameNode.dispose();
    lastNameNode.dispose();
    firstNameCont.dispose();
    lastNameCont.dispose();
    dateOfBirthTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final OnboardingStrings onBoardingStringClass =
        OnboardingStrings.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: StoreConnector<AppState, AppStateViewModel>(
          converter: (Store<AppState> store) =>
              AppStateViewModel.fromStore(store),
          builder: (BuildContext context, AppStateViewModel vm) {
            /// get the values from state
            final String? firstNameFromState = vm
                .appState.userProfileState?.userProfile?.userBioData?.firstName
                ?.getValue();
            final String? lastNameFromState = vm
                .appState.userProfileState?.userProfile?.userBioData?.lastName
                ?.getValue();
            final Gender? genderFromState =
                vm.appState.userProfileState?.userProfile?.userBioData?.gender;
            final String? dateOfBirthFromState = vm.appState.userProfileState
                ?.userProfile?.userBioData?.dateOfBirth;
            final String appContext =
                getEnvironmentContext(AppWrapperBase.of(context)!.appContexts);

            bool firstNameStateIsEmpty;
            bool firstNameSubjectIsEmpty;

            bool lastNameStateIsEmpty;
            bool lastNameSubjectIsEmpty;

            bool genderStateIsEmpty;
            bool genderSubjectIsEmpty;

            bool dobStateIsEmpty;
            bool dobSubjectIsEmpty;

            /// [firstName]
            if (firstNameFromState == null ||
                firstNameFromState.isEmpty ||
                firstNameFromState == UNKNOWN) {
              firstNameStateIsEmpty = true;
            } else {
              firstNameStateIsEmpty = false;
            }

            if (userBasicDetails.firstName.valueOrNull?.value == null ||
                userBasicDetails.firstName.valueOrNull?.getValue() == UNKNOWN) {
              firstNameSubjectIsEmpty = true;
            } else {
              firstNameSubjectIsEmpty = false;
            }

            /// [lastName]
            if (lastNameFromState == null ||
                lastNameFromState.isEmpty ||
                lastNameFromState == UNKNOWN) {
              lastNameStateIsEmpty = true;
            } else {
              lastNameStateIsEmpty = false;
            }

            if (userBasicDetails.lastName.valueOrNull?.value == null ||
                userBasicDetails.lastName.valueOrNull?.getValue() == UNKNOWN) {
              lastNameSubjectIsEmpty = true;
            } else {
              lastNameSubjectIsEmpty = false;
            }

            /// [gender]
            if (genderFromState == null) {
              genderStateIsEmpty = true;
            } else {
              genderStateIsEmpty = false;
            }

            if (userBasicDetails.gender.valueOrNull == null) {
              genderSubjectIsEmpty = true;
            } else {
              genderSubjectIsEmpty = false;
            }

            /// [dob]
            if (dateOfBirthFromState == null ||
                dateOfBirthFromState.isEmpty ||
                dateOfBirthFromState == UNKNOWN) {
              dobStateIsEmpty = true;
            } else {
              dobStateIsEmpty = false;
            }

            if (userBasicDetails.dateOfBirth.valueOrNull == null ||
                userBasicDetails.dateOfBirth.valueOrNull == '' ||
                userBasicDetails.dateOfBirth.valueOrNull == UNKNOWN) {
              dobSubjectIsEmpty = true;
            } else {
              dobSubjectIsEmpty = false;
            }

            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          preferredPaddingOnStretchedScreens(context: context),
                      vertical: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(personalDetails,
                          style: TextThemes.boldSize24Text(
                              Theme.of(context).primaryColor)),
                      smallVerticalSizedBox,
                      Text(
                        personalDetailsDesc,
                        style:
                            TextThemes.normalSize14Text().copyWith(height: 1.4),
                      ),
                      largeVerticalSizedBox,

                      Text(onBoardingStringClass.enterFirstNameText()),
                      mediumVerticalSizedBox,
                      SILFormTextField(
                        key: firstNameKey,
                        enabled: !vm.appState.wait!
                            .isWaitingFor(updateBasicDetailsFlag),
                        autoFocus: true,
                        focusNode: firstNameNode,
                        labelText: onBoardingStringClass.firstNameText(),
                        borderColor: Colors.grey[300],
                        controller: firstNameCont,
                        onFieldSubmit: (dynamic val) {
                          lastNameNode.requestFocus();
                        },
                        validator: (dynamic value) {
                          if (value.toString().isEmpty) {
                            return onBoardingStringClass
                                .firstNameRequiredText();
                          }

                          return null;
                        },
                        onChanged: (dynamic value) {
                          userBasicDetails.setUserProfileVariables(
                              value.toString().trim(),
                              BasicDetailType.firstName);

                          setState(() {});
                        },
                      ),
                      largeVerticalSizedBox,

                      Text(onBoardingStringClass.enterLastNameText()),
                      smallVerticalSizedBox,
                      SILFormTextField(
                        key: lastNameKey,
                        enabled: !vm.appState.wait!
                            .isWaitingFor(updateBasicDetailsFlag),
                        labelText: onBoardingStringClass.lastNameText(),
                        borderColor: Colors.grey[300],
                        focusNode: lastNameNode,
                        controller: lastNameCont,
                        onFieldSubmit: (dynamic val) {
                          lastNameNode.unfocus();
                        },
                        validator: (dynamic value) {
                          if (value.toString().isEmpty) {
                            return onBoardingStringClass.lastNameRequiredText();
                          }
                          return null;
                        },
                        onChanged: (dynamic value) {
                          userBasicDetails.setUserProfileVariables(
                              value.toString().trim(),
                              BasicDetailType.lastName);

                          setState(() {});
                        },
                      ),

                      largeVerticalSizedBox,
                      Text(onBoardingStringClass.dateOfBirthText()),
                      smallVerticalSizedBox,
                      SILDatePickerField(
                        allowEligibleDate: true,
                        validator: (dynamic value) {
                          if (value.toString().isEmpty) {
                            return onBoardingStringClass
                                .dateOfBirthRequiredText();
                          }
                          return null;
                        },
                        controller: dateOfBirthTextController,
                        labelText: dateLabelText,
                        onChanged: (dynamic value) {
                          userBasicDetails.setUserProfileVariables(
                              value.toString(), BasicDetailType.dateOfBirth);
                          setState(() {});
                        },
                      ),

                      largeVerticalSizedBox,
                      const Text('Gender'),
                      smallVerticalSizedBox,
                      SILSelectOptionField(
                        dropDownInputKey: genderOptionFieldKey,
                        hintText: onBoardingStringClass.selectGenderText(),
                        value: userBasicDetails.gender.valueOrNull!.name,
                        options: userBasicDetails.genderTypes,
                        onChanged: (dynamic value) {
                          userBasicDetails.setUserProfileVariables(
                              value.toString().trim(), BasicDetailType.gender);
                          setState(() {});
                        },
                      ),

                      /// submit the data
                      mediumVerticalSizedBox,
                      if (vm.appState.wait!
                          .isWaitingFor(updateBasicDetailsFlag)) ...<Widget>[
                        const Center(child: SILPlatformLoader()),
                        size15VerticalSizedBox,
                      ],

                      if (!vm.appState.wait!
                          .isWaitingFor(updateBasicDetailsFlag))
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          width: double.infinity,
                          height: 52,
                          child: SILPrimaryButton(
                            buttonKey: primaryButtonKey,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                if (userBasicDetails.gender.valueOrNull ==
                                    Gender.unknown) {
                                  userBasicDetails.setUserProfileVariables(
                                      genderFromState.toString(),
                                      BasicDetailType.gender);
                                  showFeedbackBottomSheet(
                                    context: context,
                                    modalContent: genderRequired,
                                    imageAssetPath: errorIconUrl,
                                  );

                                  return;
                                }

                                // check if required details are filled
                                if (firstNameStateIsEmpty &&
                                        firstNameSubjectIsEmpty ||
                                    lastNameStateIsEmpty &&
                                        lastNameSubjectIsEmpty ||
                                    genderStateIsEmpty &&
                                        genderSubjectIsEmpty ||
                                    dobStateIsEmpty && dobSubjectIsEmpty) {
                                  return;
                                }

                                userBasicDetails.firstName
                                    .add(Name.withValue(firstNameCont.text));
                                userBasicDetails.lastName
                                    .add(Name.withValue(lastNameCont.text));

                                await StoreProvider.dispatch<AppState>(
                                  context,
                                  UpdateBioDataAction(
                                    flag: updateBasicDetailsFlag,
                                    context: context,
                                    userBasicDetails: userBasicDetails,
                                  ),
                                );

                                publishEvent(
                                  hasUpdatedProfileSuccessfullyEvent(
                                      appContext),
                                  EventObject(
                                    firstName: vm.appState.userProfileState!
                                        .userProfile!.userBioData!.firstName!
                                        .getValue(),
                                    lastName: vm.appState.userProfileState!
                                        .userProfile!.userBioData!.lastName!
                                        .getValue(),
                                    uid:
                                        vm.appState.userProfileState!.auth!.uid,
                                    flavour: Flavour.CONSUMER.name,
                                    timestamp: DateTime.now(),
                                  ),
                                );
                              }
                            },
                            buttonColor:
                                Theme.of(context).colorScheme.secondary,
                            borderColor: Colors.transparent,
                            text: onBoardingStringClass.saveContinueText(),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
