// Flutter imports:
import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart' as domain;
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/core/widgets/app_bar/my_afya_hub_app_bar.dart';
import 'package:myafyahub/presentation/core/widgets/sil_appbar_user.dart';

import '../../../../../mock_image_httpclient.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('MyAfyaHubAppBar', () {
    const String title = 'Community';

    late Store<AppState> store;

    setUp(() {
      final String dir = Directory.current.path;
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = BWTestHttpOverrides();
      store.dispatch(
        UpdateUserProfileAction(
          profile: domain.UserProfile(
              photoUploadID: '$dir/test/tests_resources/test_file.png'),
        ),
      );
      store.dispatch(
        UpdateUserProfileAction(
          userBioData: domain.BioData(
            firstName: Name.withValue('Test'),
            lastName: Name.withValue('Name'),
          ),
          profile: domain.UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue('+254728101710'),
            primaryEmailAddress: EmailAddress.withValue('s@g.com'),
          ),
        ),
      );
    });

    testWidgets('should render correctly with profile initials',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return MyAfyaHubAppBar(
            title: title,
            trailingWidget: IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(getTestedComingSoonText)));
              },
            ),
          );
        }),
      );

      expect(find.byType(MyAfyaHubAppBar), findsOneWidget);
      expect(find.byType(MyAfyaHubAppbarUser), findsOneWidget);
      expect(find.text(title), findsOneWidget);

      await tester.press(find.byType(IconButton));
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });

    testWidgets('should render correctly with empty profile initials',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return MyAfyaHubAppBar(
            title: title,
            trailingWidget: IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(getTestedComingSoonText)));
              },
            ),
          );
        }),
      );

      expect(find.byType(MyAfyaHubAppBar), findsOneWidget);
      expect(find.byType(MyAfyaHubAppbarUser), findsOneWidget);
      expect(find.text(title), findsOneWidget);

      await tester.press(find.byType(IconButton));
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });

    testWidgets('should render correctly with profile image',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return MyAfyaHubAppBar(
            title: title,
            trailingWidget: IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(getTestedComingSoonText)));
              },
            ),
          );
        }),
      );

      expect(find.byType(MyAfyaHubAppbarUser), findsOneWidget);
      expect(find.text(title), findsOneWidget);

      await tester.press(find.byType(IconButton));
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
                    leadingWidget: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
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

      expect(find.byType(MyAfyaHubAppbarUser), findsNothing);
      expect(find.text(title), findsOneWidget);

      await tester.press(find.byType(IconButton));
      await tester.pumpAndSettle();

      expect(find.byType(ScaffoldMessenger), findsWidgets);
    });
  });
}
