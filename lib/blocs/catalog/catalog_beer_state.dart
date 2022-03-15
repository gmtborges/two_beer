part of 'catalog_beer_bloc.dart';

@immutable
abstract class CatalogBeerState extends Equatable {
  const CatalogBeerState();

  @override
  List<Object> get props => [];
}

class CatalogBeerLoadingState extends CatalogBeerState {}

class CatalogBeerDataState extends CatalogBeerState {
  final List<Beer> beers;

  const CatalogBeerDataState(this.beers);

  @override
  List<Object> get props => [beers];
}

class CatalogBeerErrorState extends CatalogBeerState {
  final dynamic error;

  const CatalogBeerErrorState([this.error]);
}
