// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/presentation/profile/widgets/dashed_line.dart';

void main() {
  group('DashedLine', () {
    testWidgets('should repaint with different arguments',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const CustomPaint(
          size: Size(1, 50),
          painter: DashedLine(dashSize: 5, gapSize: 2),
        ),
      );
      await tester.pump();

      final Finder line1 = find.byType(CustomPaint);
      expect(line1, findsOneWidget);
      expect(
        tester.widget(line1),
        isA<CustomPaint>().having(
          (CustomPaint painter) {
            final DashedLine? line = painter.painter as DashedLine?;
            return line?.dashSize;
          },
          'dashSize',
          5,
        ),
      );

      await tester.pumpWidget(
        const CustomPaint(
          size: Size(1, 50),
          painter: DashedLine(dashSize: 4, gapSize: 3),
        ),
      );
      await tester.pump();

      final Finder line2 = find.byType(CustomPaint);
      expect(line2, findsOneWidget);

      expect(
        tester.widget(line2),
        isA<CustomPaint>().having(
          (CustomPaint painter) {
            final DashedLine? line = painter.painter as DashedLine?;
            return line?.dashSize;
          },
          'dashSize',
          4,
        ),
      );
    });
  });
}
