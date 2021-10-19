// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:myafyahub/application/redux/states/app_state.dart';
import 'package:myafyahub/presentation/core/widgets/responsive_widget_builder.dart';
import '../../../../mocks.dart';
import '../../../../test_helpers.dart';

void main() {
  late Store<AppState> store;
  late MockGraphQlClient client;

  setUp(() {
    // setup all resources
    store = Store<AppState>(initialState: AppState.initial());

    client = MockGraphQlClient();
  });

  group('responsive_builder_test', () {
    testWidgets(
      'should render large text when mobile device width is greater than 480',
      (WidgetTester tester) async {
        const Size size = Size(640, 960);
        await tester.binding.setSurfaceSize(size);
        tester.binding.window.physicalSizeTestValue = size;
        tester.binding.window.devicePixelRatioTestValue = 1;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: client,
          widget: MaterialApp(
            home: Material(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ScreenTypeLayout.builder(
                    mobileNormal: (BuildContext context) =>
                        const Text('medium'),
                    mobileSmall: (BuildContext context) => const Text('small'),
                    mobileLarge: (BuildContext context) => const Text('large'),
                  )
                ],
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.text('large'), findsOneWidget);
      },
    );

    testWidgets(
      'should render medium text when no large mobile device is provided',
      (WidgetTester tester) async {
        const Size size = Size(640, 960);
        await tester.binding.setSurfaceSize(size);
        tester.binding.window.physicalSizeTestValue = size;
        tester.binding.window.devicePixelRatioTestValue = 1;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: client,
          widget: MaterialApp(
            home: Material(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ScreenTypeLayout.builder(
                    mobileNormal: (BuildContext context) =>
                        const Text('medium'),
                    mobileSmall: (BuildContext context) => const Text('small'),
                  )
                ],
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.text('medium'), findsOneWidget);
      },
    );

    testWidgets(
      'should render large text when mobile device width is between  320-480',
      (WidgetTester tester) async {
        const Size size = Size(375, 640);
        await tester.binding.setSurfaceSize(size);
        tester.binding.window.physicalSizeTestValue = size;
        tester.binding.window.devicePixelRatioTestValue = 1;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: client,
          widget: MaterialApp(
            home: Material(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ScreenTypeLayout.builder(
                    mobileNormal: (BuildContext context) =>
                        const Text('medium'),
                    mobileSmall: (BuildContext context) => const Text('small'),
                    mobileLarge: (BuildContext context) => const Text('large'),
                  )
                ],
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.text('medium'), findsOneWidget);
      },
    );

    testWidgets(
      'should render small text when mobile device width is less than 320',
      (WidgetTester tester) async {
        const Size size = Size(300, 480);
        await tester.binding.setSurfaceSize(size);
        tester.binding.window.physicalSizeTestValue = size;
        tester.binding.window.devicePixelRatioTestValue = 1;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: client,
          widget: MaterialApp(
            home: Material(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ScreenTypeLayout.builder(
                    mobileNormal: (BuildContext context) =>
                        const Text('medium'),
                    mobileSmall: (BuildContext context) => const Text('small'),
                    mobileLarge: (BuildContext context) => const Text('large'),
                  )
                ],
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.text('small'), findsOneWidget);
      },
    );

    testWidgets(
      'should render large text when mobile device width is greater than 480',
      (WidgetTester tester) async {
        const Size size = Size(640, 960);
        await tester.binding.setSurfaceSize(size);
        tester.binding.window.physicalSizeTestValue = size;
        tester.binding.window.devicePixelRatioTestValue = 1;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: client,
          widget: Builder(
            builder: (BuildContext context) {
              // The builder function must return a widget.
              return Material(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    getValueForScreenType<Widget>(
                      context: context,
                      mobileNormal: const Text('medium'),
                      mobileSmall: const Text('small'),
                      mobileLarge: const Text('large'),
                    ),
                  ],
                ),
              );
            },
          ),
        );

        await tester.pumpAndSettle();

        expect(find.text('large'), findsOneWidget);
      },
    );

    testWidgets(
      'should render large text when mobile device width is between  320-480',
      (WidgetTester tester) async {
        const Size size = Size(375, 640);
        await tester.binding.setSurfaceSize(size);
        tester.binding.window.physicalSizeTestValue = size;
        tester.binding.window.devicePixelRatioTestValue = 1;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: client,
          widget: Builder(
            builder: (BuildContext context) {
              // The builder function must return a widget.
              return Material(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    getValueForScreenType<Widget>(
                      context: context,
                      mobileNormal: const Text('medium'),
                      mobileSmall: const Text('small'),
                      mobileLarge: const Text('large'),
                    ),
                  ],
                ),
              );
            },
          ),
        );

        await tester.pumpAndSettle();

        expect(find.text('medium'), findsOneWidget);
      },
    );

    testWidgets(
      'should render small text when mobile device width is less than 320',
      (WidgetTester tester) async {
        const Size size = Size(300, 480);
        await tester.binding.setSurfaceSize(size);
        tester.binding.window.physicalSizeTestValue = size;
        tester.binding.window.devicePixelRatioTestValue = 1;

        await buildTestWidget(
          tester: tester,
          store: store,
          client: client,
          widget: Builder(
            builder: (BuildContext context) {
              // The builder function must return a widget.
              return Material(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    getValueForScreenType<Widget>(
                      context: context,
                      mobileNormal: const Text('medium'),
                      mobileSmall: const Text('small'),
                      mobileLarge: const Text('large'),
                    ),
                  ],
                ),
              );
            },
          ),
        );

        await tester.pumpAndSettle();

        expect(find.text('small'), findsOneWidget);
      },
    );

    test('When setCustomBreakPoint is called should update breakpoints', () {
      final ResponsiveSizingConfig config = ResponsiveSizingConfig();

      config.setCustomBreakpoints(
        const ScreenBreakpoints(
          mobileSmall: 300,
          mobileNormal: 400,
          mobileLarge: 600,
        ),
      );

      expect(config.breakpoints.mobileSmall, 300);
      expect(config.breakpoints.mobileNormal, 400);
      expect(config.breakpoints.mobileLarge, 600);
    });

    test(
        'When getDeviceType is called and is smallScreen should update return appropriate DeviceScreenType',
        () {
      final DeviceScreenType dT = getDeviceType(
        const Size(300, 480),
        const ScreenBreakpoints(
          mobileSmall: 300,
          mobileNormal: 400,
          mobileLarge: 600,
        ),
      );

      expect(dT, DeviceScreenType.mobileSmall);
    });

    test(
        'When getDeviceType is called and is normalScreen should update return appropriate DeviceScreenType',
        () {
      final DeviceScreenType dT = getDeviceType(
        const Size(450, 580),
        const ScreenBreakpoints(
          mobileSmall: 300,
          mobileNormal: 400,
          mobileLarge: 600,
        ),
      );

      expect(dT, DeviceScreenType.mobileNormal);
    });

    test(
        'When getDeviceType is called and is largeScreen should update return appropriate DeviceScreenType',
        () {
      final DeviceScreenType dT = getDeviceType(
        const Size(650, 980),
        const ScreenBreakpoints(
          mobileSmall: 300,
          mobileNormal: 400,
          mobileLarge: 600,
        ),
      );

      expect(dT, DeviceScreenType.mobileLarge);
    });
  });
}
