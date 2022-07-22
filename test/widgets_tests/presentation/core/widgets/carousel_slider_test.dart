import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pro_health_360/domain/core/value_objects/app_widget_keys.dart';
import 'package:pro_health_360/presentation/core/widgets/carousel_slider.dart';

void main() {
  group('MoodFeedbackPage', () {
    const List<Widget> testList = <Widget>[
      Text('test1'),
      Text('test2'),
      Text('test3'),
    ];

    testWidgets('should render correctly', (WidgetTester tester) async {
      await tester.runAsync(() async {
        TestWidgetsFlutterBinding.ensureInitialized();
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CarouselSlider(
                  children: testList,
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.byType(CarouselSlider), findsOneWidget);
        expect(find.text('test1'), findsOneWidget);
        expect(find.text('test3'), findsNothing);

        await Future<dynamic>.delayed(const Duration(seconds: 10), () async {
          await tester.pump(const Duration(seconds: 10));
        });
        await tester.pumpAndSettle(
          const Duration(milliseconds: 100),
          EnginePhase.sendSemanticsUpdate,
          const Duration(
            seconds: 10,
          ),
        );
        expect(find.text('test3'), findsOneWidget);
      });
    });

    testWidgets('pan works correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: CarouselSlider(
                children: testList,
              ),
            ),
          ),
        ),
      );

      final Finder carouselItem = find.byKey(carouselItemKey);

      expect(find.byType(CarouselSlider), findsOneWidget);
      expect(carouselItem, findsNWidgets(2));

      await tester.ensureVisible(carouselItem.first);
      await tester.pumpAndSettle();

      await tester.fling(
        carouselItem.first,
        const Offset(-20.0, 0.0),
        10.0,
      );
      await tester.pumpAndSettle();
      expect(carouselItem, findsNWidgets(2));
    });
  });
}
