import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:myafyahub/application/redux/actions/communities/fetch_channel_members_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/communities/view_models/fetch_channel_members_view_model.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/communities/group_info/widgets/group_member_item.dart';
import 'package:myafyahub/presentation/core/theme/theme.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';

import 'package:shared_themes/spaces.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class GroupInfoPage extends StatefulWidget {
  const GroupInfoPage();

  @override
  State<GroupInfoPage> createState() => _GroupInfoPageState();
}

class _GroupInfoPageState extends State<GroupInfoPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final Channel channel = StreamChannel.of(context).channel;
    StoreProvider.dispatch(context, FetchChannelMembersAction(channel));
  }

  @override
  Widget build(BuildContext context) {
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
                    groupTitle,
                    style: boldSize20Text(AppColors.lightBlackTextColor),
                  ),
                  verySmallVerticalSizedBox,
                  StoreConnector<AppState, FetchChannelMembersViewModel>(
                    converter: (Store<AppState> store) {
                      return FetchChannelMembersViewModel.fromStore(
                        store.state,
                      );
                    },
                    builder: (
                      BuildContext context,
                      FetchChannelMembersViewModel vm,
                    ) {
                      final List<Member>? members = vm.members;

                      if (members == null) {
                        return const GenericErrorWidget(recoverCallback: null);
                      }

                      if (vm.wait.isWaitingFor(fetchMembersFlag)) {
                        return const PlatformLoader();
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
                  StoreConnector<AppState, FetchChannelMembersViewModel>(
                    converter: (Store<AppState> store) {
                      return FetchChannelMembersViewModel.fromStore(
                        store.state,
                      );
                    },
                    builder: (
                      BuildContext context,
                      FetchChannelMembersViewModel vm,
                    ) {
                      final List<Member>? members = vm.members;

                      if (members == null) {
                        return const GenericErrorWidget(recoverCallback: null);
                      }

                      if (vm.wait.isWaitingFor(fetchMembersFlag)) {
                        return const PlatformLoader();
                      }

                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: members.length,
                        itemBuilder: (_, int index) {
                          final Member member = members[index];

                          return GroupMemberItem(
                            userName: member.user?.name ?? UNKNOWN,
                            memberID: member.user?.id ?? '',
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
