import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:pro_health_360/application/redux/actions/fetch_clinic_information_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/app_state_view_model.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class HotlineWidget extends StatelessWidget {
  const HotlineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppStateViewModel>(
      onInit: (Store<AppState> store) {
        store.dispatch(FetchClinicInformationAction(context: context));
      },
      converter: (Store<AppState> store) => AppStateViewModel.fromStore(store),
      builder: (BuildContext context, AppStateViewModel vm) {
        if (vm.appState.wait!.isWaitingFor(fetchClinicInformationFlag)) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: const PlatformLoader(),
          );
        } else {
          if (vm.appState.clientState?.facilityPhoneNumber != null &&
              vm.appState.clientState!.facilityPhoneNumber! != UNKNOWN) {
            final String hotlineSubtitle =
                vm.appState.clientState!.facilityPhoneNumber!.isNotEmpty
                    ? hotlineDescription
                    : noHotlineContactDescription;
            final String facilityPhone =
                vm.appState.clientState!.facilityPhoneNumber!;

            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.14),
                border: Border.all(color: AppColors.primaryColor, width: 0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    hotlineTitle,
                    style: heavySize18Text(AppColors.primaryColor),
                  ),
                  if (vm.appState.clientState!.facilityPhoneNumber!.isNotEmpty)
                    verySmallVerticalSizedBox,
                  Text(
                    vm.appState.clientState!.facilityPhoneNumber!,
                    style: boldSize15Text(AppColors.greyTextColor),
                  ),
                  smallVerticalSizedBox,
                  Text(
                    hotlineSubtitle,
                    style: normalSize14Text(AppColors.primaryColor),
                  ),
                  size15VerticalSizedBox,
                  if (vm.appState.clientState!.facilityPhoneNumber!.isNotEmpty)
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: MyAfyaHubPrimaryButton(
                        onPressed: () async {
                          await launch('tel:$facilityPhone');
                        },
                        buttonKey: hotlineCallButtonKey,
                        text: callString,
                      ),
                    ),
                  smallVerticalSizedBox,
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: MyAfyaHubPrimaryButton(
                      buttonKey: hotlineMoreHotlinesKey,
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.hotlinesPage);
                      },
                      borderColor: Colors.transparent,
                      textColor: AppColors.primaryColor,
                      buttonColor: AppColors.primaryColor.withOpacity(0.3),
                      text: moreHelplines,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        }
      },
    );
  }
}
