// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/domain/core/value_objects/enums.dart';
import 'package:myafyahub/presentation/core/widgets/list_item_card_widget.dart';
import '../../../../mock_image_httpclient.dart';

void main() {
  setUpAll(() {
    HttpOverrides.global = BWTestHttpOverrides();
  });
  group('ListItemCard', () {
    testWidgets('ListItemCard should render correctly for Appointment',
        (WidgetTester tester) async {
      const String testTime = '12.00pm';
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ListItemCard(
              timelineType: TimelineItemType.Appointment,
              time: testTime,
              title: 'X-ray',
              subTitle: 'Dr. Mercy Macharia Dr. ',
              assetPath: libraryNavItemIconUrl,
              iconBackgroundColor: Colors.amber,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.text(testTime), findsOneWidget);
    });
  });
  testWidgets('ListItemCard should render correctly for DiaryText',
      (WidgetTester tester) async {
    const String testTime = '12.00pm';
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ListItemCard(
            timelineType: TimelineItemType.DiaryText,
            time: testTime,
            assetPath: libraryNavItemIconUrl,
            iconBackgroundColor: Colors.amber,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(SvgPicture), findsNWidgets(2));
    expect(find.text(diaryString), findsOneWidget);
  });
  testWidgets('ListItemCard should render correctly for DiaryImage',
      (WidgetTester tester) async {
    const String testTime = '12.00pm';
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ListItemCard(
            timelineType: TimelineItemType.DiaryImage,
            time: testTime,
            assetPath: libraryNavItemIconUrl,
            iconBackgroundColor: Colors.amber,
            imageUrl: testTime,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(SvgPicture), findsNWidgets(2));
    expect(find.byType(Image), findsOneWidget);
    expect(find.text(diaryString), findsOneWidget);
  });
}
