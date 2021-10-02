import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter/material.dart';
import 'package:two_beer/models/Beer.dart';
import 'package:two_beer/repository/beer_repository.dart';

import 'widgets/beer_list_widget.dart';

class CatalogScreen extends StatefulWidget {
  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  bool _isLoading = true;
  List<Beer> _beers = [];

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
    await _fetchBeers();
  }

  Future<void> _fetchBeers() async {
    final beerRepository = BeerRepository();
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
