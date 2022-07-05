// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:pro_health_360/application/communities/stream_token_provider.dart';
import 'package:pro_health_360/application/core/services/custom_client.dart';
import 'package:pro_health_360/application/redux/actions/communities/connect_get_stream_user_action.dart';
import 'package:pro_health_360/application/redux/actions/update_user_profile_action.dart';
import 'package:pro_health_360/application/redux/flags/flags.dart';
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/domain/core/entities/core/client_state.dart';
import 'package:pro_health_360/domain/core/entities/core/user.dart';
// Project imports:
import 'package:pro_health_360/domain/core/value_objects/app_strings.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:pro_health_360/presentation/communities/channel_page.dart';
import 'package:pro_health_360/presentation/communities/chat_screen/widgets/empty_conversations_widget.dart';
import 'package:pro_health_360/presentation/communities/view_models/community_list_view_model.dart';
import 'package:pro_health_360/presentation/core/theme/theme.dart';
import 'package:pro_health_360/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:pro_health_360/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;

class CommunityListViewPage extends StatefulWidget {
  const CommunityListViewPage({Key? key}) : super(key: key);

  @override
  State<CommunityListViewPage> createState() => _CommunityListViewPageState();
}

class _CommunityListViewPageState extends State<CommunityListViewPage> {
  late stream.StreamChannelListController _listController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final stream.Filter channelsFilter = stream.Filter.and(
      <stream.Filter>[
        stream.Filter.equal('invite', 'accepted'),
        stream.Filter.in_(
          'members',
          <String>[stream.StreamChat.of(context).currentUser?.id ?? ''],
        ),
      ],
    );

    _listController = stream.StreamChannelListController(
      client: stream.StreamChat.of(context).client,
      filter: channelsFilter,
      sort: const <stream.SortOption<stream.ChannelModel>>[
        stream.SortOption<stream.ChannelModel>('last_message_at')
      ],
      limit: 20,
    );

    final ClientState? clientState =
        StoreProvider.state<AppState>(context)?.clientState;
    final User? user = clientState?.user;

    if (clientState?.id != null &&
        clientState!.id!.isNotEmpty &&
        clientState.id! != UNKNOWN) {
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
              final SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.setString('streamToken', newToken);
              StoreProvider.dispatch(
                context,
                UpdateUserAction(user: user?.copyWith(streamToken: newToken)),
              );
            },
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.whiteColor,
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

          return stream.StreamChat(
            client: stream.StreamChat.of(context).client,
            child: stream.StreamChannelListView(
              controller: _listController,
              itemBuilder: _channelTileBuilder,
              emptyBuilder: (BuildContext context) {
                return const EmptyConversationsWidget();
              },
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
                    _listController.refresh();
                  },
                );
              },
              onChannelTap: (stream.Channel channel) {
                Navigator.of(context).push(
                  MaterialPageRoute<Route<dynamic>>(
                    builder: (BuildContext context) {
                      return stream.StreamChannel(
                        channel: channel,
                        child: const ChannelPage(),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _channelTileBuilder(
    BuildContext context,
    List<stream.Channel> channels,
    int index,
    stream.StreamChannelListTile defaultChannelTile,
  ) {
    final stream.Channel channel = channels[index];
    final stream.Message? lastMessage =
        channel.state?.messages.reversed.firstWhereOrNull(
      (stream.Message message) => !message.isDeleted,
    );

    String channelName = noTitleText;

    if (channel.extraData.containsKey('Name')) {
      channelName = channel.extraData['Name']! as String;
    }

    final String subtitle =
        lastMessage == null ? 'nothing yet' : lastMessage.text!;
    final double opacity = (channel.state?.unreadCount ?? 0) > 0 ? 1.0 : 0.5;

    final stream.StreamChatThemeData theme = stream.StreamChatTheme.of(context);

    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<Route<dynamic>>(
            builder: (_) => stream.StreamChannel(
              channel: channel,
              child: const ChannelPage(),
            ),
          ),
        );
      },
      leading: stream.StreamChannelAvatar(
        channel: channel,
      ),
      title: Text(
        channelName,
        style: theme.channelPreviewTheme.titleStyle!.copyWith(
          color: theme.colorTheme.textHighEmphasis.withOpacity(opacity),
        ),
      ),
      subtitle: Text(subtitle),
      trailing: channel.state!.unreadCount > 0
          ? CircleAvatar(
              radius: 10,
              child: Text(channel.state!.unreadCount.toString()),
            )
          : const SizedBox(),
    );
  }
}
