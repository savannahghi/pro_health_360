// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/set_nickname_action.dart';
import 'package:myafyahub/application/redux/actions/update_onboarding_state_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/client_profile_view_model.dart';
import 'package:myafyahub/domain/core/entities/profile/edit_information_item.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/personal_information_widget.dart';
import 'package:myafyahub/presentation/profile/widgets/edit_info_button_widget.dart';
import 'package:shared_themes/spaces.dart';

/// [SettingsPage] is used to display the client's settings
///
/// the nickname will be accessed from the state
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const CustomAppBar(title: settingsPageTitle),
      body: SafeArea(
        child: StoreConnector<AppState, ClientProfileViewModel>(
          converter: (Store<AppState> store) =>
              ClientProfileViewModel.fromStore(store),
          builder: (BuildContext context, ClientProfileViewModel vm) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        largeVerticalSizedBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              nickNameString,
                              style: boldSize15Text(
                                AppColors.secondaryColor,
                              ),
                            ),
                            EditInformationButtonWidget(
                              editInformationItem: nickNameEditInfo(
                                vm.clientState?.user?.username ?? UNKNOWN,
                              ),
                              submitFunction:
                                  (EditInformationItem editInformationItem) {
                                final String newNickname = editInformationItem
                                    .editInformationInputItem[0]
                                    .inputController
                                    .text;

                                ///Set username/NickName to the new nickname
                                StoreProvider.dispatch<AppState>(
                                  context,
                                  UpdateOnboardingStateAction(
                                    nickName: newNickname,
                                  ),
                                );

                                StoreProvider.dispatch<AppState>(
                                  context,
                                  SetNicknameAction(
                                    client: AppWrapperBase.of(context)!
                                        .graphQLClient,
                                    flag: editInformationFlag,
                                    shouldNavigate: false,
                                    onSuccess: () {
                                      showTextSnackbar(
                                        ScaffoldMessenger.of(context),
                                        content: nicknameSuccessString,
                                      );
                                    },
                                    onError: (String error) {
                                      StoreProvider.dispatch<AppState>(
                                        context,
                                        UpdateUserProfileAction(
                                          nickName:
                                              vm.clientState?.user?.username ??
                                                  '',
                                        ),
                                      );

                                      showTextSnackbar(
                                        ScaffoldMessenger.of(context),
                                        content: error,
                                      );
                                    },
                                  ),
                                );

                                ///Will return to the previous page after submitting
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        smallVerticalSizedBox,
                        PersonalInformationWidget(
                          description:
                              vm.clientState?.user?.username ?? UNKNOWN,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
