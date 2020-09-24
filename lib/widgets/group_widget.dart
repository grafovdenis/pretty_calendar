import 'package:flutter/material.dart';

class GroupWidget extends StatelessWidget {
  final String title;
  final Color color;
  const GroupWidget({Key key, this.title, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: const Color.fromRGBO(88, 88, 88, 1),
            ),
          ),
          Container(
            height: 3,
            width: 50,
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
          ),
        ],
      ),
    );
  }
}
