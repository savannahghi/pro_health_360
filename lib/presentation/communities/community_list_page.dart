// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/communities/channel_page.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;

import 'community_utils.dart';

class CommunityListViewPage extends StatelessWidget {
  const CommunityListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar:
          const CustomAppBar(title: communityPageString, showBackButton: false),
      body: stream.StreamChat(
        client: stream.StreamChat.of(context).client,
        child: stream.ChannelsBloc(
          child: stream.ChannelListView(
            filter: stream.Filter.in_(
              'members',
              <String>[stream.StreamChat.of(context).currentUser?.id ?? ''],
            ),
            channelPreviewBuilder: channelPreviewBuilder,
            sort: const <stream.SortOption<stream.ChannelModel>>[
              stream.SortOption<stream.ChannelModel>('last_message_at')
            ],
            limit: 20,
            channelWidget: const ChannelPage(),
          ),
        ),
      ),
    );
  }
}
