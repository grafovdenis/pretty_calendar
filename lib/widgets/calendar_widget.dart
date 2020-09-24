import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:pretty_calendar/models/day_model.dart';
import 'package:pretty_calendar/widgets/day_widget.dart';
import 'package:pretty_calendar/utils/date_utils.dart';

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
              onPressed: () {},
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
          data.add(DayModel(day: prevMonday.day + i, isCurrentMonth: false));
        }
      }
    }

    void buildMonth() {
      for (int i = 0; i < daysInMonth; i++) {
        data.add(DayModel(day: i + 1));
      }
    }

    final DateTime lastDayOfMonth = firstDayOfMonth.lastDayOfMonth;

    void buildNextWeek() {
      if (lastDayOfMonth.weekday == 7) {
        return;
      } else {
        for (int i = 0; i < 7 - lastDayOfMonth.weekday; i++) {
          data.add(DayModel(day: i + 1, isCurrentMonth: false));
        }
      }
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
                const EdgeInsets.only(left: 20, top: 15, right: 19, bottom: 15),
            child: calendarHeader,
          ),
          Container(
            height: 2,
            color: Color.fromRGBO(238, 238, 238, 1),
          ),
          body,
        ],
      ),
    );
  }
}
