import 'package:flutter/material.dart';

class DayModel {
  ///Base properties
  final DateTime day;
  final bool isCurrentMonth;

  DayModel({
    @required this.day,
    this.isCurrentMonth = true,
  });
}
