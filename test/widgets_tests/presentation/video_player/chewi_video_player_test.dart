import 'package:async_redux/async_redux.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:myafyahub/application/core/services/video_player_initializer.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/video_player/chewie_video_player.dart';

import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  late StoreTester<AppState> storeTester;

  setUp(() {
    storeTester = StoreTester<AppState>(initialState: AppState.initial());
  });
  group('ChewiVideoPlayer', () {
    testWidgets(
      'should show chewi videos',
      (WidgetTester tester) async {
        await mockNetworkImages(() async {
          final MockVideoPlayerController controller =
              MockVideoPlayerController();

          controller.value = controller.value.copyWith(
            duration: const Duration(milliseconds: 100),
            isInitialized: true,
          );

          await buildTestWidget(
            tester: tester,
            store: storeTester.store,
            client: baseGraphQlClientMock,
            widget: ChewieVideoPlayer(
              autoPlay: true,
              chewieController: VideoPlayerInitializer().initializePlayer(
                videoPlayerController: controller,
                autoPlay: true,
              ),
              thumbnail: 'https://127.0.0.1',
            ),
          );

          await tester.pump(const Duration(seconds: 1));
          await tester.pumpAndSettle();

          expect(find.byType(Chewie), findsOneWidget);
          expect(find.byType(CircularProgressIndicator), findsNothing);
        });
      },
    );

    testWidgets('should show loader when controller is not initialized',
        (WidgetTester tester) async {
      await mockNetworkImages(
        () async {
          final MockVideoPlayerController controller =
              MockVideoPlayerController();

          controller.value = controller.value.copyWith(
            duration: const Duration(milliseconds: 100),
            isInitialized: false,
          );

          await buildTestWidget(
            tester: tester,
            store: storeTester.store,
            client: baseGraphQlClientMock,
            widget: ChewieVideoPlayer(
              autoPlay: true,
              chewieController: VideoPlayerInitializer().initializePlayer(
                videoPlayerController: controller,
                autoPlay: true,
              ),
              thumbnail: 'https://127.0.0.1',
            ),
          );

          await tester.pump(const Duration(seconds: 1));

          expect(find.byType(Chewie), findsNothing);
          expect(find.byType(CircularProgressIndicator), findsOneWidget);
        },
      );
    });
  });
}
