import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/suggested_group_card_widget.dart';
import 'package:myafyahub/presentation/core/widgets/suggested_groups_section_widget.dart';

import '../../../../mock_image_httpclient.dart';
import '../../../../mocks.dart';

void main() {
  setUpAll(() {
    HttpOverrides.global = BWTestHttpOverrides();
  });

  testWidgets('SuggestedGroupsSection should render correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SuggestedGroupsSection(
            suggestedGroups: mockSuggestions,
          ),
        ),
      ),
    );
    expect(find.byType(SuggestedGroupCard), findsNWidgets(4));
    final Finder joinButton = find.byKey(joinSuggestedGroupButtonKey);
    expect(joinButton, findsNWidgets(4));
    await tester.tap(joinButton.first);
    await tester.pump(const Duration(seconds: 1));
    expect(find.text(mockSuggestions.first['title'].toString()), findsNWidgets(2));
  });
}