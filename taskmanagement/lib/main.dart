import 'package:flutter/material.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:taskmanagement/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //////////Paket Dil Desteği////////////////
      localizationsDelegates: [SfGlobalLocalizations.delegate],
      supportedLocales: [
        const Locale('tr'),
      ],
      locale: const Locale('tr'),
      //////////////////////////
      debugShowCheckedModeBanner: false,
      title: 'Task Management',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: TaskPage(),
    );
  }
}
