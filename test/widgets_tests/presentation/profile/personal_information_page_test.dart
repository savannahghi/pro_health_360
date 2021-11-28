// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/domain/core/value_objects/app_strings.dart';
import 'package:myafyahub/presentation/profile/personal_information/personal_information_page.dart';
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
        client: baseGraphQlClientMock,
        widget: PersonalInformationPage(),
      );

      expect(find.text(myProfileCaregiverText), findsOneWidget);
      expect(find.text(preferredLanguage), findsOneWidget);
      expect(find.text(preferredClinic), findsOneWidget);
      expect(find.text(preferredCommunication), findsOneWidget);
    });
  });
}
