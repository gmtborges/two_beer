import 'dart:async';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import 'models/Beer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      title: 'Amplified Beer',
      home: BeersPage(),
    );
  }
}

class BeersPage extends StatefulWidget {
  @override
  _BeersPageState createState() => _BeersPageState();
}

class _BeersPageState extends State<BeersPage> {
  bool _isLoading;
  List<Beer> _beers;
  StreamSubscription _subscription;

  final AmplifyDataStore _dataStorePlugin =
      AmplifyDataStore(modelProvider: ModelProvider.instance);
  final AmplifyAPI _apiPlugin = AmplifyAPI();
  final AmplifyAuthCognito _authPlugin = AmplifyAuthCognito();

  @override
  void initState() {
    _isLoading = true;
    _beers = [];

    _initializeApp();

    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  Future<void> _initializeApp() async {
    await _configureAmplify();

    _subscription = Amplify.DataStore.observe(Beer.classType).listen((event) {
      _fetchBeers();
    });

    await _fetchBeers();

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _configureAmplify() async {
    try {
      await Amplify.addPlugins([_dataStorePlugin, _apiPlugin, _authPlugin]);
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      print('An error occurred while configuring Amplify: $e');
    }
  }

  Future<void> _fetchBeers() async {
    try {
      List<Beer> updatedBeers = await Amplify.DataStore.query(Beer.classType);

      setState(() {
        _beers = updatedBeers;
      });
    } catch (e) {
      print('An error occurred while querying Beers: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Beer List'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : BeersList(beers: _beers),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddBeerForm()),
          );
        },
        tooltip: 'Add Beer',
        label: Row(
          children: [Icon(Icons.add), Text('Add beer')],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class BeersList extends StatelessWidget {
  final List<Beer> beers;

  BeersList({this.beers});

  @override
  Widget build(BuildContext context) {
    return beers.length >= 1
        ? Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(8),
                  itemCount: beers.length,
                  itemBuilder: (ctx, idx) => BeerItem(
                        beer: beers[idx],
                      )),
              SignInButton(Buttons.Google, onPressed: () => {}),
              SignInButton(Buttons.Facebook, onPressed: () => {}),
            ],
          )
        : Center(child: Text('Tap button below to add a beer!'));
  }
}

class BeerItem extends StatelessWidget {
  final double iconSize = 24.0;
  final Beer beer;

  BeerItem({this.beer});

  void _deleteBeer(BuildContext context) async {
    try {
      await Amplify.DataStore.delete(beer);
    } catch (e) {
      print('An error occurred while deleting Beer: $e');
    }
  }

  Future<void> _toggleIsFavorite() async {
    Beer updatedBeer = beer.copyWith(isFavorite: !beer.isFavorite);
    try {
      await Amplify.DataStore.save(updatedBeer);
    } catch (e) {
      print('An error occurred while saving Beer: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          _toggleIsFavorite();
        },
        onLongPress: () {
          _deleteBeer(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(beer.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(beer.description ?? 'No description'),
                ],
              ),
            ),
            Icon(beer.isFavorite ? Icons.favorite : Icons.favorite_outline,
                size: iconSize, color: Colors.red),
          ]),
        ),
      ),
    );
  }
}

class AddBeerForm extends StatefulWidget {
  @override
  _AddBeerFormState createState() => _AddBeerFormState();
}

class _AddBeerFormState extends State<AddBeerForm> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<void> _saveBeer() async {
    String name = _nameController.text;
    String description = _descriptionController.text;

    Beer newBeer =
        Beer(name: name, description: description, isFavorite: false);

    try {
      await Amplify.DataStore.save(newBeer);
      Navigator.of(context).pop();
    } catch (e) {
      print('An error occurred while saving Beer: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Beer'),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(filled: true, labelText: 'Name')),
              TextFormField(
                  controller: _descriptionController,
                  decoration:
                      InputDecoration(filled: true, labelText: 'Description')),
              ElevatedButton(onPressed: _saveBeer, child: Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
