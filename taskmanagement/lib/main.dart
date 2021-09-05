import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
      localizationsDelegates: [
        SfGlobalLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('tr'),
        const Locale.fromSubtags(languageCode: "zh"),
      ],
      locale: const Locale('tr'),
      //////////////////////////
      ///

      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,

      title: 'Task Management',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: TaskPage(),
    );
  }
}
