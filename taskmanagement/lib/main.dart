import 'package:flutter/material.dart';
import 'package:taskmanagement/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Management',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: TaskPage(),
    );
  }
}
