import 'package:flutter/material.dart';
import 'package:two_beer/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'SourceSansPro',
        colorScheme:
            ColorScheme.fromSwatch().copyWith(primary: Colors.amber[800]),
      ),
      title: '2Beer',
      home: HomeScreen(),
    );
  }
}
