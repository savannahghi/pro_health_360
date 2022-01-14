// Flutter imports:
import 'package:afya_moja_core/phone_input.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/failures.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/custom_text_field.dart';
import 'package:afya_moja_core/inputs.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:misc_utilities/misc.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/profile/update_caregiver_information_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/caregiver_information.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/application/redux/view_models/profile/edit_caregiver_info_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:shared_themes/constants.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:shared_ui_components/platform_loader.dart';

class EditCaregiverInfoPage extends StatefulWidget {
  ///[EditCaregiverInfoPage] renders a form with inputs and a submit button
  ///Form can only be submitted when at least one input is altered
  const EditCaregiverInfoPage();

  @override
  State<EditCaregiverInfoPage> createState() => _EditCaregiverInfoPageState();
}

class _EditCaregiverInfoPageState extends State<EditCaregiverInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: editInfoTitle(myProfileCaregiverText),
        leadingWidget: SvgPicture.asset(
          closeIconSvg,
          color: AppColors.blueChillColor,
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: const EditCaregiverInfo(),
    );
  }
}

class EditCaregiverInfo extends StatefulWidget {
  const EditCaregiverInfo({Key? key}) : super(key: key);

  @override
  State<EditCaregiverInfo> createState() => _EditCaregiverInfoState();
}

class _EditCaregiverInfoState extends State<EditCaregiverInfo> {
  bool formIsEdited = false;
  String? phoneNumber;

  late String dropdownValue;

  final TextEditingController firstNameTextController = TextEditingController();
  final TextEditingController lastNameTextController = TextEditingController();
  final TextEditingController phoneNumberInputController =
      TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    dropdownValue = StoreProvider.state<AppState>(context)
            ?.miscState
            ?.caregiverInformation
            ?.caregiverType
            ?.name ??
        father;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CaregiverInfoViewModel>(
      converter: (Store<AppState> store) {
        return CaregiverInfoViewModel.fromState(store.state);
      },
      onInit: (Store<AppState> store) {
        final CaregiverInformation? info =
            store.state.miscState?.caregiverInformation;

        firstNameTextController.text = info?.firstName ?? '';
        lastNameTextController.text = info?.lastName ?? '';
        phoneNumberInputController.text = info?.phoneNumber ?? '';
      },
      builder: (BuildContext context, CaregiverInfoViewModel vm) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        myProfileCaregiverText,
                        style: TextThemes.boldSize16Text(
                          AppColors.secondaryColor,
                        ),
                      ),
                      verySmallVerticalSizedBox,
                      Text(
                        myProfileCaregiverDescriptionText,
                        style: TextThemes.normalSize14Text(
                          AppColors.greyTextColor,
                        ),
                      ),
                      smallVerticalSizedBox,
                      Text(
                        firstName,
                        style: TextThemes.boldSize14Text(
                          AppColors.greyTextColor,
                        ),
                      ),
                      smallVerticalSizedBox,
                      CustomTextField(
                        formFieldKey: const ValueKey<String>('0'),
                        borderColor: Colors.grey[200],
                        keyboardType: TextInputType.text,
                        controller: firstNameTextController,
                        hintText: jane,
                        autovalidateMode: AutovalidateMode.disabled,
                        onChanged: (String? value) {
                          ///So that it only runs once when an input is modified
                          if (!formIsEdited) {
                            setState(() {
                              formIsEdited = true;
                            });
                          }
                        },
                      ),
                      smallVerticalSizedBox,
                      Text(
                        lastName,
                        style: TextThemes.boldSize14Text(
                          AppColors.greyTextColor,
                        ),
                      ),
                      smallVerticalSizedBox,
                      CustomTextField(
                        formFieldKey: const ValueKey<String>('1'),
                        borderColor: Colors.grey[200],
                        keyboardType: TextInputType.text,
                        controller: lastNameTextController,
                        hintText: doe,
                        autovalidateMode: AutovalidateMode.disabled,
                        onChanged: (String? value) {
                          ///So that it only runs once when an input is modified
                          if (!formIsEdited) {
                            setState(() {
                              formIsEdited = true;
                            });
                          }
                        },
                      ),
                      smallVerticalSizedBox,
                      Text(
                        phoneNumberString,
                        style: TextThemes.boldSize14Text(
                          AppColors.greyTextColor,
                        ),
                      ),
                      MyAfyaHubPhoneInput(
                        phoneNumberFormatter: formatPhoneNumber,
                        inputController: phoneNumberInputController,
                        labelText: enterPhoneNumberString,
                        initialValue: phoneNumberInputController.text,
                        onChanged: (String? val) {
                          if (!formIsEdited) {
                            setState(() {
                              formIsEdited = true;
                            });
                          }

                          setState(() {
                            phoneNumber = val;
                          });
                        },
                      ),
                      smallVerticalSizedBox,
                      Text(
                        relationText,
                        style: TextThemes.boldSize14Text(
                          AppColors.greyTextColor,
                        ),
                      ),
                      smallVerticalSizedBox,
                      EditInformationDropDown(
                        value: dropdownValue,
                        items: CaregiverType.values
                            .map<String>((CaregiverType type) => type.name)
                            .toList(),
                        onChange: (String? value) {
                          // So that it only runs once when an input is modified
                          if (!formIsEdited) {
                            setState(() {
                              formIsEdited = true;
                            });
                          }

                          if (value != null) {
                            setState(() {
                              dropdownValue = value;
                            });
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
              StoreConnector<AppState, AppStateViewModel>(
                converter: (Store<AppState> store) =>
                    AppStateViewModel.fromStore(store),
                builder: (BuildContext context, AppStateViewModel vm) {
                  return Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: (vm.appState.wait!
                              .isWaitingFor(editInformationFlag))
                          ? const SILPlatformLoader()
                          : MyAfyaHubPrimaryButton(
                              buttonKey: editInfoSaveBtn,
                              onPressed: formIsEdited
                                  ? () async {
                                      final CaregiverInformation info =
                                          CaregiverInformation(
                                        firstName: firstNameTextController.text,
                                        lastName: lastNameTextController.text,
                                        phoneNumber: phoneNumber,
                                        caregiverType: caregiverTypeFromString(
                                          dropdownValue,
                                        ),
                                      );

                                      try {
                                        await StoreProvider.dispatch(
                                          context,
                                          UpdateCaregiverInfoAction(
                                            caregiverInformation: info,
                                            graphQlClient:
                                                AppWrapperBase.of(context)!
                                                    .graphQLClient,
                                          ),
                                        );

                                        Navigator.of(context).pop();
                                      } on SILException catch (exception) {
                                        ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                exception.message.toString(),
                                              ),
                                              duration: const Duration(
                                                seconds: kShortSnackBarDuration,
                                              ),
                                              action: dismissSnackBar(
                                                closeString,
                                                Colors.white,
                                                context,
                                              ),
                                            ),
                                          );
                                      } catch (e) {
                                        ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(
                                            SnackBar(
                                              content: const Text(
                                                genericErrorOccurred,
                                              ),
                                              duration: const Duration(
                                                seconds: kShortSnackBarDuration,
                                              ),
                                              action: dismissSnackBar(
                                                closeString,
                                                Colors.white,
                                                context,
                                              ),
                                            ),
                                          );
                                      }
                                    }
                                  : null,
                              buttonColor: formIsEdited
                                  ? AppColors.secondaryColor
                                  : Colors.grey,
                              borderColor: formIsEdited
                                  ? AppColors.secondaryColor
                                  : Colors.transparent,
                              text: toBeginningOfSentenceCase(saveString),
                            ),
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
