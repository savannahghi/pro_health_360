class DateTimeParser {
  final bool useCustomDateTime;
  final DateTime? customDateTime;

  DateTimeParser({this.useCustomDateTime = false, this.customDateTime});
  String parsedExpireAt(int expiresIn) {
    DateTime dateTimeToUse;
    if (this.useCustomDateTime && customDateTime != null) {
      dateTimeToUse = this.customDateTime!;
    } else {
      dateTimeToUse = DateTime.now();
    }

    final String parsedExpiresAt = dateTimeToUse
        .add(
          Duration(
            seconds: expiresIn,
          ),
        )
        .toIso8601String();
    return parsedExpiresAt;
  }
}
