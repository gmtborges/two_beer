import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:two_beer/models/Beer.dart';
import 'package:two_beer/repository/beer_repository.dart';
import 'beer_repository_test.mocks.dart';

@GenerateMocks([AmplifyDataStore])
void main() {
  var mockAmplifyDataStore = new MockAmplifyDataStore();
  BeerRepository beerRepository = BeerRepository(mockAmplifyDataStore);
  List<Beer> listBeersMock = [
    Beer(
        id: '1',
        name: 'Colorado Lager',
        abv: 5,
        ibu: 12,
        isFavorite: false,
        score: 4),
  ];

  setUp(() {});

  group('BeerRepository', () {
    test('should fetch a list of Beers', () async {
      //Arrange
      when(mockAmplifyDataStore.query(Beer.classType))
          .thenAnswer((_) async => Future.value(listBeersMock));

      // // Act
      final listBeers = await beerRepository.fetchBeers();

      // Assert
      expect(listBeers.isNotEmpty, true);
      expect(listBeers.first.name, equals('Colorado Lager'));
    });
  });
}
