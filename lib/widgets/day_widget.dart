import 'package:flutter/material.dart';

class DayWidget extends StatelessWidget {
  final int index;

  const DayWidget({Key key, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     border: Border.all(style: BorderStyle.none, width: 0),
      //     color: Colors.red,
      //     boxShadow: [BoxShadow(color: Colors.red, spreadRadius: 1)]),
      child: Center(
          child: Text(
        "${index + 1}",
        style: TextStyle(fontSize: 14),
      )),
      height: 48,
      width: 48,
    );
  }
}
