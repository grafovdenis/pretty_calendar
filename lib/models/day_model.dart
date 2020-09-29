import 'package:flutter/material.dart';

class DayModel {
  ///Base properties
  final DateTime day;
  final bool isCurrentMonth;
  final Color color;
  final bool isFirstStage;
  final bool isLastStage;

  DayModel({
    @required this.day,
    this.isCurrentMonth = true,
    this.color = Colors.white,
    this.isFirstStage = false,
    this.isLastStage = false,
  });
}
