import 'package:flutter/material.dart';

class BeerInfo extends StatelessWidget {
  final String beerName;
  final String beerType;
  final int beerIBU;
  final double beerABV;
  final int beerRating;
  final bool isFavorite;

  const BeerInfo(
      {required Key key,
      required this.beerType,
      required this.isFavorite,
      required this.beerIBU,
      required this.beerABV,
      required this.beerRating,
      required this.beerName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 8, 8, 0),
          alignment: Alignment.centerRight,
          child: isFavorite
              ? Icon(Icons.star, color: Colors.amber, size: 20)
              : SizedBox(
                  height: 20,
                ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Column(
            children: [
              Text(beerName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: BeerRating(
                    value: beerRating,
                  )),
              Container(
                // constraints: BoxConstraints(maxWidth: 60),
                margin: EdgeInsets.symmetric(vertical: 4),
                child: TagBeerType(
                  beerType: beerType,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text('IBU'),
                          Text(beerIBU.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text('ABV'),
                          Text(beerABV.toString() + '%',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 12, right: 8),
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.chevron_right,
            color: Colors.grey.shade500,
          ),
        ),
      ],
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
          padding: const EdgeInsets.fromLTRB(6, 1, 6, 1),
          child: Text(
            beerType,
          ),
        ),
      ),
    );
  }
}
