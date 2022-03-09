import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/redux/actions/communities/fetch_invited_communities_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/app_state_view_model.dart';
import 'package:myafyahub/domain/core/entities/core/community.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/communities/invited_groups/widgets/group_invite_item.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/presentation/router/routes.dart';
import 'package:shared_themes/spaces.dart';

class InvitedGroupsPage extends StatefulWidget {
  const InvitedGroupsPage();

  @override
  State<InvitedGroupsPage> createState() => _InvitedGroupsPageState();
}

class _InvitedGroupsPageState extends State<InvitedGroupsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback(
      (Duration timeStamp) async {
        await StoreProvider.dispatch<AppState>(
          context,
          FetchInvitedCommunitiesAction(context: context),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: groupInvitesString),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: StoreConnector<AppState, AppStateViewModel>(
          converter: (Store<AppState> store) =>
              AppStateViewModel.fromStore(store),
          builder: (BuildContext context, AppStateViewModel vm) {
            if (vm.appState.wait!.isWaitingFor(fetchInvitedCommunitiesFlag)) {
              return Container(
                height: 300,
                padding: const EdgeInsets.all(20),
                child: const PlatformLoader(),
              );
            } else {
              if (vm.appState.clientState!.communitiesState!.invitedCommunities!
                  .isNotEmpty) {
                final List<Community> communitiesList = vm.appState.clientState!
                    .communitiesState!.invitedCommunities!;
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
                          groupName: communitiesList[index].name ?? '',
                          groupId: communitiesList[index].id!,
                          numberOfMembers:
                              communitiesList[index].memberCount ?? 0,
                        );
                      },
                    )
                  ],
                );
              } else {
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
                          onPressed: () => Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.userProfilePage),
                        ),
                      )
                    ],
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
