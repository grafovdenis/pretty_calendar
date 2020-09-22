import 'package:flutter/material.dart';
import 'package:pretty_calendar/widgets/calendar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CalendarWidget(),
    );
  }
}
