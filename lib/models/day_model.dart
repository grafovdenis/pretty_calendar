import 'package:flutter/material.dart';

class DayModel {
  ///Base properties
  final int day;
  final bool isCurrentMonth;
  final Color color;

  DayModel({
    @required this.day,
    this.isCurrentMonth = true,
    this.color = Colors.white,
  });
}
