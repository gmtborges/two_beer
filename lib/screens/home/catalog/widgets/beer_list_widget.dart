import 'package:flutter/material.dart';
import 'package:two_beer/models/beer.dart';
import 'package:two_beer/screens/home/catalog/widgets/beer_details_widget.dart';

import 'beer_card_widget.dart';

class BeerList extends StatelessWidget {
  final List<Beer> beers;

  const BeerList(this.beers);

  @override
  Widget build(BuildContext context) {
    return beers.isNotEmpty
        ? ListView.builder(
            itemCount: beers.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BeerDetails(beers[index]),
                    ),
                  );
                },
                child: BeerCard(
                  beer: beers[index],
                  key: Key(beers[index].name),
                ),
              );
            },
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
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
