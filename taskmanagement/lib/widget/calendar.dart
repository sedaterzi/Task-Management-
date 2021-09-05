import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:taskmanagement/homePage.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
          view: CalendarView.month,
          firstDayOfWeek: 1,
          initialSelectedDate: DateTime.now(),
          cellBorderColor: Colors.black12,
           monthViewSettings: MonthViewSettings(
            appointmentDisplayCount: 2,
            dayFormat: 'EEEEE',
            showAgenda: true,
          ), 
          dataSource: MeetingDataSource(getAppointments()),
        );
  }
}