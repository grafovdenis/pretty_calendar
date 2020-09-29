import 'package:flutter/material.dart';
import 'package:pretty_calendar/models/day_model.dart';

class DayWidget extends StatelessWidget {
  final DayModel model;

  const DayWidget({
    Key key,
    @required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius buildBorders() {
      if (model.color == Colors.white) {
        return BorderRadius.zero;
      } else {
        return BorderRadius.only(
          topLeft: (model.day.weekday == DateTime.monday &&
                      model.day.day >= 1 &&
                      model.day.day <= 7 ||
                  model.day.day == 1 ||
                  model.isFirstStage)
              ? Radius.circular(8)
              : Radius.zero,
          topRight: (model.day.weekday == DateTime.sunday &&
                  model.day.day >= 1 &&
                  model.day.day <= 7)
              ? Radius.circular(8)
              : Radius.zero,
          bottomLeft:
              (model.day.weekday == DateTime.monday && model.day.day >= 28)
                  ? Radius.circular(8)
                  : Radius.zero,
          bottomRight: (model.day.weekday == DateTime.sunday &&
                      model.day.add(Duration(days: 7)).month !=
                          model.day.month ||
                  model.day.add(Duration(days: 1)).month ==
                      model.day.month + 1 ||
                  model.day.add(Duration(days: 1)).year == model.day.year + 1 ||
                  model.isLastStage)
              ? Radius.circular(8)
              : Radius.zero,
        );
      }
    }

    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: model.color,
        borderRadius: buildBorders(),
      ),
      child: Center(
        child: Text(
          "${model.day.day}",
          style: TextStyle(
            fontSize: 14,
            color: (model.isCurrentMonth) ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
}
