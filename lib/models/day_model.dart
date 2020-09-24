class DayModel {
  ///Base properties
  final int day;
  final bool isCurrentMonth;

  final String color;
  final List<String> underlineColors;
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

  DayModel copyWith({
    String color,
    List<String> underlineColors,
    bool hasPrev,
    bool hasNext,
  }) {}
}
