// Dart imports:
import 'dart:async';

// Project imports:
import 'package:myafyahub/application/core/services/app_bootstrap.dart';
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';

Future<void> main() async {
  await appBootStrap(prodAppContexts);
}
