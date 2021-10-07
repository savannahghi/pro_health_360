// Dart imports:
import 'dart:io';

String fixture(String name) =>
    File('test/tests_resources/fixtures/$name').readAsStringSync();
