import 'package:flutter/material.dart';
import 'package:pretty_calendar/models/day_model.dart';

class DayWidget extends StatelessWidget {
  final DayModel model;

  const DayWidget({Key key, @required this.model}) : super(key: key);

  Color stringToColor() {
    switch (model.color) {
      case "purple":
        return Color.fromRGBO(245, 240, 255, 1);
      case "yellow":
        return Color.fromRGBO(255, 240, 240, 1);
      case "blue":
        return Color.fromRGBO(240, 246, 255, 1);
      case "green":
        return Color.fromRGBO(240, 255, 240, 1);
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(style: BorderStyle.none, width: 0),
        color: stringToColor(),
      ),
      child: Center(
          child: Text(
        "${model.day}",
        style: TextStyle(
          fontSize: 14,
          color: (model.isCurrentMonth) ? Colors.black : Colors.grey,
        ),
      )),
      height: 48,
      width: 48,
    );
  }
}
