import 'package:flutter/material.dart';

class RangeDialog extends StatelessWidget {
  const RangeDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Выбрать диапазон",
          style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(88, 88, 88, 1),
              fontWeight: FontWeight.w500),
        ),
        IconButton(
          icon: Icon(
            Icons.close,
            color: Color.fromRGBO(88, 88, 88, 1),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    final Widget bottomButton = SizedBox(
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {},
        child: Text(
          "Выбрать",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        color: Color.fromRGBO(5, 115, 230, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );

    return Material(
      type: MaterialType.transparency,
      child: Container(
        margin:
            const EdgeInsets.all(20) + const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromRGBO(238, 238, 238, 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: header,
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Text(
                    "Диапазон дат",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(88, 88, 88, 1),
                    ),
                  ),
                  SizedBox(height: 8),
                  bottomButton,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
