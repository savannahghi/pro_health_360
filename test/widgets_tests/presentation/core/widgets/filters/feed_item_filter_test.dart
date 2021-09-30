import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:misc_utilities/misc.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/widgets/filters/feed_item_filter.dart';

void main() {
  group('FeedItemFilter', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      const String filterText = 'All';
      const IconData iconData = Icons.grid_view_rounded;
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Center(
            child: Builder(builder: (BuildContext context) {
              return FeedItemFilter(
                filterIcon: iconData,
                filterText: filterText,
                onTap: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackbar(content: getTestedComingSoonText));
                },
              );
            }),
          ),
        ),
      ));

      expect(find.text(filterText), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);

      await tester.tap(find.byType(FeedItemFilter));
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });
  });
}
