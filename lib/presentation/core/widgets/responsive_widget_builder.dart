// Flutter imports:
import 'package:flutter/material.dart';

enum DeviceScreenType {
  mobileSmall,
  mobileNormal,
  mobileLarge,
}

class ScreenTypeLayout extends StatelessWidget {
  final ScreenBreakpoints? breakpoints;
  final WidgetBuilder? mobileSmall;
  final WidgetBuilder? mobileLarge;
  final WidgetBuilder? mobileNormal;

  /// Each builder will get built based on the current device width.
  /// [breakpoints] define your own custom device resolutions
  /// [mobileLarge] will be built when width is greater than 480 on large screen sized mobile devices
  /// [mobileNormal] will be built when width is between 360-480 on normal screen sized mobile devices
  /// [mobileSmall] will be built if width is less than 360 on small screen sized mobile devices
  const ScreenTypeLayout.builder({
    Key? key,
    this.breakpoints,
    this.mobileSmall,
    this.mobileLarge,
    required this.mobileNormal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      breakpoints: breakpoints,
      builder: (BuildContext context, SizingInformation sizingInformation) {
        // If we're at mobileNormal size
        if (sizingInformation.deviceType == DeviceScreenType.mobileLarge) {
          // If we have supplied the large layout then display that
          if (mobileLarge != null) return mobileLarge!(context);
          // If no large layout is supplied we want to check if we have the size below it and display that
          return mobileNormal!(context);
        }

        if (sizingInformation.deviceType == DeviceScreenType.mobileSmall) {
          // If we have supplied the small layout then display that
          if (mobileSmall != null) return mobileSmall!(context);
        }

        // If none of the layouts above are supplied or we're on the mobile layout then we show the mobileNormal layout
        return mobileNormal!(context);
      },
    );
  }
}

typedef WidgetBuilder = Widget Function(BuildContext);

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    SizingInformation sizingInformation,
  ) builder;

  final ScreenBreakpoints? breakpoints;

  const ResponsiveBuilder({
    Key? key,
    required this.builder,
    this.breakpoints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints boxConstraints) {
      final MediaQueryData mediaQuery = MediaQuery.of(context);
      final SizingInformation sizingInformation = SizingInformation(
        deviceType: getDeviceType(mediaQuery.size, breakpoints),
        screenSize: mediaQuery.size,
        localWidgetSize:
            Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
      );
      return builder(context, sizingInformation);
    });
  }
}

class SizingInformation {
  final DeviceScreenType deviceType;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({
    required this.deviceType,
    required this.screenSize,
    required this.localWidgetSize,
  });
}

class ScreenBreakpoints {
  final double mobileSmall;
  final double mobileNormal;
  final double mobileLarge;

  const ScreenBreakpoints({
    this.mobileSmall = 320.0,
    this.mobileNormal = 360.0,
    this.mobileLarge = 480.0,
  });
}

class ResponsiveSizingConfig {
  static ResponsiveSizingConfig? _instance;
  static ResponsiveSizingConfig get instance {
    _instance ??= ResponsiveSizingConfig();

    return _instance!;
  }

  static const ScreenBreakpoints _defaultBreakPoints = ScreenBreakpoints();

  ScreenBreakpoints? _customBreakPoints;

  void setCustomBreakpoints(
    ScreenBreakpoints? customBreakpoints,
  ) {
    _customBreakPoints = customBreakpoints;
  }

  ScreenBreakpoints get breakpoints =>
      _customBreakPoints ?? _defaultBreakPoints;
}

/// Returns the [DeviceScreenType] that the application is currently running on
DeviceScreenType getDeviceType(
  Size size, [
  ScreenBreakpoints? breakpoint,
]) {
  final double deviceWidth = size.shortestSide;

  // Replaces the defaults with the user defined definitions
  if (breakpoint != null) {
    if (deviceWidth > breakpoint.mobileLarge) {
      return DeviceScreenType.mobileLarge;
    }
    if (deviceWidth > breakpoint.mobileNormal) {
      return DeviceScreenType.mobileNormal;
    }
  } else {
    // If no user defined definitions are passed through use the defaults
    if (deviceWidth >=
        ResponsiveSizingConfig.instance.breakpoints.mobileLarge) {
      return DeviceScreenType.mobileLarge;
    }
    if (deviceWidth >=
        ResponsiveSizingConfig.instance.breakpoints.mobileNormal) {
      return DeviceScreenType.mobileNormal;
    }
  }

  return DeviceScreenType.mobileSmall;
}

T getValueForScreenType<T>({
  required BuildContext context,
  T? mobileLarge,
  required T mobileNormal,
  T? mobileSmall,
}) {
  final DeviceScreenType deviceScreenType =
      getDeviceType(MediaQuery.of(context).size);
  // If we're at desktop size
  if (deviceScreenType == DeviceScreenType.mobileLarge) {
    // If we have supplied the desktop layout then display that
    if (mobileLarge != null) return mobileLarge;
    // If no desktop layout is supplied we want to check if we have the size below it and display that
    if (mobileNormal != null) return mobileNormal;
  }

  if (deviceScreenType == DeviceScreenType.mobileNormal) {
    if (mobileNormal != null) return mobileNormal;
  }

  if (deviceScreenType == DeviceScreenType.mobileSmall && mobileSmall != null) {
    return mobileSmall;
  }

  // If none of the layouts above are supplied or we're on the mobile layout then we show the mobile layout
  return mobileNormal;
}
