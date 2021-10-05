// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/entities.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/application/redux/states/misc_state.dart';
import 'package:myafyahub/application/redux/states/user_profile_state.dart';
import 'package:myafyahub/domain/core/entities/core/app_review_obj.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/engagement/home/pages/feed_page.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  group('FeedPage', () {
    testWidgets(
        'should render app rating dialog when the user has viewed the '
        'app more than 10 times in the last 5 days',
        (WidgetTester tester) async {
      final Store<AppState> store = Store<AppState>(
        initialState: AppState.initial().copyWith(
            userProfileState: UserProfileState(
              auth: AuthCredentialResponse.fromJson(
                  <String, dynamic>{'uid': 'some-long-uid'}),
              userProfile: UserProfile.initial().copyWith(
                primaryPhoneNumber: PhoneNumber.withValue('0715710345'),
                userBioData: BioData.initial().copyWith(
                    firstName: Name.withValue('name'),
                    lastName: Name.withValue('name'),
                    gender: Gender.female),
              ),
            ),
            miscState: MiscState.initial()
                .copyWith(appReviewObj: AppReviewObj(launches: 10, days: 5))),
      );

      final MockGraphQlClient mockGraphQlClient = MockGraphQlClient();

      mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          store: store,
          client: mockGraphQlClient,
          widget: const FeedPage(),
        );

        await tester.pumpAndSettle();

        expect(find.byKey(ratingDialogKey), findsOneWidget);
      });
    });
  });
}
