import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:two_beer/amplifyconfiguration.dart';
import 'package:two_beer/models/Beer.dart';
import 'package:two_beer/models/ModelProvider.dart';
import 'package:two_beer/repository/beer_repository.dart';

class CatalogView extends StatefulWidget {
  @override
  State<CatalogView> createState() => _CatalogViewState();
}

class _CatalogViewState extends State<CatalogView> {
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

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _fetchBeers() async {
    final beerRepository = BeerRepository(_amplifyDataStore);
    try {
      List<Beer> updatedBeers = await beerRepository.fetchBeers();

      setState(() {
        _beers = updatedBeers;
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
    return Container(
      child: Column(
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
      ),
    );
  }
}

class BeerList extends StatelessWidget {
  final List<Beer> beers;

  BeerList({required this.beers});

  @override
  Widget build(BuildContext context) {
    return beers.length > 1
        ? ListView(
            padding: EdgeInsets.all(8),
            children: beers
                .map((beer) => BeerItem(
                    key: Key(beer.id),
                    imageSrc:
                        'https://emporiodacerveja.vtexassets.com/arquivos/ids/173479/ribeiraoLager1_1000x1000px.jpg',
                    beerType: 'lager',
                    beerIBU: beer.ibu ?? 10,
                    beerABV: beer.abv ?? 4.5,
                    beerRating: beer.score ?? 5,
                    obs: 'description',
                    beerName: beer.name ?? 'sem nome'))
                .toList(),
          )
        : Center(
            child: Text('Tá na hora de tomar uma pra adicionar aqui'),
          );
  }
}

class BeerItem extends StatelessWidget {
  final bool isFavorite;
  final String imageSrc;
  final String beerName;
  final String beerType;
  final int beerIBU;
  final double beerABV;
  final int beerRating;
  final String obs;

  const BeerItem({
    required Key key,
    required this.imageSrc,
    required this.beerType,
    required this.beerIBU,
    required this.beerABV,
    required this.beerRating,
    required this.obs,
    this.isFavorite = false,
    required this.beerName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 160,
                  child: FadeInImage.assetNetwork(
                    width: 160,
                    fit: BoxFit.contain,
                    image: imageSrc,
                    placeholder: 'img/img-placeholder.png',
                  )),
              Container(
                height: 180,
                child: VerticalDivider(
                  color: Colors.grey[300],
                  thickness: 1,
                  width: 1,
                  indent: 10,
                  endIndent: 10,
                ),
              ),
              Infos(
                  key: ValueKey(imageSrc),
                  beerName: beerName,
                  beerType: beerType,
                  beerIBU: beerIBU,
                  beerABV: beerABV,
                  beerRating: beerRating),
              Container(
                child: Container(
                  height: 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      this.isFavorite
                          ? Container(
                              padding: EdgeInsets.fromLTRB(0, 6, 6, 0),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red[700],
                                size: 20,
                              ),
                            )
                          : Container(
                              height: 20,
                              width: 20,
                            ),
                      Container(
                        child: IconButton(
                          onPressed: () => {},
                          icon: Icon(
                            Icons.chevron_right,
                            color: Colors.grey[500],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Infos extends StatelessWidget {
  final String beerName;
  final String beerType;
  final int beerIBU;
  final double beerABV;
  final int beerRating;

  const Infos(
      {required Key key,
      required this.beerType,
      required this.beerIBU,
      required this.beerABV,
      required this.beerRating,
      required this.beerName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 16, 0, 0),
        child: Column(
          children: [
            Container(
              child: Text(
                beerName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: BeerRating(
                  value: beerRating,
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              child: Column(
                children: [
                  TagBeerType(
                    beerType: beerType,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Column(
                    children: [
                      Text('IBU'),
                      TagBeerIBU(
                        beerIBU: beerIBU,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Column(
                    children: [
                      Text('ABV'),
                      TagBeerABV(beerABV: beerABV),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TagBeerABV extends StatelessWidget {
  const TagBeerABV({
    Key? key,
    required this.beerABV,
  }) : super(key: key);

  final double beerABV;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[100],
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(10),
        right: Radius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          beerABV.toString() + '%',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class TagBeerType extends StatelessWidget {
  final String beerType;

  Color? _getColorByBeerType(String beerType) {
    switch (beerType) {
      case 'Weiss':
        return Colors.amber[200];
      case 'Lager':
        return Colors.amber[400];
      default:
        return Colors.grey[400];
    }
  }

  const TagBeerType({Key? key, required this.beerType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: _getColorByBeerType(beerType),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(10),
          right: Radius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            beerType,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class TagBeerIBU extends StatelessWidget {
  final int beerIBU;

  Color? _getColorByBeerIBU(int beerIBU) {
    switch (beerIBU) {
      case 10:
        return Colors.teal[100];
      case 20:
        return Colors.teal[300];
      default:
        return Colors.grey[400];
    }
  }

  const TagBeerIBU({Key? key, required this.beerIBU}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: _getColorByBeerIBU(beerIBU),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(10),
          right: Radius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            beerIBU.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class BeerRating extends StatelessWidget {
  final int value;
  const BeerRating({Key? key, this.value = 0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return IconTheme(
          data: IconThemeData(color: Colors.amber, size: 18),
          child: Icon(
            index < value ? Icons.star : Icons.star_border,
          ),
        );
      }),
    );
  }
}
