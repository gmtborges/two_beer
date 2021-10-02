import 'package:firebase_core/firebase_core.dart';
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
      home: InicializeFirebase(),
    );
  }
}

class InicializeFirebase extends StatefulWidget {
  InicializeFirebase({Key? key}) : super(key: key);

  @override
  _InicializeFirebaseState createState() => _InicializeFirebaseState();
}

class _InicializeFirebaseState extends State<InicializeFirebase> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  @override
  void initState() {
    super.initState();
    initializeFlutterFire();
  }

// Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return Center(
        child: Text('Erro ao carregar os dados. =('),
      );
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return HomeScreen();
  }
}
