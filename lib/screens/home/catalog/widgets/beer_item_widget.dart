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
      child: Row(
        children: [
          Container(
            child: imageSrc != ''
                ? FadeInImage.assetNetwork(
                    width: 180,
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
          Container(
            child: Container(
              height: 180,
              padding: EdgeInsets.only(top: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  this.isFavorite
                      ? Container(
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
    );
  }
}
