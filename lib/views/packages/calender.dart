import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/model/calendar_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/datetime.dart';
import 'package:flutter_timeline_calendar/timeline/model/day_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/headers_options.dart';
import 'package:flutter_timeline_calendar/timeline/provider/instance_provider.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_types.dart';
import 'package:flutter_timeline_calendar/timeline/utils/datetime_extension.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Calendar> {
  late CalendarDateTime selectedDateTime;
  late DateTime? weekStart;
  late DateTime? weekEnd;
  @override
  void initState() {
    super.initState();
    TimelineCalendar.calendarProvider = createInstance();
    selectedDateTime = TimelineCalendar.calendarProvider.getDateTime();
    getLatestWeek();
  }

  getLatestWeek() {
    setState(() {
      weekStart = selectedDateTime.toDateTime().findFirstDateOfTheWeek();
      weekEnd = selectedDateTime.toDateTime().findLastDateOfTheWeek();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _timelineCalendar(),
      ],
    );
  }

  _timelineCalendar() {
    return TimelineCalendar(
      calendarType: CalendarType.GREGORIAN,
      calendarLanguage: "en",
      calendarOptions: CalendarOptions(
          viewType: ViewType.DAILY,
          toggleViewType: true,
          headerMonthElevation: 10,
          headerMonthShadowColor: Colors.black26,
          headerMonthBackColor: Colors.transparent,
          weekStartDate: weekStart,
          weekEndDate: weekEnd),
      dayOptions: DayOptions(
          compactMode: true,
          dayFontSize: 14.0,
          disableFadeEffect: true,
          weekDaySelectedColor: const Color(0xff3AC3E2),
          differentStyleForToday: true,
          todayBackgroundColor: Colors.black,
          selectedBackgroundColor: const Color(0xff3AC3E2),
          todayTextColor: Colors.white),
      headerOptions: HeaderOptions(
          weekDayStringType: WeekDayStringTypes.SHORT,
          monthStringType: MonthStringTypes.FULL,
          backgroundColor: const Color(0xdddddd),
          headerTextSize: 14,
          headerTextColor: Colors.black),
      onChangeDateTime: (dateTime) {
        print("Date Change $dateTime");
        selectedDateTime = dateTime;
        getLatestWeek();
      },
      onDateTimeReset: (resetDateTime) {
        print("Date Reset $resetDateTime");
        selectedDateTime = resetDateTime;
        getLatestWeek();
      },
      onMonthChanged: (monthDateTime) {
        print("Month Change $monthDateTime");
        selectedDateTime = monthDateTime;
        getLatestWeek();
      },
      onYearChanged: (yearDateTime) {
        print("Year Change $yearDateTime");
        selectedDateTime = yearDateTime;
        getLatestWeek();
      },
      dateTime: selectedDateTime,
    );
  }
}