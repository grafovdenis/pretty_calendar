extension DatetimeUtils on DateTime {
  /// The last day of a given month
  DateTime get lastDayOfMonth {
    final beginningNextMonth = (this.month < 12)
        ? new DateTime(this.year, this.month + 1, 1)
        : new DateTime(this.year + 1, 1, 1);
    return beginningNextMonth.subtract(new Duration(days: 1));
  }

  /// First day of given month
  DateTime get firstDayOnMonth {
    return DateTime(this.year, this.month);
  }
}
