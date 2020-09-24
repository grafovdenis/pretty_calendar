import 'package:flutter/material.dart';
import 'package:pretty_calendar/widgets/calendar_widget.dart';
import 'package:pretty_calendar/widgets/legend_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      body: Column(
        children: [
          SizedBox(height: 20),
          LegendWidget(),
          CalendarWidget(
            year: today.year,
            month: today.month,
          ),
        ],
      ),
    );
  }
}
