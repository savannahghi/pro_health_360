// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
// Project imports:
import 'package:myafyahub/application/redux/actions/accept_terms_and_conditions_action.dart';
import 'package:myafyahub/application/redux/actions/get_terms_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/entities/terms_and_conditions/terms_and_conditions.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_ui_components/platform_loader.dart';
import 'package:unicons/unicons.dart';

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
        GetTermsAction(context: context),
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
          child: StoreConnector<AppState, AppStateViewModel>(
            converter: (Store<AppState> store) =>
                AppStateViewModel.fromStore(store),
            builder: (BuildContext context, AppStateViewModel vm) {
              final TermsAndConditions? termsObject =
                  vm.appState.onboardingState!.termsAndConditions;
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
                      style: normalSize16Text(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                    body: Text(
                      readAndAcceptText,
                      style: normalSize14Text(Colors.grey),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child:
                                  vm.appState.wait!.isWaitingFor(getTermsFlag)
                                      ? Container(
                                          height: 300,
                                          padding: const EdgeInsets.all(20),
                                          child: const SILPlatformLoader(),
                                        )
                                      : SizedBox(
                                          width: double.infinity,
                                          child: Html(
                                            data: vm.appState.onboardingState!
                                                .termsAndConditions!.text,
                                          ),
                                        ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Accepts terms check box
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: CheckBoxComponent(
                      text: acceptTermsText,
                      value: isAgreed,
                      color: AppColors.secondaryColor,
                      onChanged: (bool? value) async {
                        setState(() {
                          isAgreed = value!;
                        });
                        if (vm.appState.onboardingState!.termsAndConditions!
                                .text !=
                            UNKNOWN) {
                          setState(() {
                            isAgreed = value!;
                          });
                        }
                      },
                    ),
                  ),

                  smallVerticalSizedBox,

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
                            borderColor:
                                termsObject!.text != UNKNOWN && isAgreed
                                    ? AppColors.secondaryColor
                                    : Colors.grey,
                            buttonColor: termsObject.text != UNKNOWN && isAgreed
                                ? AppColors.secondaryColor
                                : Colors.grey,
                            onPressed: !isAgreed
                                ? null
                                : () {
                                    StoreProvider.dispatch(
                                      context,
                                      UpdateUserProfileAction(
                                        termsAccepted: true,
                                      ),
                                    );

                                    StoreProvider.dispatch<AppState>(
                                      context,
                                      // Accept terms and conditions
                                      AcceptTermsAndConditionsAction(
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
