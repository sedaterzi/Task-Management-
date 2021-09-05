import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:taskmanagement/homePage.dart';
import 'package:taskmanagement/provider/eventProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(
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
      ),
    );
  }
}
