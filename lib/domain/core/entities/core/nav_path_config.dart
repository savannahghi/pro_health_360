import 'package:freezed_annotation/freezed_annotation.dart';

part 'nav_path_config.freezed.dart';

@freezed
class AppNavConfig with _$AppNavConfig {
  factory AppNavConfig({
    // The next route to navigate to
    required String nextRoute,

    // The previous route to navigate to
    required String previousRoute,

    // Any route arguments that may need to be passed while navigating
    @Default(null) dynamic arguments,
  }) = _AppNavConfig;
}
