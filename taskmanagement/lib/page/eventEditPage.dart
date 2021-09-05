import 'package:flutter/material.dart';
import 'package:taskmanagement/model/event.dart';

class EventEditPage extends StatefulWidget {
  final Event event;

  const EventEditPage({Key key, this.event}) : super(key: key);

  @override
  _EventEditPageState createState() => _EventEditPageState();
}

class _EventEditPageState extends State<EventEditPage> {
  DateTime fromDate;
  DateTime toDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Default değerler atanır
    fromDate = DateTime.now();
    toDate = DateTime.now().add(Duration(hours: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.teal,
        iconTheme: IconThemeData(
          color: Colors.white  ,
        ),
        shadowColor:Colors.teal ,
        leading: CloseButton(),
        actions: buildEditActions(),
      ),
    );
  }

 
}
