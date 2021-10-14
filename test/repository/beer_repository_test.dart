import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:two_beer/models/beer.dart';
import 'package:two_beer/repository/beer_repository.dart';

void main() {
  BeerRepository beerRepository = BeerRepository();
  List<Beer> listBeersMock = [];

  setUp(() {});

  group('BeerRepository', () {
    test('should fetch a list of Beers', () async {
      //Arrange
      // when(mockAmplifyDataStore.query(Beer.classType))
      //     .thenAnswer((_) async => Future.value(listBeersMock));

      // // Act
      final listBeers = await beerRepository.fetchBeers();

      // Assert
      expect(listBeers.isNotEmpty, true);
      expect(listBeers.first.name, equals('Colorado Lager'));
    });
  });
}
