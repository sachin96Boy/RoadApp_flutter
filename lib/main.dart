import 'package:flutter/material.dart';

import './screens/register_screen.dart';
import './screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safty First',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[600],
        accentColor: Colors.green[400],
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 72.0,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            fontSize: 36.0,
            fontStyle: FontStyle.italic,
          ),
          bodyText2: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      home: RegisterPage(),
      routes: {
        '/login': (BuildContext context) => LogInPage(),
      },
    );
  }
}
