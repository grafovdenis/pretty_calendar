import 'package:flutter/material.dart';

class GroupModel {
  final String title;
  final DateTime from;
  final DateTime till;

  final Color color;

  GroupModel({
    @required this.title,
    @required this.from,
    @required this.till,
    @required this.color,
  });
}
