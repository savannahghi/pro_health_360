// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/domain/core/value_objects/app_widget_keys.dart';
import 'package:myafyahub/presentation/profile/personal_information/personal_information_page.dart';
import '../../../mocks.dart';
import '../../../test_helpers.dart';

void main() {
  group('PersonalInformationPage', () {
    late Store<AppState> store;

    setUp(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: PersonalInformationPage(),
      );
      await tester.pumpAndSettle();

      expect(find.text(myProfileCaregiverText), findsOneWidget);
      expect(find.text(preferredLanguage), findsOneWidget);
      expect(find.text(preferredClinic), findsOneWidget);
      expect(find.text(preferredCommunication), findsOneWidget);
    });

    testWidgets('should be able to edit caregiver info',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: MockGraphQlClient(),
        widget: PersonalInformationPage(),
      );
      await tester.pump();

      await tester.tap(find.byKey(editPersonalInfoKey));
      await tester.pumpAndSettle();

      final Finder firstNameKey = find.byKey(const ValueKey<String>('0'));
      expect(firstNameKey, findsOneWidget);

      await tester.enterText(firstNameKey, 'test');
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(editInfoSaveBtnKey));
      await tester.pumpAndSettle();

      // TODO: Verify state has changed once it's been hooked up
    });
  });
}
