import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:two_beer/blocs/catalog/catalog_beer_bloc.dart';
import 'package:two_beer/models/beer.dart';
import 'package:two_beer/repositories/beer_repository.dart';

import 'beer_catalog_bloc_test.mocks.dart';

@GenerateMocks([BeerRepository])
void main() {
  late MockBeerRepository mockBeerRepository;
  late CatalogBeerBloc catalogBeerBloc;
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

  setUp(() {
    mockBeerRepository = MockBeerRepository();
    catalogBeerBloc = CatalogBeerBloc(mockBeerRepository);
  });

  group('CatalogBeerBloc |', () {
    test('initial state is CatalogBeerLoadingState', () {
      expect(catalogBeerBloc.state, isA<CatalogBeerLoadingState>());
    });

    blocTest<CatalogBeerBloc, CatalogBeerState>(
      'emits CatalogBeerDataState with a beerList when fetch event is fired',
      build: () {
        // _mockFirestore.collection('beers').add(beer.toJson());
        when(mockBeerRepository.fetchAllBeers()).thenAnswer(
          (_) => Stream.fromIterable([List.filled(1, beer)]),
        );
        return catalogBeerBloc;
      },
      act: (bloc) => bloc.add(CatalogBeerFetchEvent()),
      expect: () => [
        isA<CatalogBeerDataState>()
            .having((state) => state.beers[0].name, 'name', equals('cerveja'))
      ],
    );

    blocTest<CatalogBeerBloc, CatalogBeerState>(
      'emits CatalogBeerErrorState when firestore returns an error',
      build: () {
        when(mockBeerRepository.fetchAllBeers())
            .thenAnswer((_) => Stream.error('deu ruim'));
        return catalogBeerBloc;
      },
      act: (bloc) => bloc.add(CatalogBeerFetchEvent()),
      expect: () => [isA<CatalogBeerErrorState>()],
    );
  });
}
