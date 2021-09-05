import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({ Key key }) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
       floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Yeni Etkinlik Ekle',
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      body:SfCalendar(
        view:CalendarView.month,
        firstDayOfWeek: 1,
        monthViewSettings: MonthViewSettings(
          appointmentDisplayCount: 2,
          dayFormat: 'EEEEE',
          showAgenda: true,
          agendaViewHeight: 400,
        ),
      )
    );
  }
}

class MeetingDataSource extends CalendarDataSource{
  
}