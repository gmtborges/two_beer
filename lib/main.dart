import 'package:flutter/material.dart';
import 'package:two_beer/pages/home/home_page.dart';

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
            ColorScheme.fromSwatch().copyWith(primary: Colors.amber[700]),
      ),
      title: '2Beer',
      home: HomePage(),
    );
  }
}
