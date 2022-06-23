import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/redux/actions/communities/fetch_invited_communities_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/community.dart';
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/communities/invited_groups/widgets/group_invite_item.dart';
import 'package:pro_health_360/presentation/communities/view_models/invited_groups_view_model.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pro_health_360/presentation/router/routes.dart';

class InvitedGroupsPage extends StatelessWidget {
  const InvitedGroupsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: groupInvitesString),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: StoreConnector<AppState, InvitedGroupsViewModel>(
          converter: (Store<AppState> store) =>
              InvitedGroupsViewModel.fromStore(store),
          onInit: (Store<AppState> store) {
            store.dispatch(
              FetchInvitedCommunitiesAction(
                client: AppWrapperBase.of(context)!.graphQLClient,
              ),
            );
          },
          builder: (BuildContext context, InvitedGroupsViewModel vm) {
            if (vm.wait.isWaitingFor(fetchInvitedCommunitiesFlag)) {
              return Container(
                height: 300,
                padding: const EdgeInsets.all(20),
                child: const PlatformLoader(),
              );
            }

            if (vm.invitedCommunities?.isEmpty ?? true) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    SvgPicture.asset(noInvitesImage),
                    size15VerticalSizedBox,
                    Text(
                      youHaveNoInvites,
                      style: boldSize18Text(
                        AppColors.blackColor.withOpacity(0.9),
                      ),
                    ),
                    smallVerticalSizedBox,
                    Text(
                      noInvitesDescription,
                      textAlign: TextAlign.center,
                      style: normalSize14Text(AppColors.greyTextColor),
                    ),
                    mediumVerticalSizedBox,
                    SizedBox(
                      width: double.infinity,
                      child: MyAfyaHubPrimaryButton(
                        text: okThanksText,
                        onPressed: () async {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          } else {
                            Navigator.of(context).pushReplacementNamed(
                              AppRoutes.userProfilePage,
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              );
            } else {
              final List<Community?> communitiesList = vm.invitedCommunities!;
              return ListView(
                shrinkWrap: true,
                children: <Widget>[
                  SvgPicture.asset(groupInvitesImage),
                  smallVerticalSizedBox,
                  Text(
                    groupsYouHaveBeenInvited,
                    style: normalSize14Text(AppColors.greyTextColor),
                  ),
                  size15VerticalSizedBox,
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: communitiesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GroupInviteItem(
                        groupName: communitiesList[index]?.name ?? '',
                        groupId: communitiesList[index]?.id ?? '',
                        numberOfMembers:
                            communitiesList[index]?.memberCount ?? 0,
                      );
                    },
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
