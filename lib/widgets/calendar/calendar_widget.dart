import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:pretty_calendar/calendar_colors.dart';
import 'package:pretty_calendar/models/day_model.dart';
import 'package:pretty_calendar/models/group_model.dart';
import 'package:pretty_calendar/models/stage_model.dart';
import 'package:pretty_calendar/widgets/calendar/day_widget.dart';
import 'package:pretty_calendar/utils/date_utils.dart';
import 'package:pretty_calendar/widgets/range/range_dialog.dart';

const MONTHS = {
  1: "Январь",
  2: "Февраль",
  3: "Март",
  4: "Апрель",
  5: "Май",
  6: "Июнь",
  7: "Июль",
  8: "Август",
  9: "Сентябрь",
  10: "Октябрь",
  11: "Ноябрь",
  12: "Декабрь",
};

class CalendarWidget extends StatefulWidget {
  final int year;
  final int month;
  CalendarWidget({Key key, @required this.year, @required this.month})
      : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime selectedDate;
  final Color blueColor = Color.fromRGBO(5, 115, 230, 1);
  final List<StageModel> stages = [];
  final List<GroupModel> groups = [];

  void addStages() {
    stages.clear();
    stages.addAll([
      StageModel(
        title: "Плейофф",
        from: DateTime(selectedDate.year, selectedDate.month, 4),
        till: DateTime(selectedDate.year, selectedDate.month, 6),
        color: StageColors.playoff,
      ),
      StageModel(
        title: "Этап 1",
        from: DateTime(selectedDate.year, selectedDate.month, 7),
        till: DateTime(selectedDate.year, selectedDate.month, 13),
        color: StageColors.stage1,
      ),
      StageModel(
        title: "Этап 2",
        from: DateTime(selectedDate.year, selectedDate.month, 14),
        till: DateTime(selectedDate.year, selectedDate.month, 26),
        color: StageColors.stage2,
      ),
      StageModel(
        title: "Финал",
        from: DateTime(selectedDate.year, selectedDate.month, 27),
        till: DateTime(selectedDate.year, selectedDate.month, 28),
        color: StageColors.finalStage,
      ),
    ]);
  }

  void addGroups() {
    groups.clear();
    groups.addAll([
      GroupModel(
        title: "Группа A",
        from: DateTime(selectedDate.year, selectedDate.month, 7),
        till: DateTime(selectedDate.year, selectedDate.month, 10),
        color: GroupColors.groupA,
      ),
      GroupModel(
        title: "Группа Б",
        from: DateTime(selectedDate.year, selectedDate.month, 11),
        till: DateTime(selectedDate.year, selectedDate.month, 16),
        color: GroupColors.groupB,
      ),
      GroupModel(
        title: "Группа В",
        from: DateTime(selectedDate.year, selectedDate.month, 14),
        till: DateTime(selectedDate.year, selectedDate.month, 19),
        color: GroupColors.groupC,
      ),
    ]);
  }

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime(widget.year, widget.month);
  }

  Widget header(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: RichText(
                text: TextSpan(
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500),
                    children: [
                      WidgetSpan(child: SizedBox(height: 1, width: 20)),
                      TextSpan(
                        text: "${MONTHS[selectedDate?.month]}",
                      ),
                      WidgetSpan(child: SizedBox(height: 1, width: 20)),
                      TextSpan(text: "${selectedDate?.year}"),
                    ]),
              ),
              onTap: () {
                final today =
                    selectedDate ?? DateTime(widget.year, widget.month);
                showMonthPicker(
                  context: context,
                  initialDate: today,
                  firstDate: today.subtract(const Duration(days: 365)),
                  lastDate: today.add(const Duration(days: 365)),
                  locale: Locale('ru'),
                ).then((date) {
                  if (date != null) {
                    setState(() {
                      selectedDate = date;
                    });
                  }
                });
              },
            ),
            FloatingActionButton.extended(
              backgroundColor: Colors.white,
              label: Text(
                "Диапазон",
                style: TextStyle(
                  color: blueColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              icon: Icon(
                Icons.calendar_today,
                color: blueColor,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => RangeDialog(),
                );
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      );

  final Widget calendarHeader = Row(
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

  @override
  Widget build(BuildContext context) {
    final List<DayModel> data = List<DayModel>();
    final DateTime firstDayOfMonth = DateTime(
        selectedDate.year ?? widget.year, selectedDate.month ?? widget.month);

    final int daysInMonth = 32 -
        DateTime(selectedDate.year ?? widget.year,
                selectedDate.month ?? widget.month, 32)
            .day;

    void buildPrevWeek() {
      if (firstDayOfMonth.weekday == 1) {
        return;
      } else {
        final prevMonday = firstDayOfMonth
            .subtract(Duration(days: firstDayOfMonth.weekday - 1));
        for (int i = 0;
            i < firstDayOfMonth.difference(prevMonday).inDays;
            i++) {
          data.add(DayModel(
              day: prevMonday.add(Duration(days: i)), isCurrentMonth: false));
        }
      }
    }

    void buildMonth() {
      for (int i = 0; i < daysInMonth; i++) {
        final day = firstDayOfMonth.add(Duration(days: i));
        Color color = Colors.white;
        bool isFirstStage = false;
        bool isLastStage = false;
        for (var stage in stages) {
          if (day.isAfter(stage.from) && day.isBefore(stage.till)) {
            color = stage.color;
          }
          if (day.isAtSameMomentAs(stage.from)) {
            if (stage == stages.first) {
              isFirstStage = true;
            }
            color = stage.color;
          }
          if (day.isAtSameMomentAs(stage.till)) {
            color = stage.color;
            if (stage == stages.last) {
              isLastStage = true;
            }
          }
        }

        data.add(DayModel(
          day: day,
          color: color,
          isFirstStage: isFirstStage,
          isLastStage: isLastStage,
        ));
      }
    }

    final DateTime lastDayOfMonth = firstDayOfMonth.lastDayOfMonth;

    void buildNextWeek() {
      if (lastDayOfMonth.weekday == 7) {
        return;
      } else {
        for (int i = 0; i < 7 - lastDayOfMonth.weekday; i++) {
          data.add(DayModel(
            day: lastDayOfMonth.add(Duration(days: i + 1)),
            isCurrentMonth: false,
          ));
        }
      }
    }

    if (selectedDate != null) {
      addStages();
      addGroups();
    }

    buildPrevWeek();

    buildMonth();
    buildNextWeek();

    final body = GridView.builder(
      itemCount: data.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
      addRepaintBoundaries: false,
      primary: false,
      shrinkWrap: true,
      itemBuilder: (context, index) => DayWidget(
        model: data[index],
      ),
    );

    return Container(
      child: Column(
        children: [
          header(context),
          Container(
            color: Colors.white,
            padding:
                const EdgeInsets.only(left: 30, top: 15, right: 30, bottom: 15),
            child: calendarHeader,
          ),
          Container(
            height: 2,
            color: Color.fromRGBO(238, 238, 238, 1),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            color: Colors.white,
            child: body,
          ),
        ],
      ),
    );
  }
}
