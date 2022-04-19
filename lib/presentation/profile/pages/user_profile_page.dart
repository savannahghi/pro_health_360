// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Project imports:
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/fetch_clinic_information_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/logout_button.dart';
import 'package:myafyahub/presentation/profile/widgets/call_contact_action_widget.dart';
import 'package:myafyahub/presentation/profile/widgets/user_details_card_widget.dart';
import 'package:shared_themes/spaces.dart';

class UserProfilePage extends StatefulWidget {
  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final String age = '18';

  final String home = 'Karen';

  /// [UserProfilePage] is used to display the user information
  ///
  /// It takes in required [userInitials], [name], [userCCCNumber], [age], [phoneNumber],
  ///  [home] and [userProfileItems] parameters
  ///
  /// [userProfileItems] is a list of the UserProfilePage ListTile items

  // Client's Comprehensive Care Centre Number
  final String userCCCNumber = '12345678';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: myHealthPageProfile),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  largeVerticalSizedBox,
                  const UserDetailsCard(),
                  largeVerticalSizedBox,
                  ...List<Widget>.generate(userProfileItems.length,
                      (int index) {
                    final String iconPath =
                        userProfileItems.elementAt(index).iconAssetPath;
                    final String title =
                        userProfileItems.elementAt(index).title;
                    final String routeName =
                        userProfileItems.elementAt(index).route;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: GestureDetector(
                        onTap: () {
                          if (routeName.isNotEmpty) {
                            Navigator.pushNamed(context, routeName);
                          }
                        },
                        child: InformationListCard(
                          title: Text(
                            title,
                            maxLines: 2,
                            style: const TextStyle(
                              color: AppColors.secondaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          iconBackgroundColor: AppColors.listCardColor,
                          leadingIcon: Container(
                            decoration: BoxDecoration(
                              color: AppColors.listCardColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: SvgPicture.asset(
                              iconPath,
                              width: 20,
                              height: 20,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                  mediumVerticalSizedBox,
                  StoreConnector<AppState, AppStateViewModel>(
                    onInit: (Store<AppState> store) {
                      store.dispatch(
                        FetchClinicInformationAction(context: context),
                      );
                    },
                    converter: (Store<AppState> store) =>
                        AppStateViewModel.fromStore(store),
                    builder: (BuildContext context, AppStateViewModel vm) {
                      if (vm.appState.wait!
                          .isWaitingFor(fetchClinicInformationFlag)) {
                        return Container(
                          height: 300,
                          padding: const EdgeInsets.all(20),
                          child: const PlatformLoader(),
                        );
                      } else {
                        if (vm.appState.clientState?.facilityPhoneNumber !=
                                null &&
                            vm.appState.clientState!.facilityPhoneNumber!
                                .isNotEmpty &&
                            vm.appState.clientState!.facilityPhoneNumber! !=
                                UNKNOWN) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text(
                                hotlineString,
                                style: TextStyle(
                                  color: AppColors.secondaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                              smallVerticalSizedBox,
                              CallContactActionWidget(
                                backgroundColor:
                                    AppColors.hotlineBackgroundColor,
                                phoneNumber: vm
                                    .appState.clientState!.facilityPhoneNumber!,
                                textColor: Colors.white,
                                iconColor: AppColors.secondaryColor,
                                iconBackground: AppColors.whiteColor,
                              ),
                            ],
                          );
                        } else {
                          return const SizedBox();
                        }
                      }
                    },
                  ),
                  mediumVerticalSizedBox,
                  const SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: LogoutButton(),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          copyrightString,
                          style: normalSize10Text(Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Center(
                        child: Text(
                          '$appVersionString $APPVERSION',
                          style: normalSize9Text(Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
