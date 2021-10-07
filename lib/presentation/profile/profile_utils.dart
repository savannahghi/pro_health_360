// Package imports:
import 'package:intl/intl.dart';

String returnCurrentYear() {
  final DateTime now = DateTime.now();
  return DateFormat('y').format(now).toString();
}
