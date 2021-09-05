import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmanagement/model/event.dart';
import 'package:taskmanagement/provider/eventProvider.dart';
import 'package:taskmanagement/utils.dart';

class EventEditPage extends StatefulWidget {
  final Event event;

  const EventEditPage({Key key, this.event}) : super(key: key);

  @override
  _EventEditPageState createState() => _EventEditPageState();
}

class _EventEditPageState extends State<EventEditPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
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
  void dispose() {
    titleController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.teal,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        shadowColor: Colors.teal,
        leading: CloseButton(),
        actions: buildEditActions(),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Title(),
                SizedBox(height: 12),
                DateTimePickers(),
              ],
            ),
          )),
    );
  }

  List<Widget> buildEditActions() => [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          icon: Icon(Icons.done),
          label: Text('KAYDET'),
          onPressed: saveForm,
        ),
      ];

  Widget Title() => TextFormField(
        controller: titleController,
        validator: (title) =>
            title != null && title.isEmpty ? 'Etkinlik Başlığı Giriniz.' : null,
        style: TextStyle(fontSize: 24),
        onFieldSubmitted: (_) => saveForm(),
        decoration: InputDecoration(
            border: UnderlineInputBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0))),
            hintText: 'Etkinlik Başlığı'),
      );

  // ignore: non_constant_identifier_names
  Widget DateTimePickers() => Column(
        children: [
          SizedBox(height: 12),
          Text('BAŞLANGIÇ', style: TextStyle(fontWeight: FontWeight.bold)),
          FromDate(),
          SizedBox(height: 12),
          Text('BİTİŞ', style: TextStyle(fontWeight: FontWeight.bold)),
          ToDate(),
        ],
      );

  // ignore: non_constant_identifier_names
  Widget FromDate() => Row(
        children: [
          Expanded(
              flex: 2,
              child: DropDownField(
                text: Utils.toDate(fromDate),
                onClicked: () => selectFromDateTime(slctDate: true),
              )),
          Expanded(
              child: DropDownField(
            text: Utils.toTime(fromDate),
            onClicked: () => selectFromDateTime(slctDate: false),
          ))
        ],
      );

  Widget ToDate() => Row(
        children: [
          Expanded(
              flex: 2,
              child: DropDownField(
                text: Utils.toDate(toDate),
                onClicked: () => selectToDateTime(slctDate: true),
              )),
          Expanded(
              child: DropDownField(
            text: Utils.toTime(toDate),
            onClicked: () => selectToDateTime(slctDate: false),
          ))
        ],
      );
//Başlangıç saat değeri kontrol ve ayarlaması
  Future selectFromDateTime({bool slctDate}) async {
    final date = await selectDateTime(fromDate, slctDate: slctDate);
    if (date == null) return;

    if (date.isAfter(toDate)) {
      //Başlangıç, bitişten sonra kontrolü
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }

    setState(() {
      fromDate = date;
    });
  }

  Future<DateTime> selectDateTime(
    DateTime initialDate, {
    bool slctDate,
    DateTime firstDate,
  }) async {
    if (slctDate) {
      //Takvim sınırları
      final date = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate ?? DateTime(2015, 8),
          lastDate: DateTime(2101));

      if (date == null) return null;

      final time = Duration(
        hours: initialDate.hour,
        minutes: initialDate.minute,
      );

      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );

      if (timeOfDay == null) return null;

      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
      return date.add(time);
    }
  }

//Bitiş saat değeri kontrol ve ayarlaması
  Future selectToDateTime({bool slctDate}) async {
    final date = await selectDateTime(toDate,
        slctDate: slctDate,
        //başlangıç tarihinden önce seçimi durdur.
        firstDate: slctDate ? fromDate : null);
    if (date == null) return;

    setState(() {
      toDate = date;
    });
  }

  Widget DropDownField({String text, VoidCallback onClicked}) => ListTile(
        title: Text(text),
        trailing: Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );

  Future saveForm() async {
    final isValid = _formKey.currentState.validate();

    if (isValid) {
      final event = Event(
        title: titleController.text,
        from: fromDate,
        to: toDate,
        description: 'Açıklama',
        isAllDay: false,
      );
      final provider= Provider.of<EventProvider>(context,listen: false );
      provider.addEvent(event);

      Navigator.of(context).pop();
    }
  }
}
