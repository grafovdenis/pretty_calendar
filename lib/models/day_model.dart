import 'package:flutter/material.dart';

class DayModel {
  ///Base properties
  final int day;
  final bool isCurrentMonth;

  final Color color;
  final List<Color> underlineColors;
  final bool hasPrev;
  final bool hasNext;

  DayModel({
    this.isCurrentMonth = true,
    this.color = Colors.white,
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
