part of 'catalog_beer_bloc.dart';

@immutable
abstract class CatalogBeerEvent extends Equatable {
  const CatalogBeerEvent();

  @override
  List<Object> get props => [];
}

class CatalogBeerFetchEvent extends CatalogBeerEvent {}

class CatalogBeerUpdateDataEvent extends CatalogBeerEvent {
  final List<Beer> beers;

  const CatalogBeerUpdateDataEvent(this.beers);

  @override
  List<Object> get props => [beers];
}
