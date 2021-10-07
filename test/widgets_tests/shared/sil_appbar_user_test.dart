// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/actions/update_user_profile_action.dart';
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/sil_appbar_user.dart';
import '../../mock_image_httpclient.dart';
import '../../test_helpers.dart';
import '../../test_utils.dart';

void main() {
  group('SIL Appbar', () {
    late Store<AppState> store;

    setUp(() {
      final String dir = Directory.current.path;
      store = Store<AppState>(initialState: AppState.initial());
      HttpOverrides.global = BWTestHttpOverrides();
      store.dispatch(
        UpdateUserProfileAction(
          profile: UserProfile(
              photoUploadID: '$dir/test/tests_resources/test_file.png'),
        ),
      );
      store.dispatch(
        UpdateUserProfileAction(
          userBioData: BioData(
            firstName: Name.withValue('Test'),
            lastName: Name.withValue('Name'),
          ),
          profile: UserProfile(
            primaryPhoneNumber: PhoneNumber.withValue('+254728101710'),
            primaryEmailAddress: EmailAddress.withValue('s@g.com'),
          ),
        ),
      );
    });
    testWidgets('should render SILAppBarUSer correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return const MyAfyaHubAppbarUser();
        }),
      );

      await fireEvent(tester);
      final Finder silAppBarGestureString = find.byKey(silAppBarGestureKey);
      expect(find.byType(MyAfyaHubAppbarUser), findsOneWidget);
      expect(silAppBarGestureString, findsOneWidget);
      await tester.tap(silAppBarGestureString);
      await tester.pumpAndSettle();
      // verify(mockObserver.didPush(sampleRoute, any));
    });

    testWidgets('should render SILAppBarUSer with a photo URL correctly',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: baseGraphQlClientMock,
        widget: Builder(builder: (BuildContext context) {
          return const MyAfyaHubAppbarUser();
        }),
      );
      await tester.pumpAndSettle();
      expect(find.byType(MyAfyaHubAppbarUser), findsOneWidget);
    });
  });
}
