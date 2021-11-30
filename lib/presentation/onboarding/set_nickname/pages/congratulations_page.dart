// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:afya_moja_core/buttons.dart';
import 'package:afya_moja_core/custom_text_field.dart';
import 'package:afya_moja_core/onboarding_scaffold.dart';
import 'package:async_redux/async_redux.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:myafyahub/application/core/services/onboarding_utils.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/behavior_objects.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class SetNickNamePage extends StatefulWidget {
  @override
  _SetNickNamePageState createState() => _SetNickNamePageState();
}

class _SetNickNamePageState extends State<SetNickNamePage> {
  String? nickName;
  TextEditingController userNameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      title: setNickNamePageTitle(context: context),
      description: congratulationsPageDescription,
      child: StoreConnector<AppState, AppStateViewModel>(
        converter: (Store<AppState> store) =>
            AppStateViewModel.fromStore(store),
        builder: (BuildContext context, AppStateViewModel vm) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 1.8,
            child: Stack(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          nickNameString,
                          style: TextThemes.boldSize14Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                      ),
                      verySmallVerticalSizedBox,
                      CustomTextField(
                        formFieldKey: nameInputKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        borderColor: Colors.grey[200],
                        maxLines: 1,
                        keyboardType: TextInputType.name,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return nameInputValidateString;
                          }
                        },
                        onChanged: (String val) {
                          setState(() {
                            nickName = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                if (vm.appState.wait!
                    .isWaitingFor(setNickNameFlag)) ...<Widget>{
                  veryLargeVerticalSizedBox,
                  const SILPlatformLoader(
                    color: AppColors.secondaryColor,
                  ),
                },
                // TODO(eugene): Restore when content is available
                // SizedBox(height: sizedBoxHeight),
                // Text(
                //   importantInformationString,
                //   style: TextThemes.boldSize16Text(AppColors.secondaryColor),
                // ),
                // smallVerticalSizedBox,
                // MiniContentWidget(),
                // verySmallVerticalSizedBox,
                // MiniContentWidget(),
                // verySmallVerticalSizedBox,
                // MiniContentWidget(),
                // smallVerticalSizedBox,
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: MyAfyaHubPrimaryButton(
                      buttonKey: continueKey,
                      onPressed: vm.appState.wait!.isWaitingFor(setNickNameFlag)
                          ? null
                          : () async {
                              final bool? isFormValid =
                                  _formKey.currentState?.validate();
                              if (!InternetConnectivitySubject()
                                  .connectivitySubject
                                  .valueOrNull!) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(noInternetConnection),
                                  ),
                                );
                                return;
                              }
                              if (isFormValid != null &&
                                  isFormValid &&
                                  nickName != null) {
                                setUserNickname(
                                  nickName: nickName!,
                                  context: context,
                                );
                              }
                            },
                      buttonColor:
                          vm.appState.wait!.isWaitingFor(setNickNameFlag)
                              ? Colors.grey
                              : AppColors.secondaryColor,
                      borderColor:
                          vm.appState.wait!.isWaitingFor(setNickNameFlag)
                              ? Colors.grey
                              : AppColors.secondaryColor,
                      text: continueString,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}