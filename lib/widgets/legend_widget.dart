import 'package:flutter/material.dart';
import 'package:pretty_calendar/calendar_colors.dart';
import 'package:pretty_calendar/widgets/group_widget.dart';

import 'legend_item_widget.dart';

///TODO make it expandable?
class LegendWidget extends StatelessWidget {
  const LegendWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Легенда",
                style: TextStyle(
                  color: Color.fromRGBO(88, 88, 88, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              LegendItemWidget(
                title: "Плейофф",
                color: TypeColors.playoff,
              ),
              LegendItemWidget(
                title: "Этап 1",
                color: TypeColors.stage1,
              ),
              LegendItemWidget(
                title: "Этап 2",
                color: TypeColors.stage2,
              ),
              LegendItemWidget(
                title: "Финал",
                color: TypeColors.finalStage,
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              GroupWidget(
                title: "Группа А",
                color: GroupColors.groupA,
              ),
              GroupWidget(
                title: "Группа Б",
                color: GroupColors.groupB,
              ),
              GroupWidget(
                title: "Группа В",
                color: GroupColors.groupC,
              ),
            ],
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
