// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/communities/stream_token_provider.dart';
import 'package:myafyahub/application/core/services/custom_client.dart';
import 'package:myafyahub/application/redux/actions/communities/connect_get_stream_user_action.dart';
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/core/user.dart';
// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/communities/channel_page.dart';
import 'package:myafyahub/presentation/communities/view_models/community_list_view_model.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;

import 'community_utils.dart';

class CommunityListViewPage extends StatefulWidget {
  const CommunityListViewPage({Key? key}) : super(key: key);

  @override
  State<CommunityListViewPage> createState() => _CommunityListViewPageState();
}

class _CommunityListViewPageState extends State<CommunityListViewPage> {
  final stream.ChannelListController channelListController =
      stream.ChannelListController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final User? user =
        StoreProvider.state<AppState>(context)?.clientState?.user;

    StoreProvider.dispatch(
      context,
      ConnectGetStreamUserAction(
        client: AppWrapperBase.of(context)!.graphQLClient as CustomClient,
        streamClient: stream.StreamChat.of(context).client,
        streamTokenProvider: StreamTokenProvider(
          client: AppWrapperBase.of(context)!.graphQLClient as CustomClient,
          endpoint: AppWrapperBase.of(context)!
              .customContext!
              .refreshStreamTokenEndpoint,
          saveToken: (String newToken) async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            prefs.setString('streamToken', newToken);
            StoreProvider.dispatch(
              context,
              UpdateUserAction(user: user?.copyWith(streamToken: newToken)),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavIndex: 2,
      appBar: const CustomAppBar(
        title: communityPageString,
        showBackButton: false,
        bottomNavIndex: 2,
      ),
      body: StoreConnector<AppState, CommunityListViewModel>(
        converter: (Store<AppState> store) {
          return CommunityListViewModel.fromStore(store);
        },
        builder: (BuildContext context, CommunityListViewModel vm) {
          if (vm.wait.isWaitingFor(connectionFlag)) {
            return const PlatformLoader();
          }

          final stream.Filter channelsFilter = stream.Filter.and(
            <stream.Filter>[
              stream.Filter.equal('invite', 'accepted'),
              stream.Filter.in_(
                'members',
                <String>[stream.StreamChat.of(context).currentUser?.id ?? ''],
              ),
            ],
          );

          return stream.StreamChat(
            client: stream.StreamChat.of(context).client,
            child: stream.ChannelsBloc(
              child: stream.ChannelListView(
                channelListController: channelListController,
                errorBuilder: (BuildContext context, Object error) {
                  return GenericErrorWidget(
                    messageTitle: emptyConversationTitle,
                    messageBody: const <TextSpan>[
                      TextSpan(
                        text: emptyConversationBody,
                      )
                    ],
                    headerIconSvgUrl: emptyChatsSvg,
                    recoverCallback: () {
                      channelListController.loadData?.call();
                    },
                  );
                },
                filter: channelsFilter,
                channelPreviewBuilder: channelPreviewBuilder,
                sort: const <stream.SortOption<stream.ChannelModel>>[
                  stream.SortOption<stream.ChannelModel>('last_message_at')
                ],
                limit: 20,
                channelWidget: const ChannelPage(),
              ),
            ),
          );
        },
      ),
    );
  }
}
