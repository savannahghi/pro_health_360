import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/asset_strings.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/icon_button_item.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/my_afya_hub_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/profile_image_item.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/profile_initials_item.dart';

void main() {
  group('MyAfyaHubAppBar', () {
    const String firstName = 'John';
    const String lastName = 'Doe';
    const String title = 'Community';

    testWidgets('should render correctly with profile initials',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (BuildContext context) {
            return MyAfyaHubAppBar(
              leadingWidget: const ProfileInitialsItem(
                firstName: firstName,
                lastName: lastName,
              ),
              title: title,
              trailingWidget: IconButtonItem(
                icon: Icons.notifications,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text(getTestedComingSoonText)));
                },
              ),
            );
          }),
        ),
      ));

      expect(find.byType(MyAfyaHubAppBar), findsOneWidget);
      expect(find.byType(ProfileInitialsItem), findsOneWidget);
      expect(find.text(title), findsOneWidget);

      await tester.press(find.byType(IconButtonItem));
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });

    testWidgets('should render correctly with empty profile initials',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (BuildContext context) {
            return MyAfyaHubAppBar(
              leadingWidget: const ProfileInitialsItem(
                firstName: '',
                lastName: '',
              ),
              title: title,
              trailingWidget: IconButtonItem(
                icon: Icons.notifications,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text(getTestedComingSoonText)));
                },
              ),
            );
          }),
        ),
      ));

      expect(find.byType(MyAfyaHubAppBar), findsOneWidget);
      expect(find.byType(ProfileInitialsItem), findsOneWidget);
      expect(find.text(title), findsOneWidget);

      await tester.press(find.byType(IconButtonItem));
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });

    testWidgets('should render correctly with profile image',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (BuildContext context) {
            return MyAfyaHubAppBar(
              leadingWidget: const ProfileImageItem(
                imageUrl: landingBackgroundImg,
              ),
              title: title,
              trailingWidget: IconButtonItem(
                icon: Icons.notifications,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text(getTestedComingSoonText)));
                },
              ),
            );
          }),
        ),
      ));

      expect(find.byType(ProfileImageItem), findsOneWidget);
      expect(find.text(title), findsOneWidget);

      await tester.press(find.byType(IconButtonItem));
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });

    testWidgets('should render correctly with back button',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return MaterialApp(
                home: Scaffold(
                  appBar: MyAfyaHubAppBar(
                    leadingWidget: IconButtonItem(
                      icon: Icons.arrow_back_ios,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(getTestedComingSoonText)));
                      },
                    ),
                    title: title,
                  ),
                ),
              );
            },
          ),
        ),
      );

      expect(find.byType(ProfileImageItem), findsNothing);
      expect(find.text(title), findsOneWidget);

      await tester.press(find.byType(IconButtonItem));
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsWidgets);
    });
  });
}
