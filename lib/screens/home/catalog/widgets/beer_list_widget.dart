import 'package:flutter/material.dart';
import 'package:two_beer/models/Beer.dart';

import 'beer_card_widget.dart';

class BeerList extends StatelessWidget {
  final List<Beer> beers;

  BeerList({required this.beers});

  @override
  Widget build(BuildContext context) {
    return beers.length > 0
        ? ListView.builder(
            itemCount: beers.length,
            itemBuilder: (context, index) {
              return BeerCard(
                beer: beers[index],
                key: Key(beers[index].name),
              );
            })
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tá na hora de tomar uma pra adicionar aqui!',
                  style: TextStyle(fontSize: 18),
                ),
                Icon(
                  Icons.sports_bar,
                  color: Colors.amber[700],
                  size: 24,
                )
              ],
            ),
          );
  }
}
