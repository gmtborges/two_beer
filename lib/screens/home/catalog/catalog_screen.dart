import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:two_beer/models/Beer.dart';

import 'widgets/beer_list_widget.dart';

class CatalogScreen extends StatefulWidget {
  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  bool _isLoading = true;
  List<Beer> _beers = [];

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    _fetchBeers();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _fetchBeers() async {
    List<Beer> _updatedBeers = [];
    try {
      firestore.collection('beers').get().then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((element) {
          var beer = Beer(
              name: element['name'],
              createdAt: element['createdAt'],
              type: element['type'],
              ibu: element['ibu'],
              abv: double.parse(element['abv'].toString()),
              score: element['score'],
              imgSrc: element['imgSrc'],
              isFavorite: element['isFavorite']);
          _updatedBeers.add(beer);
        });
        setState(() {
          _beers = _updatedBeers;
          _isLoading = false;
        });
      });
    } catch (e) {
      print('Query failed: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '2Beer',
          style: TextStyle(
              color: Colors.grey.shade800, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.amber.shade700,
              ),
              onPressed: null),
          IconButton(
              icon: Icon(
                Icons.sort,
                color: Colors.amber.shade700,
              ),
              onPressed: null),
        ],
      ),
      body: Column(
        children: [
          _isLoading
              ? Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Expanded(
                  child: BeerList(_beers),
                )
        ],
      ),
    );
  }
}
