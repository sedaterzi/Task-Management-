import 'package:flutter/material.dart';
import 'package:taskmanagement/page/eventEditPage.dart';
import 'package:taskmanagement/widget/calendar.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 15.0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        shadowColor:Colors.transparent ,
      ),
      body: CalendarWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => EventEditPage())),
        tooltip: 'Yeni Etkinlik Ekle',
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
}
