// Flutter imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/redux/actions/accept_terms_and_conditions_action.dart';
import 'package:myafyahub/application/redux/actions/get_terms_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:afya_moja_core/checkbox_component.dart';
import 'package:myafyahub/application/redux/view_models/main_app_state_view_model.dart';

// Package imports:
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/platform_loader.dart';
import 'package:unicons/unicons.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:afya_moja_core/information_list_card.dart';
import 'package:afya_moja_core/buttons.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  _TermsAndConditionsPageState createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  bool isAgreed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => StoreProvider.dispatch<AppState>(
        context,
        // retrieve the terms & conditions
        GetTermsAction(
          context: context,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: StoreConnector<AppState, MainAppStateViewModel>(
            converter: (Store<AppState> store) =>
                MainAppStateViewModel.fromStore(store),
            builder: (BuildContext context, MainAppStateViewModel vm) {
              return Column(
                children: <Widget>[
                  // Terms and Conditions Card
                  InformationListCard(
                    leadingIcon: const Center(
                      child: Icon(
                        UniconsLine.file_lock_alt,
                        size: 32,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    title: Text(
                      portalTermsText,
                      style: TextThemes.normalSize16Text(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                    body: Text(
                      readAndAcceptText,
                      style: TextThemes.normalSize14Text(Colors.grey),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Terms and Conditions scrollable view
                  Expanded(
                    child: Scrollbar(
                      isAlwaysShown: true,
                      thickness: 10.0,
                      radius: const Radius.circular(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child:
                                  vm.appState.wait!.isWaitingFor(getTermsFlag)
                                      ? Container(
                                          height: 300,
                                          padding: const EdgeInsets.all(20),
                                          child: const SILPlatformLoader(),
                                        )
                                      : SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            vm.appState.onboardingState!
                                                .termsAndConditions!.text,
                                            style: TextThemes.normalSize15Text(
                                              AppColors.secondaryColor
                                                  .withOpacity(0.5),
                                            ).copyWith(height: 1.8),
                                          ),
                                        ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Accepts terms check box
                  CheckBoxComponent(
                    text: acceptTermsText,
                    value: isAgreed,
                    color: AppColors.secondaryColor,
                    onChanged: (bool? value) async {
                      if (vm.appState.onboardingState!.termsAndConditions!
                              .text !=
                          UNKNOWN) {
                        setState(() {
                          isAgreed = value!;
                        });
                      }
                    },
                  ),

                  // Continue button
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: vm.appState.wait!.isWaitingFor(acceptTermsFlag)
                        ? const SILPlatformLoader(
                            color: AppColors.secondaryColor,
                          )
                        : MyAfyaHubPrimaryButton(
                            text: continueString,
                            buttonColor: vm.appState.onboardingState!
                                            .termsAndConditions!.text !=
                                        UNKNOWN &&
                                    isAgreed
                                ? AppColors.secondaryColor
                                : Colors.grey,
                            onPressed: !isAgreed
                                ? null
                                : () {
                                    StoreProvider.dispatch<AppState>(
                                      context,
                                      // retrieve the terms and conditions
                                      AcceptTermsAndConditionsAction(
                                        termsId: vm.appState.onboardingState!
                                            .termsAndConditions!.termsId,
                                        userId: vm.appState.clientState!
                                            .clientProfile!.user!.userId!,
                                        context: context,
                                      ),
                                    );
                                  },
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
