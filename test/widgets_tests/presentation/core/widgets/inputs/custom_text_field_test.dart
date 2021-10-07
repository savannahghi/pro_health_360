// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/core/widgets/inputs/custom_text_field.dart';
import '../../../../../mocks.dart';
import '../../../../../test_helpers.dart';

void main() {
  group('CustomTextField', () {
    final MockGraphQlClient GraphQlClient = MockGraphQlClient();

    late Store<AppState> store;

    setUpAll(() {
      store = Store<AppState>(initialState: AppState.initial());
    });

    testWidgets('should show field label', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: GraphQlClient,
        widget: const CustomTextField(
          formFieldKey: Key('formFieldKey'),
          fieldLabel: 'Example field',
        ),
      );

      expect(find.text('Example field'), findsOneWidget);
    });

    testWidgets(
        'should show field label with red asterisk if field is required',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        store: store,
        client: GraphQlClient,
        widget: const CustomTextField(
          isRequired: true,
          formFieldKey: Key('formFieldKey'),
          fieldLabel: 'Example field',
        ),
      );

      expect(find.text('Example field'), findsOneWidget);
      expect(find.text('*'), findsOneWidget);
      expect((tester.widget(find.text('*')) as Text).style?.color,
          Colors.redAccent);
    });
  });
}
