// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/client_profile_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class SuccessfulAssessmentSubmissionPage extends StatelessWidget {
  const SuccessfulAssessmentSubmissionPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SvgPicture.asset(
                  successfulAssessmentSubmissionImage,
                  height: 286.0,
                  width: 286.0,
                ),
                mediumVerticalSizedBox,
                const Text(
                  assessmentSubmissionSuccessfulText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                mediumVerticalSizedBox,
                StoreConnector<AppState, ClientProfileViewModel>(
                  converter: (Store<AppState> store) {
                    return ClientProfileViewModel.fromStore(store);
                  },
                  builder: (BuildContext context, ClientProfileViewModel vm) {
                    return Wrap(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            text: assessmentSubmissionSuccessfulDescription,
                            style: normalSize14Text(AppColors.greyTextColor),
                            children: <TextSpan>[
                              if (vm.clientState?.facilityPhoneNumber != null &&
                                  vm.clientState!.facilityPhoneNumber!
                                      .isNotEmpty &&
                                  vm.clientState!.facilityPhoneNumber !=
                                      UNKNOWN)
                                TextSpan(
                                  text: ifItIsAnEmergency,
                                  style: normalSize14Text(
                                    AppColors.greyTextColor,
                                  ),
                                ),
                              if (vm.clientState?.facilityPhoneNumber != null &&
                                  vm.clientState!.facilityPhoneNumber!
                                      .isNotEmpty &&
                                  vm.clientState!.facilityPhoneNumber !=
                                      UNKNOWN)
                                TextSpan(
                                  text: vm.clientState?.facilityPhoneNumber ??
                                      UNKNOWN,
                                  style: veryBoldSize14Text(
                                    AppColors.greyTextColor,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
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
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.home,
                        (Route<dynamic> route) => false,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
