part of 'beer_bloc.dart';

@immutable
abstract class CatalogBeerEvent extends Equatable {
  const CatalogBeerEvent();

  @override
  List<Object> get props => [];
}

class CatalogBeerLoadEvent extends CatalogBeerEvent {}

class CatalogBeerUpdateEvent extends CatalogBeerEvent {
  final List<Beer> beers;

  const CatalogBeerUpdateEvent(this.beers);

  @override
  List<Object> get props => [beers];
}
