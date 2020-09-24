import 'package:flutter/material.dart';

class LegendItemWidget extends StatelessWidget {
  final Color color;
  final String title;

  const LegendItemWidget({
    Key key,
    this.color = Colors.white,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      margin: const EdgeInsets.only(right: 15),
      child: Text(
        title,
        style:
            TextStyle(fontSize: 12, color: const Color.fromRGBO(88, 88, 88, 1)),
      ),
    );
  }
}
