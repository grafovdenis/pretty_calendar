import 'package:flutter/material.dart';
import 'package:pretty_calendar/models/day_model.dart';

class DayWidget extends StatelessWidget {
  final DayModel model;

  const DayWidget({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(style: BorderStyle.none, width: 0),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Center(
              child: Text(
            "${model.day.day}",
            style: TextStyle(
              fontSize: 14,
              color: (model.isCurrentMonth) ? Colors.black : Colors.grey,
            ),
          )),
        ],
      ),
      height: 48,
      width: 48,
    );
  }
}
