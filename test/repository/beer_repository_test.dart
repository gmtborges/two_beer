import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:two_beer/models/Beer.dart';

class AmplifyDataStoreMock extends Mock implements AmplifyDataStore {}

void main() {
  final amplifyDataStoreMock = new AmplifyDataStoreMock();
  List<Beer> listBeers = [
    Beer(
        name: 'Colorado Lager',
        description: 'uma descrição',
        abv: 5,
        ibu: 12,
        isFavorite: false,
        score: 4),
  ];

  group('BeerRepository', () {
    test('should fetch a list of beers', () {
      // Arrange
      when(amplifyDataStoreMock.query(Beer.classType))
          .thenAnswer((_) async => Future.value(listBeers));

      // Act

      // Assert
    });
  });
}
