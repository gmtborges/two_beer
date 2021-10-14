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
          margin: const EdgeInsets.fromLTRB(0, 8, 8, 0),
          alignment: Alignment.centerRight,
          child: isFavorite
              ? const Icon(Icons.star, color: Colors.amber, size: 20)
              : const SizedBox(
                  height: 20,
                ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Column(
            children: [
              Text(beerName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: BeerRating(beerRating, 18),
              ),
              Container(
                // constraints: BoxConstraints(maxWidth: 60),
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: TagBeerType(beerType),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text('IBU'),
                        Text(
                          beerIBU.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('ABV'),
                        Text(
                          '${beerABV.toString()}%',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12, right: 8),
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
  final double iconSize;
  const BeerRating(this.value, this.iconSize);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return IconTheme(
          data: IconThemeData(color: Colors.orange, size: iconSize),
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

  const TagBeerType(this.beerType);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: _getColorByBeerType(beerType),
      borderRadius: const BorderRadius.horizontal(
        left: Radius.circular(8),
        right: Radius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(6, 1, 6, 1),
        child: Text(
          beerType,
        ),
      ),
    );
  }
}
