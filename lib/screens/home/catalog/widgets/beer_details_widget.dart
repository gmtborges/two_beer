import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:two_beer/models/beer.dart';
import 'package:two_beer/screens/home/catalog/widgets/beer_info_widget.dart';

class BeerDetails extends StatelessWidget {
  final Beer selectedBeer;

  const BeerDetails(this.selectedBeer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber[800], elevation: 0),
      backgroundColor: Colors.amber[800],
      body: Stack(
        children: [
          BeerInfos(selectedBeer),
          Positioned(
            top: 160,
            right: 5,
            child: Container(
              margin: const EdgeInsets.only(right: 10, bottom: 50),
              width: 230,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade100),
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
          ),
        ],
      ),
    );
  }
}

class BeerInfos extends StatelessWidget {
  final Beer selectedBeer;

  const BeerInfos(this.selectedBeer);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BeerInfoUP(selectedBeer),
        BeerInfoDown(selectedBeer),
      ],
    );
  }
}

class BeerInfoUP extends StatelessWidget {
  final Beer selectedBeer;

  const BeerInfoUP(this.selectedBeer);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(32, 0, 0, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            selectedBeer.brand,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
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
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
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
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
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
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
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
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
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

class BeerInfoDown extends StatelessWidget {
  final Beer selectedBeer;
  const BeerInfoDown(this.selectedBeer);

  String _formatDate(DateTime date) {
    return DateFormat('dd MMM, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.fromLTRB(12, 22, 12, 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BeerRating(selectedBeer.score, 24),
            const SizedBox(
              height: 24,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: selectedBeer.isFavorite
                      ? const Icon(
                          Icons.favorite,
                          size: 18,
                          color: Colors.red,
                        )
                      : const SizedBox(
                          height: 18,
                        ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Text(
                _formatDate(
                  selectedBeer.createdAt.toDate(),
                ),
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 16,
                ),
              ),
            ),
            Text(
              selectedBeer.obs ?? 'Sem descrição',
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
