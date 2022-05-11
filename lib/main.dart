import 'package:flutter/material.dart';
import 'package:myafyahub/domain/core/value_objects/app_context_constants.dart';

import 'application/core/services/app_bootstrap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  appBootStrap(testAppContexts);
}
