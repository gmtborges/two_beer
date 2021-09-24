import 'package:flutter/material.dart';
import 'package:two_beer/models/Beer.dart';

import 'beer_item_widget.dart';

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
                    imageSrc: beer.imgSrc,
                    beerType: beer.type,
                    beerIBU: beer.ibu ?? 0,
                    beerABV: beer.abv ?? 0,
                    beerRating: beer.score,
                    obs: 'description',
                    isFavorite: beer.isFavorite ?? false,
                    beerName: beer.name))
                .toList(),
          )
        : Center(
            child: Text('Tá na hora de tomar uma pra adicionar aqui'),
          );
  }
}
