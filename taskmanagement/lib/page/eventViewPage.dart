import 'package:taskmanagement/model/event.dart';
import 'package:taskmanagement/page/eventEditPage.dart';
import 'package:taskmanagement/provider/eventProvider.dart';
import 'package:taskmanagement/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventViewPage extends StatelessWidget {
  final Event event;

  const EventViewPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        actions: buildViewActions(context, event),
      ),
     /* body: ListView(
        padding: EdgeInsets.all(32),
        children: <Widget>[
          buildDateTime(event),
          SizedBox(
            height: 32,
          ),
          Text(
            event.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            event.description,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),*/
    );

  }
/*
  Widget buildDateTime(Event event) {
    return Column(
      children: [
        buildDate(event.isAllDay ? 'Tüm Gün' : 'Başlangıç', event.from),
        if(!event.isAllDay) buildDate('Bitiş', event.to),

      ],
    );
  }

  Widget buildDate(String title, DateTime date) {}

  List<Widget> buildViewActions(BuildContext context, Event event) {
     IconButton(
       icon: Icon(Icons.edit),
       onPressed: ()=> Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => EventEditPage(event:event))),   
       ),
  }
*/

  List<Widget> buildViewActions(BuildContext context, Event event) =>
    [ IconButton(
       icon: Icon(Icons.edit),
       onPressed: ()=> Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => EventEditPage(event:event))),   
       ),];
  
  
}
