import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:two_beer/models/Beer.dart';
import 'package:two_beer/repository/beer_repository.dart';

class AmplifyDataStoreMock extends Mock implements AmplifyDataStore {}

void main() {
  final amplifyDataStoreMock = new AmplifyDataStoreMock();
  BeerRepository beerRepository;
  List<Beer> listBeersMock = [
    Beer(
        name: 'Colorado Lager',
        description: 'uma descrição',
        abv: 5,
        ibu: 12,
        isFavorite: false,
        score: 4),
  ];

  setUp(() {
    reset(amplifyDataStoreMock);
    beerRepository = new BeerRepository(amplifyDataStoreMock);
  });

  group('BeerRepository', () {
    test('should fetch a list of Beers', () async {
      // Arrange
      when(amplifyDataStoreMock.query(Beer.classType))
          .thenAnswer((_) async => Future.value(listBeersMock));

      // Act
      final listBeers = await beerRepository.fetchBeers();

      // Assert
      expect(listBeers.isNotEmpty, true);
      expect(listBeers.first.name, equals('Colorado Lager'));
    });
  });
}
