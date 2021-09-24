import 'package:flutter/material.dart';

import 'beer_info_widget.dart';

class BeerItem extends StatelessWidget {
  final bool isFavorite;
  final String? imageSrc;
  final String? beerName;
  final String? beerType;
  final int beerIBU;
  final double? beerABV;
  final int? beerRating;
  final String? obs;

  const BeerItem({
    required Key key,
    this.imageSrc,
    this.beerType,
    required this.beerIBU,
    this.beerABV,
    this.beerRating,
    this.obs,
    required this.isFavorite,
    this.beerName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: FadeInImage.assetNetwork(
                  width: 180,
                  fit: BoxFit.contain,
                  image: imageSrc ??
                      'https://media.istockphoto.com/vectors/beer-bottle-vector-vector-id1018339728',
                  placeholder: 'img/img-placeholder.png',
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
