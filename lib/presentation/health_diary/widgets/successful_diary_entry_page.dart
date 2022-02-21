// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/update_health_diary_state.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/client_profile_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';

class SuccessfulDiaryEntryPage extends StatelessWidget {
  const SuccessfulDiaryEntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 28),
          child: StoreConnector<AppState, ClientProfileViewModel>(
            converter: (Store<AppState> store) =>
                ClientProfileViewModel.fromStore(store),
            builder: (BuildContext context, ClientProfileViewModel vm) {
              final String userName =
                  vm.clientState?.user?.firstName ?? UNKNOWN;
              final bool hasSharedEntry = vm.clientState!.healthDiaryState!
                      .shouldNotShareHealthRecord ??
                  false;

              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 30),
                    SvgPicture.asset(
                      successfulEntryImage,
                      height: 286.0,
                      width: 286.0,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      diaryEntrySuccessfulText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            getSuccessfulBodyText(userName),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: AppColors.greyTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (hasSharedEntry) ...<Widget>[
                      mediumVerticalSizedBox,
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                text: mightTakeSomeTimeText,
                                style: TextStyle(
                                  color: AppColors.greyTextColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: clinicNumber,
                                    style: TextStyle(
                                      color: AppColors.greyTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    largeVerticalSizedBox,
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: MyAfyaHubPrimaryButton(
                        text: okThanksText,
                        textColor: AppColors.whiteColor,
                        buttonColor: Theme.of(context).primaryColor,
                        borderColor: Theme.of(context).primaryColor,
                        onPressed: () {
                          /// A fail safe in case the state is not cleared properly
                          StoreProvider.dispatch<AppState>(
                            context,
                            UpdateHealthDiaryStateActon(
                              shouldShareHealthRecord: false,
                            ),
                          );
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
