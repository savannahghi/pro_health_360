// Project imports:
import 'package:myafyahub/domain/core/value_objects/date_time_constants.dart';

class DateTimeParser {
  final bool useCustomDateTime;
  final DateTime? customDateTime;

  DateTimeParser({this.useCustomDateTime = false, this.customDateTime});
  String parsedExpireAt(int expiresIn) {
    DateTime dateTimeToUse;
    if (!this.useCustomDateTime) {
      dateTimeToUse = DateTime.now();
    } else {
      dateTimeToUse = this.customDateTime!;
    }
    final String parsedExpiresAt = dateTimeToUse
        .add(
          Duration(
            seconds: expiresIn - kTokenCustomBeforeExpiryTimeInSeconds,
          ),
        )
        .toIso8601String();
    return parsedExpiresAt;
  }
}
