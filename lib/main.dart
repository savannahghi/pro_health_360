// Dart imports:
import 'dart:async';

// Project imports:
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';
import 'application/core/services/app_bootstrap.dart';

Future<void> main() async {
  await appBootStrap(testAppContexts);
}
