import 'package:flutter/material.dart';

class BeerInfo extends StatelessWidget {
  final String? beerName;
  final String? beerType;
  final int beerIBU;
  final double? beerABV;
  final int? beerRating;

  const BeerInfo(
      {required Key key,
      this.beerType,
      required this.beerIBU,
      this.beerABV,
      this.beerRating,
      this.beerName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 16, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.maxFinite,
              child: Center(
                child: Text(
                  beerName ?? 'uma cerveja com nome grande',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: BeerRating(
                  value: beerRating ?? 0,
                )),
            Container(
              constraints: BoxConstraints(maxWidth: 60),
              margin: EdgeInsets.symmetric(vertical: 4),
              child: Column(
                children: [
                  TagBeerType(
                    beerType: beerType ?? 'tipo',
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
                      TagBeerABV(beerABV: beerABV != null ? beerABV : 0),
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

class BeerRating extends StatelessWidget {
  final int value;
  const BeerRating({Key? key, this.value = 0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return IconTheme(
          data: IconThemeData(color: Colors.orange, size: 18),
          child: Icon(
            index < value ? Icons.sports_bar : Icons.sports_bar_outlined,
          ),
        );
      }),
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
          left: Radius.circular(8),
          right: Radius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Center(
            child: Text(
              beerType,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
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
      constraints: BoxConstraints(minWidth: 25),
      child: Material(
        color: _getColorByBeerIBU(beerIBU),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(8),
          right: Radius.circular(8),
        ),
        child: Container(
          padding: const EdgeInsets.all(4.0),
          child: Center(
            child: Text(
              beerIBU.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
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

  final double? beerABV;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Colors.grey[100],
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(8),
          right: Radius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(
            child: Text(
              beerABV.toString() + '%',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
