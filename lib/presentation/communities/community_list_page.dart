// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:myafyahub/application/core/services/custom_client.dart';
import 'package:myafyahub/application/redux/actions/communities/connect_get_stream_user_action.dart';
import 'package:myafyahub/application/redux/flags/flags.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/communities/view_models/community_list_view_model.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/communities/channel_page.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;

import 'community_utils.dart';

class CommunityListViewPage extends StatefulWidget {
  const CommunityListViewPage({Key? key}) : super(key: key);

  @override
  State<CommunityListViewPage> createState() => _CommunityListViewPageState();
}

class _CommunityListViewPageState extends State<CommunityListViewPage> {
  late String clientId;
  late stream.StreamChatClient streamChatClient;

  final stream.ChannelListController channelListController =
      stream.ChannelListController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      clientId = StoreProvider.state<AppState>(context)!.clientState!.id!;
      streamChatClient = stream.StreamChat.of(context).client;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final AppState state = StoreProvider.state<AppState>(context)!;

    if (state != AppState.initial()) {
      StoreProvider.dispatch(
        context,
        ConnectGetStreamUserAction(
          client: AppWrapperBase.of(context)!.graphQLClient as CustomClient,
          streamClient: stream.StreamChat.of(context).client,
          endpoint: AppWrapperBase.of(context)!
              .customContext!
              .refreshStreamTokenEndpoint,
        ),
      );
    }
  }

  @override
  void dispose() {
    streamChatClient.disconnectUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar:
          const CustomAppBar(title: communityPageString, showBackButton: false),
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
