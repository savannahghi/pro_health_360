import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myafyahub/application/core/services/utils.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/core/widgets/information_list_card.dart';
import 'package:myafyahub/presentation/profile/pages/user_profile_page.dart';
import 'package:myafyahub/presentation/profile/widgets/user_details_card_widget.dart';

void main() {
  testWidgets('UserProfilePage should render correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return UserProfilePage(
                userInitials: 'WJ',
                name: 'Waikiki',
                userCCCNumber: '12345678',
                age: '20',
                phoneNumber: '0712345678',
                home: 'Ruaka',
                userProfileItems: userProfileItems,
              );
            },
          ),
        ),
      ),
    );
    expect(find.byType(UserDetailsCard), findsWidgets);
    final Finder userProfileListItem = find.byType(InformationListCard);
    final Finder hotlineCallButton = find.byKey(hotlineCallButtonKey);
    expect(userProfileListItem, findsNWidgets(userProfileItems.length));
    expect(hotlineCallButton, findsOneWidget);
  });
}
