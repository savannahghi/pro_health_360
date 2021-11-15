import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:myafyahub/presentation/feed/widgets/suggested_group_card.dart';

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
