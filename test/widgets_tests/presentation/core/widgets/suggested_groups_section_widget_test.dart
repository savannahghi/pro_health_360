// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/suggested_group_card_widget.dart';
import 'package:myafyahub/presentation/core/widgets/suggested_groups_section_widget.dart';
import '../../../../mock_image_http_client.dart';
import '../../../../mocks.dart';

void main() {
  setUpAll(() {
    HttpOverrides.global = TestHttpOverrides();
  });

  testWidgets('SuggestedGroupsSection should render correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SuggestedGroupsSection(),
        ),
      ),
    );
    expect(find.byType(SuggestedGroupCard), findsNWidgets(4));
    final Finder joinButton = find.byKey(joinSuggestedGroupButtonKey);
    expect(joinButton, findsNWidgets(4));
    await tester.tap(joinButton.first);
    await tester.pump(const Duration(seconds: 1));
    expect(
      find.text(mockSuggestions.first['title'].toString()),
      findsNWidgets(2),
    );
  });
}
