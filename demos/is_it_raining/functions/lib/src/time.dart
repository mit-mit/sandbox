extension CurrentTime on DateTime {
  String get time {
    final hour = this.hour.toString().padLeft(2, '0');
    final minute = this.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}

extension NowDenmark on DateTime {
  DateTime get inDenmark {
    final nowUtc = DateTime.now().toUtc();

    final offset = _denmarkOffset(nowUtc);
    final nowInDenmark = nowUtc.add(offset);

    return nowInDenmark;
  }
}

// Denmark is UTC+1 (CET) in winter, UTC+2 (CEST) in summer
Duration _denmarkOffset(DateTime utc) {
  // DST in Denmark: last Sunday in March 01:00 UTC → last Sunday in October 01:00 UTC
  final dstStart = _lastSundayOf(utc.year, 3, hour: 1);
  final dstEnd = _lastSundayOf(utc.year, 10, hour: 1);
  final isDst = utc.isAfter(dstStart) && utc.isBefore(dstEnd);

  return Duration(hours: isDst ? 2 : 1);
}

DateTime _lastSundayOf(int year, int month, {required int hour}) {
  // Start from the last day of the month and walk back to Sunday
  var day = DateTime.utc(year, month + 1, 0); // last day of month
  while (day.weekday != DateTime.sunday) {
    day = day.subtract(const Duration(days: 1));
  }
  return DateTime.utc(year, day.month, day.day, hour);
}
