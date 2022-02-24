// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/communities/channel_page.dart';
import 'package:myafyahub/presentation/communities/community_utils.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/custom_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/custom_scaffold/app_scaffold.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class CommunityListViewPage extends StatelessWidget {
  const CommunityListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar:
          const CustomAppBar(title: communityPageString, showBackButton: false),
      body: StreamChat(
        client: stream.StreamChat.of(context).client,
        child: ChannelsBloc(
          child: ChannelListView(
            filter: Filter.in_(
              'members',
              <String>[StreamChat.of(context).currentUser?.id ?? ''],
            ),
            channelPreviewBuilder: channelPreviewBuilder,
            sort: const <SortOption<ChannelModel>>[
              SortOption<stream.ChannelModel>('last_message_at')
            ],
            limit: 20,
            channelWidget: const ChannelPage(),
          ),
        ),
      ),
    );
  }
}
