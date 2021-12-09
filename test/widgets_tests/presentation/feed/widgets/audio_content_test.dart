// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myafyahub/domain/core/entities/feed/content_metadata.dart';
import 'package:shared_ui_components/platform_loader.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/entities/feed/content.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/content/widgets/audio_content.dart';
import 'package:myafyahub/presentation/content/widgets/audio_content_controls.dart';
import 'package:myafyahub/presentation/content/widgets/content_item.dart';
import '../../../../mock_image_http_client.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';
import './audio_content_test.mocks.dart';

@GenerateMocks(<Type>[AudioPlayer])
void main() {
  group('AudioContent', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = TestHttpOverrides();
    });

    testWidgets('shows loading indicator when audio is loading',
        (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

      final MockAudioPlayer audioPlayer = MockAudioPlayer();

      when(audioPlayer.playerStateStream).thenAnswer(
        (Invocation realInvocation) => Stream<PlayerState>.value(
          PlayerState(true, ProcessingState.loading),
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: AudioContentControls(player: audioPlayer),
      );
      await tester.pump();

      expect(find.byType(SILPlatformLoader), findsOneWidget);
    });

    testWidgets('shows reply icon', (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

      final MockAudioPlayer audioPlayer = MockAudioPlayer();

      when(audioPlayer.playerStateStream).thenAnswer(
        (Invocation realInvocation) => Stream<PlayerState>.value(
          PlayerState(true, ProcessingState.completed),
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: AudioContentControls(player: audioPlayer),
      );
      await tester.pump();

      expect(
        (tester.firstWidget(find.byType(Icon)) as Icon).icon,
        Icons.replay,
      );

      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();

      expect(
        (tester.firstWidget(find.byType(Icon)) as Icon).icon,
        Icons.replay,
      );
    });

    testWidgets('shows audio content', (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();
      final Content contentWithAudio =
          mockContent.copyWith.call(contentType: ContentType.AUDIO_VIDEO);

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: ContentItem(contentDetails: contentWithAudio),
      );

      await tester.pumpAndSettle();
      expect(find.byType(AudioContent), findsOneWidget);
    });

    testWidgets('shows pause icon when audio is paused',
        (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();
      final Content contentWithAudio =
          mockContent.copyWith.call(contentType: ContentType.AUDIO_VIDEO);

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: ContentItem(contentDetails: contentWithAudio),
      );

      await tester.pumpAndSettle();
      expect(find.byType(AudioContent), findsOneWidget);
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();

      expect(
        (tester.firstWidget(find.byType(Icon)) as Icon).icon,
        Icons.pause,
      );
    });

    testWidgets('seeks the audio', (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();
      final Content contentWithAudio = mockContent.copyWith.call(
        contentType: ContentType.AUDIO_VIDEO,
        metadata: ContentMetadata(),
      );

      final MockAudioPlayer audioPlayer = MockAudioPlayer();

      when(audioPlayer.playerStateStream).thenAnswer(
        (Invocation realInvocation) => Stream<PlayerState>.value(
          PlayerState(true, ProcessingState.ready),
        ),
      );

      when(audioPlayer.setAudioSource(any)).thenAnswer(
        (Invocation realInvocation) =>
            Future<Duration>.value(const Duration(seconds: 100)),
      );

      when(audioPlayer.durationStream).thenAnswer(
        (Invocation realInvocation) => Stream<Duration?>.value(
          null,
        ),
      );

      when(audioPlayer.bufferedPositionStream).thenAnswer(
        (Invocation realInvocation) => Stream<Duration>.value(
          const Duration(seconds: 110),
        ),
      );

      when(audioPlayer.positionStream).thenAnswer(
        (Invocation realInvocation) => Stream<Duration>.value(
          const Duration(seconds: 100),
        ),
      );

      await buildTestWidget(
        tester: tester,
        store: store,
        client: mockGraphQlClient,
        widget: AudioContent(
          contentDetails: contentWithAudio,
          audioPlayer: audioPlayer,
        ),
      );
      (tester.firstWidget(find.byType(Slider).first) as Slider)
          .onChanged
          ?.call(12.0);

      await tester.pumpAndSettle();
      await tester.drag(find.byType(Slider).last, const Offset(10.0, 0.0));
      await tester.pump();
      expect(
        (tester.firstWidget(find.byType(Slider).last) as Slider).value,
        contentWithAudio.featuredMedia!.first!.duration! * 1000.00,
      );

      expect(
        (tester.firstWidget(find.byType(Slider).first) as Slider)
            .onChanged
            .toString(),
        (double value) {
          void empty;
          return empty;
        }.toString(),
      );
    });

    testWidgets('is removed when app lifecycle is paused',
        (WidgetTester tester) async {
      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();
      final Content contentWithAudio =
          mockContent.copyWith.call(contentType: ContentType.AUDIO_VIDEO);
      await tester.runAsync(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockGraphQlClient,
          widget: ContentItem(contentDetails: contentWithAudio),
        );

        await tester.pumpAndSettle(const Duration(seconds: 5));
        tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);

        expect(find.byType(AudioContent), findsOneWidget);
      });
    });
  });
}
