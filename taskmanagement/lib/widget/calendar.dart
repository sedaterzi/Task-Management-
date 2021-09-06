import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:taskmanagement/homePage.dart';
import 'package:taskmanagement/model/eventDataSource.dart';
import 'package:taskmanagement/provider/eventProvider.dart';
import 'package:taskmanagement/widget/tasksWidget.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({  Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;


    return SfCalendar(
          view: CalendarView.month,
          firstDayOfWeek: 1,
          initialSelectedDate: DateTime.now(),
          cellBorderColor: Colors.black12,
          onLongPress: (details){
            final provider = Provider.of<EventProvider>(context, listen:false);

            provider.setDate(details.date!);
            showModalBottomSheet(context: context, builder: (context)=> TasksWidget(),);
          },
            monthViewSettings: MonthViewSettings(
            appointmentDisplayCount: 2,
            dayFormat: 'EEEEE',
            showAgenda: true,
          ),  
          dataSource: EventDataSource(events),
        );
  }
}