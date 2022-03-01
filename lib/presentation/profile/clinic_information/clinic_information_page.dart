// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/redux/actions/fetch_clinic_information_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/profile/clinic_information/clinic_information_item_widget.dart';
import 'package:myafyahub/presentation/profile/widgets/call_contact_action_widget.dart';
// Package imports:
import 'package:shared_themes/spaces.dart';

/// [ClinicInformationPage] is to display information of the clinic a client is registered to
///
/// It takes in required [contactNumber], [CHV], [treatmentBuddy], [age],
/// and [keyProvider] parameters of type String
///
class ClinicInformationPage extends StatefulWidget {
  @override
  State<ClinicInformationPage> createState() => _ClinicInformationPageState();
}

class _ClinicInformationPageState extends State<ClinicInformationPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback(
      (Duration timeStamp) async {
        await StoreProvider.dispatch<AppState>(
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
                child: const SILPlatformLoader(),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  mediumVerticalSizedBox,
                  Text(
                    clinicContactString,
                    style: boldSize14Text(AppColors.secondaryColor),
                  ),
                  smallVerticalSizedBox,
                  CallContactActionWidget(
                    phoneNumber:
                        vm.appState.clientState?.facilityPhoneNumber ?? '',
                  ),
                  size15VerticalSizedBox,
                  ClinicInformationItemWidget(
                    bodyText: chvString,
                    titleText: vm.appState.clientState?.chvUserName ?? '',
                  ),
                  size15VerticalSizedBox,
                  ClinicInformationItemWidget(
                    bodyText: treatmentBuddyString,
                    titleText: vm.appState.clientState?.treatmentBuddy ?? '',
                  ),
                  size15VerticalSizedBox,
                  ClinicInformationItemWidget(
                    bodyText: keyProvider,
                    titleText: vm.appState.clientState?.facilityName ?? '',
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
