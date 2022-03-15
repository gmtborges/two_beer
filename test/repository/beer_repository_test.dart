import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:two_beer/models/beer.dart';
import 'package:two_beer/repositories/beer_repository.dart';

void main() {
  final _mockFirestore = FakeFirebaseFirestore();
  final beer = Beer(
    name: 'cerveja',
    brand: 'cervejaria',
    createdAt: Timestamp.now(),
    type: 'Lager',
    ibu: 5,
    abv: 20,
    score: 4,
    imgSrc: 'imgSrc',
    isFavorite: false,
  );

  _mockFirestore.collection('beers').add(beer.toJson());
  final BeerRepository beerRepository = BeerRepository(_mockFirestore);

  group('BeerRepository |', () {
    test('should fetch a list of all beers', () {
      // Arrange

      // Act
      final beerList$ = beerRepository.fetchAllBeers();

      // Assert
      beerList$.listen(
        expectAsync1((List<Beer> value) {
          expect(value.first.name, equals('cerveja'));
          expect(value.first.type, equals('Lager'));
        }),
      );
    });
  });
}
