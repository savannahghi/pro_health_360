// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:misc_utilities/misc.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/buttons.dart';
import 'package:shared_ui_components/inputs.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/edit_profile_page_behavior_object.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/profile/widgets/text_field_label.dart';

class EditProfileForm extends StatefulWidget {
  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  late String dateOfBirthFromState;
  late String displayNameFromState;
  EditProfilePageBehaviorObject editProfilePageBehaviorObject =
      EditProfilePageBehaviorObject();

  TextEditingController firstNameController = TextEditingController();
  late String firstNameFromState;
  String? gender;
  TextEditingController genderController = TextEditingController();
  late Gender genderFromState;
  TextEditingController lastNameController = TextEditingController();
  late String lastNameFromState;
  bool launched = false;

  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final GlobalKey<FormState> _userProfileFormKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    if (!launched) {
      final BioData bioData = StoreProvider.state<AppState>(context)!
          .userProfileState!
          .userProfile!
          .userBioData!;

      firstNameFromState = bioData.firstName!.getValue();

      lastNameFromState = bioData.lastName!.getValue();
      genderFromState = bioData.gender!;

      displayNameFromState = '$firstNameFromState $lastNameFromState';

      firstNameController.text = titleCase(firstNameFromState);
      lastNameController.text = titleCase(lastNameFromState);
      genderController.text = genderFromState.name;
      gender = genderFromState.name;
      launched = true;
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final OnboardingStrings onBoardingStringClass =
        OnboardingStrings.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: preferredPaddingOnStretchedScreens(context: context)),
      child: Form(
        key: _userProfileFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            largeVerticalSizedBox,

            // first name
            const TextFieldLabel(label: 'First Name*'),
            smallVerticalSizedBox,
            SILFormTextField(
              key: editProfileFirstNameKey,
              focusNode: _firstNameFocusNode,
              controller: firstNameController,
              validator: (dynamic value) {
                if (value.toString().isEmpty) {
                  return 'First name is required';
                }
                return null;
              },
            ),
            largeVerticalSizedBox,

            // last name
            const TextFieldLabel(label: 'Last Name*'),
            smallVerticalSizedBox,
            SILFormTextField(
              key: editProfileLastNameKey,
              validator: (dynamic value) {
                if (value.toString().isEmpty) {
                  return 'Last name is required';
                }
                return null;
              },
              focusNode: _lastNameFocusNode,
              controller: lastNameController,
            ),
            largeVerticalSizedBox,

            // gender
            const TextFieldLabel(label: 'Gender*'),
            smallVerticalSizedBox,
            SILSelectOptionField(
              dropDownInputKey: genderOptionFieldKey,
              hintText: onBoardingStringClass.selectGenderText(),
              value: gender,
              color: AppColors.whiteColor,
              options: kGenderTypes,
              onChanged: (dynamic value) {
                setState(() {
                  gender =
                      genderFromString(value.toString().toLowerCase()).name;
                });
                genderController.text = gender!;
              },
            ),

            largeVerticalSizedBox,
            if (editProfilePageBehaviorObject.loading.valueOrNull!)
              const SILPlatformLoader()
            else
              SizedBox(
                width: double.infinity,
                height: 52,
                child: SILPrimaryButton(
                  buttonKey: editProfileSaveKey,
                  onPressed: () async {
                    if (_userProfileFormKey.currentState!.validate()) {
                      if (gender == Gender.unknown.name) {
                        showFeedbackBottomSheet(
                          context: context,
                          modalContent: genderRequired,
                          imageAssetPath: errorIconUrl,
                        );

                        return;
                      }
                      await saveProfileDetails(
                        variables: <String, String>{
                          'firstName': firstNameController.value.text,
                          'lastName': lastNameController.value.text,
                          'gender': genderController.value.text.toLowerCase(),
                        },
                        checkGender: genderFromState.name.toString(),
                        checkDisplayName: displayNameFromState,
                        context: context,
                      );
                    }
                  },
                  buttonColor: Theme.of(context).colorScheme.secondary,
                  text: 'Save & Continue',
                ),
              )
          ],
        ),
      ),
    );
  }
}
