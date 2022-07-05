// Flutter imports:
import 'package:flutter/material.dart';
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/actions/fetch_clinic_information_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/view_models/app_state_view_model.dart';
// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/profile/clinic_information/clinic_information_item_widget.dart';
import 'package:pro_health_360/presentation/profile/widgets/call_contact_action_widget.dart';

/// [ClinicInformationPage] is to display information of the clinic a client is registered to

class ClinicInformationPage extends StatefulWidget {
  @override
  State<ClinicInformationPage> createState() => _ClinicInformationPageState();
}

class _ClinicInformationPageState extends State<ClinicInformationPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (Duration timeStamp) async {
        StoreProvider.dispatch<AppState>(
          context,
          FetchClinicInformationAction(context: context),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const CustomAppBar(title: clinicInfoPageTitle),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: StoreConnector<AppState, AppStateViewModel>(
          converter: (Store<AppState> store) =>
              AppStateViewModel.fromStore(store),
          builder: (BuildContext context, AppStateViewModel vm) {
            if (vm.appState.wait!.isWaitingFor(fetchClinicInformationFlag)) {
              return Container(
                height: 300,
                padding: const EdgeInsets.all(20),
                child: const PlatformLoader(),
              );
            } else {
              final String chvNameString =
                  vm.appState.clientState?.chvUserName ?? chvName;
              final String treatmentBuddyString =
                  vm.appState.clientState?.treatmentBuddy ?? treatmentBuddy;

              final String clinicNameString =
                  vm.appState.clientState?.facilityName ?? clinicName;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  mediumVerticalSizedBox,
                  if (vm.appState.clientState?.facilityPhoneNumber != null &&
                      vm.appState.clientState!.facilityPhoneNumber!.isNotEmpty)
                    Text(
                      clinicContactString,
                      style: boldSize14Text(AppColors.secondaryColor),
                    ),
                  smallVerticalSizedBox,
                  if (vm.appState.clientState?.facilityPhoneNumber != null &&
                      vm.appState.clientState!.facilityPhoneNumber!.isNotEmpty)
                    CallContactActionWidget(
                      phoneNumber:
                          vm.appState.clientState!.facilityPhoneNumber!,
                    ),
                  size15VerticalSizedBox,
                  ClinicInformationItemWidget(
                    bodyText: chvString,
                    titleText: chvNameString.isEmpty ? chvName : chvNameString,
                  ),
                  size15VerticalSizedBox,
                  ClinicInformationItemWidget(
                    bodyText: treatmentBuddy,
                    titleText: treatmentBuddyString.isEmpty
                        ? treatmentBuddy
                        : treatmentBuddyString,
                  ),
                  size15VerticalSizedBox,
                  ClinicInformationItemWidget(
                    bodyText: keyProvider,
                    titleText: clinicNameString.isEmpty
                        ? clinicName
                        : clinicNameString,
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
