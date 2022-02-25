// Package imports:
// import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// Project imports:
// import 'package:myafyahub/application/redux/states/app_state.dart';
// import 'package:myafyahub/presentation/communities/community_list_page.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;
// import '../../../mocks.dart';
// import '../../../test_helpers.dart';

// import 'community_list_page_test.mocks.dart';

@GenerateMocks(<Type>[stream.StreamChatClient])
void main() {
  group('CommunityListItem', () {
    // late Store<AppState> store;

    // late MockStreamChatClient client;

    // setUp(() {
    //   store = Store<AppState>(initialState: AppState.initial());

    //   client = MockStreamChatClient();
    //   when(client.connectUser(any, any)).thenAnswer(
    //     (_) => Future<stream.OwnUser>.value(stream.OwnUser(id: '')),
    //   );

    //   final MockClientState clientState = MockClientState();
    //   final MockLogger logger = MockLogger();

    //   when(client.state).thenReturn(clientState);
    //   when(client.logger).thenReturn(logger);
    //   when(client.wsConnectionStatus)
    //       .thenReturn(stream.ConnectionStatus.connected);
    // });

    testWidgets('renders correctly', (WidgetTester tester) async {
      // when(client.on(any, any, any, any))
      //     .thenAnswer((_) => const Stream<stream.Event>.empty());

      // await buildTestWidget(
      //   tester: tester,
      //   store: store,
      //   client: baseGraphQlClientMock,
      //   widget: stream.StreamChat(
      //     client: client,
      //     connectivityStream: Stream<stream.ConnectivityResult>.value(
      //       stream.ConnectivityResult.none,
      //     ),
      //     child: const CommunityListViewPage(),
      //   ),
      // );

      // await tester.pumpAndSettle();
      // expect(find.byType(stream.ChannelListView), findsOneWidget);
    });
  });
}
