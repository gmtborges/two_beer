import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:two_beer/amplifyconfiguration.dart';
import 'package:two_beer/models/Beer.dart';
import 'package:two_beer/models/ModelProvider.dart';
import 'package:two_beer/repository/beer_repository.dart';

import 'widgets/beer_list_widget.dart';

class Catalog extends StatefulWidget {
  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  bool _isLoading = true;
  List<Beer> _beers = [];

  final AmplifyDataStore _amplifyDataStore =
      AmplifyDataStore(modelProvider: ModelProvider.instance);
  final AmplifyAPI _amplifyAPI = AmplifyAPI();
  final AmplifyAuthCognito _amplifyAuthCognito = AmplifyAuthCognito();

  @override
  void initState() {
    _inicializeApp();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _inicializeApp() async {
    await _configureAmplify();
    await _fetchBeers();
  }

  Future<void> _fetchBeers() async {
    final beerRepository = BeerRepository(_amplifyDataStore);
    try {
      List<Beer> updatedBeers = await beerRepository.fetchBeers();

      new Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _beers = updatedBeers;
          _isLoading = false;
        });
      });

      print('Query result $updatedBeers');
    } on DataStoreException catch (e) {
      print('Query failed: $e');
    }
  }

  Future<void> _configureAmplify() async {
    try {
      await Amplify.addPlugins(
          [_amplifyDataStore, _amplifyAPI, _amplifyAuthCognito]);
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      print(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android. $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _isLoading
            ? Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Expanded(
                child: BeerList(
                  beers: _beers,
                ),
              )
      ],
    );
  }
}
