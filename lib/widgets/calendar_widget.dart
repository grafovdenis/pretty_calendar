import 'package:flutter/material.dart';
import 'package:pretty_calendar/widgets/day_widget.dart';
import 'package:pretty_calendar/utils/date_utils.dart';

class CalendarWidget extends StatelessWidget {
  CalendarWidget({Key key}) : super(key: key);
  final List<int> data = List<int>();

  static final DateTime currentMonth = DateTime.now();
  static final DateTime firstDayOfMonth = currentMonth.firstDayOnMonth;

  void buildPrevWeek() {}

  void buildNextWeek() {}

  final int firstDayWeekDay = firstDayOfMonth.weekday;

  final DateTime lastDayOfMonth = currentMonth.lastDayOfMonth;

  final Widget header = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("ПН"),
      Text("ВТ"),
      Text("СР"),
      Text("ЧТ"),
      Text("ПТ"),
      Text("СБ"),
      Text("ВС"),
    ],
  );

  final body = GridView.builder(
      itemCount: 35,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
      addRepaintBoundaries: false,
      primary: false,
      shrinkWrap: true,
      itemBuilder: (context, index) => DayWidget(
            index: index,
          ));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 15, right: 19, bottom: 15),
          child: header,
        ),
        Container(
          height: 2,
          color: Color.fromRGBO(238, 238, 238, 1),
        ),
        body,
        // ListView.builder(
        //   shrinkWrap: true,
        //   itemBuilder: (context, index) => Container(
        //     decoration: BoxDecoration(
        //         border: Border.all(style: BorderStyle.none, width: 0),
        //         color: Colors.red),
        //     child: Center(
        //         child: Text(
        //       "${index + 1}",
        //       style: TextStyle(fontSize: 14),
        //     )),
        //     height: 48,
        //     width: 48,
        //   ),
        //   itemCount: 10,
        // ),
      ],
    );
  }
}
