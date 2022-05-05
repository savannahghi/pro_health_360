import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_client/src/i_flutter_graphql_client.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/application/redux/actions/communities/fetch_channel_members_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/view_models/groups/groups_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:shared_themes/spaces.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'group_member_connector.dart';

class GroupInfoPage extends StatefulWidget {
  const GroupInfoPage({required this.channelName});

  final String channelName;

  @override
  State<GroupInfoPage> createState() => _GroupInfoPageState();
}

class _GroupInfoPageState extends State<GroupInfoPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final IGraphQlClient httpClient = AppWrapperBase.of(context)!.graphQLClient;
    final Channel channel = StreamChannel.of(context).channel;

    StoreProvider.dispatch(
      context,
      FetchChannelMembersAction(
        httpClient: httpClient,
        channelId: channel.id!,
        onError: (_) {
          showTextSnackbar(
            ScaffoldMessenger.of(context),
            content: getErrorMessage(groupMembersText.toLowerCase()),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Channel channel = StreamChannel.of(context).channel;
    final String channelName = widget.channelName;

    return Scaffold(
      appBar: const CustomAppBar(
        title: groupInfoText,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(24, 0, 10, 10),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SvgPicture.asset(
                    groupInfoImage,
                    height: 200.0,
                    width: 200.0,
                  ),
                  Text(
                    widget.channelName,
                    style: boldSize20Text(AppColors.lightBlackTextColor),
                  ),
                  verySmallVerticalSizedBox,
                  StoreConnector<AppState, GroupsViewModel>(
                    converter: (Store<AppState> store) {
                      return GroupsViewModel.fromStore(store);
                    },
                    builder: (BuildContext context, GroupsViewModel vm) {
                      final List<GroupMember?> members =
                          vm.groupMembers ?? <GroupMember>[];

                      if (vm.wait.isWaitingFor(fetchMembersFlag)) {
                        return const PlatformLoader();
                      }
                      if (members.isEmpty) {
                        return const GenericErrorWidget(recoverCallback: null);
                      }

                      return Text(
                        '${members.length} members',
                        style: boldSize16Text(AppColors.greyTextColor),
                      );
                    },
                  ),
                  largeVerticalSizedBox,
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      groupMembersText,
                      style: boldSize20Text(AppColors.blackColor),
                    ),
                  ),
                  largeVerticalSizedBox,
                  StoreConnector<AppState, GroupsViewModel>(
                    converter: (Store<AppState> store) {
                      return GroupsViewModel.fromStore(store);
                    },
                    builder: (BuildContext context, GroupsViewModel vm) {
                      final List<GroupMember?> members =
                          vm.groupMembers ?? <GroupMember>[];

                      if (vm.wait.isWaitingFor(fetchMembersFlag)) {
                        return const PlatformLoader();
                      }

                      if (members.isEmpty) {
                        return const GenericErrorWidget(recoverCallback: null);
                      }

                      final List<Role>? clientRoles = vm.clientRoles;

                      final List<Role>? communityRoles = clientRoles
                          ?.where(
                            (Role role) =>
                                role.name == RoleValue.COMMUNITY_MANAGEMENT,
                          )
                          .toList();

                      final bool canModerate =
                          communityRoles != null && communityRoles.isNotEmpty;

                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: members.length,
                        itemBuilder: (_, int index) {
                          final GroupMember member = members[index]!;

                          final bool isModerator = member.isModerator;
                          final bool isBanned =
                              member.memberDetails?.extraData?.isBanned ??
                                  false;

                          return GroupMemberConnector(
                            itemKey: ValueKey<int>(index),
                            userName: member.memberDetails?.username ?? UNKNOWN,
                            memberID: member.memberDetails?.id ?? '',
                            communityId: channel.id!,
                            communityName: channelName,
                            isModerator: isModerator,
                            canModerate: canModerate,
                            isBanned: isBanned,
                            onError: (String errorMessage) {
                              showTextSnackbar(
                                ScaffoldMessenger.of(context),
                                content: errorMessage,
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
