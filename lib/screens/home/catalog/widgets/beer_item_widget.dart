import 'package:flutter/material.dart';

import 'beer_info_widget.dart';

class BeerItem extends StatelessWidget {
  final String beerName;
  final String beerType;
  final int beerIBU;
  final double beerABV;
  final int beerScore;
  final bool isFavorite;
  final String imageSrc;
  final String description;

  const BeerItem({
    required Key key,
    required this.beerName,
    required this.beerType,
    required this.beerIBU,
    required this.imageSrc,
    required this.beerABV,
    required this.beerScore,
    required this.description,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: imageSrc != ''
                ? FadeInImage.assetNetwork(
                    image: imageSrc,
                    placeholder: 'img/img-placeholder.png',
                  )
                : Image.asset(
                    'img/img-placeholder.png',
                    width: 180,
                  ),
          ),
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
          BeerInfo(
              key: ValueKey(imageSrc),
              beerName: beerName,
              beerType: beerType,
              beerIBU: beerIBU,
              beerABV: beerABV,
              beerRating: beerScore),
        ],
      ),
    );
  }
}
