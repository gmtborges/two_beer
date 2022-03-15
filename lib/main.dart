import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:two_beer/blocs/catalog/catalog_beer_bloc.dart';
import 'package:two_beer/repositories/beer_repository.dart';

import 'firebase_options.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              CatalogBeerBloc(BeerRepository())..add(CatalogBeerFetchEvent()),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'SourceSansPro',
          colorScheme:
              ColorScheme.fromSwatch().copyWith(primary: Colors.amber[800]),
        ),
        title: '2Beer',
        home: const InicializeFirebase(),
      ),
    );
  }
}

class InicializeFirebase extends StatefulWidget {
  const InicializeFirebase({Key? key}) : super(key: key);

  @override
  _InicializeFirebaseState createState() => _InicializeFirebaseState();
}

class _InicializeFirebaseState extends State<InicializeFirebase> {
  final Future<FirebaseApp> _firebaseApp =
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = 'pt_BR';
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firebaseApp,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingFirebase();
        }
        if (snapshot.hasError) {
          return ErrorFirebase();
        }
        return HomeScreen();
      },
    );
  }
}

class LoadingFirebase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '2Beer',
          style: TextStyle(
            color: Colors.grey.shade800,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}

class ErrorFirebase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '2Beer',
          style: TextStyle(
            color: Colors.grey.shade800,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Houve um erro ao iniciar o aplicativo',
              style: TextStyle(fontSize: 18),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: Icon(
                Icons.error,
                color: Colors.red.shade700,
                size: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
