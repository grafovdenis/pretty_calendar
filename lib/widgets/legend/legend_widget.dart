import 'package:flutter/material.dart';
import 'package:pretty_calendar/calendar_colors.dart';
import 'package:pretty_calendar/widgets/legend/group_widget.dart';

import 'legend_item_widget.dart';

class LegendWidget extends StatelessWidget {
  const LegendWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
        title: Text(
          "Легенда",
          style: TextStyle(
            color: Color.fromRGBO(88, 88, 88, 1),
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        children: [
          SizedBox(height: 15),
          Row(
            children: [
              LegendItemWidget(
                title: "Плейофф",
                color: StageColors.playoff,
              ),
              LegendItemWidget(
                title: "Этап 1",
                color: StageColors.stage1,
              ),
              LegendItemWidget(
                title: "Этап 2",
                color: StageColors.stage2,
              ),
              LegendItemWidget(
                title: "Финал",
                color: StageColors.finalStage,
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
