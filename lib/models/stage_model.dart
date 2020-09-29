import 'package:flutter/material.dart';

class StageModel {
  final String title;
  final DateTime from;
  final DateTime till;

  final Color color;

  StageModel({
    @required this.title,
    @required this.from,
    @required this.till,
    @required this.color,
  });
}
