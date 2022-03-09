// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// Project imports:
import 'package:myafyahub/application/redux/actions/communities/fetch_recommended_communities_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/groups/groups_view_model.dart';
import 'package:myafyahub/domain/core/entities/communities/group.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/communities/suggested_groups/suggested_group_card.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/router/routes.dart';
// Package imports:
import 'package:shared_themes/spaces.dart';

/// [SuggestedGroupsSection] is a widget used in the Feed Page
///
/// It takes in a required [suggestedGroups] parameter which is a List of
/// the suggested groups or communities a user can join

class SuggestedGroupsSection extends StatefulWidget {
  const SuggestedGroupsSection();

  @override
  State<SuggestedGroupsSection> createState() => _SuggestedGroupsSectionState();
}

class _SuggestedGroupsSectionState extends State<SuggestedGroupsSection> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) async {
      final String clientID =
          StoreProvider.state<AppState>(context)?.clientState?.id ?? '';

      StoreProvider.dispatch<AppState>(
        context,
        FetchRecommendedGroupsAction(
          client: AppWrapperBase.of(context)!.graphQLClient,
          variables: <String, dynamic>{'clientID': clientID, 'limit': 10},
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, GroupsViewModel>(
      converter: (Store<AppState> store) => GroupsViewModel.fromStore(store),
      builder: (BuildContext context, GroupsViewModel vm) {
        return vm.wait.isWaitingFor(fetchRecommendedCommunitiesFlag)
            ? const Padding(
                padding: EdgeInsets.only(
                  top: 50,
                ),
                child: PlatformLoader(),
              )
            : vm.recommendedGroups != null && vm.recommendedGroups!.isNotEmpty
                ? Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(5.0),
                    color: Theme.of(context).backgroundColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            suggestedGroupsString,
                            overflow: TextOverflow.ellipsis,
                            style: veryBoldSize20Text(
                              AppColors.secondaryColor,
                            ),
                          ),
                        ),
                        verySmallVerticalSizedBox,
                        SizedBox(
                          height: 195,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: vm.recommendedGroups!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              final Group currentGroup =
                                  vm.recommendedGroups?.elementAt(index) ??
                                      Group.initial();
                              return Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: SuggestedGroupCard(
                                  group: currentGroup,
                                  route: AppRoutes.communityListPage,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox();
      },
    );
  }
}
