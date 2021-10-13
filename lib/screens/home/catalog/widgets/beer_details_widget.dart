import 'package:flutter/material.dart';
import 'package:two_beer/models/Beer.dart';

class BeerDetails extends StatelessWidget {
  final Beer selectedBeer;

  const BeerDetails(this.selectedBeer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber, elevation: 0),
      backgroundColor: Colors.amber,
      body: Stack(
        alignment: Alignment.centerRight,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BeerText(selectedBeer),
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 230,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage.assetNetwork(
                image: selectedBeer.imgSrc,
                placeholder: 'img/img-placeholder.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BeerText extends StatelessWidget {
  final Beer selectedBeer;

  const BeerText(this.selectedBeer);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(32, 0, 0, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Colorado',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const Text(
            'CERVEJARIA',
            style:
                TextStyle(color: Colors.black26, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            selectedBeer.name,
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const Text(
            'NOME',
            style:
                TextStyle(color: Colors.black26, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            selectedBeer.type,
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const Text(
            'TIPO',
            style:
                TextStyle(color: Colors.black26, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            selectedBeer.ibu.toString(),
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const Text(
            'IBU',
            style:
                TextStyle(color: Colors.black26, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            selectedBeer.abv.toString(),
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const Text(
            'ABV',
            style:
                TextStyle(color: Colors.black26, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
