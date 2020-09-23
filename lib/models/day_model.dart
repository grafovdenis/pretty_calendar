class DayModel {
  final String color;
  final int day;
  final List<String> underlineColors;
  final bool isCurrentMonth;
  final bool hasPrev;
  final bool hasNext;

  DayModel({
    this.isCurrentMonth = true,
    this.color = "white",
    this.day,
    this.underlineColors,
    this.hasPrev = false,
    this.hasNext = false,
  });
}
