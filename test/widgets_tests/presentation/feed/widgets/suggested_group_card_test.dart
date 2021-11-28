// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:myafyahub/presentation/communities/suggested_groups/suggested_group_card.dart';

// Project imports:
import '../../../../mocks.dart';

void main() {
  group('SuggestedGroupCard', () {
    testWidgets(
        'should show a coming soon snackbar when the join button is tapped',
        (WidgetTester tester) async {
      mockNetworkImages(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: SuggestedGroupCard(group: mockGroup),
              ),
            ),
          ),
        );

        expect(find.byType(RawMaterialButton), findsOneWidget);
        await tester.tap(find.byType(RawMaterialButton));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Coming soon'), findsOneWidget);
      });
    });
  });
}
