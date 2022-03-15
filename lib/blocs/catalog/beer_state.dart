part of 'beer_bloc.dart';

@immutable
abstract class CatalogBeerState extends Equatable {
  const CatalogBeerState();

  @override
  List<Object> get props => [];
}

class CatalogBeerLoadingState extends CatalogBeerState {}

class CatalogBeerLoadedState extends CatalogBeerState {
  final List<Beer> beers;

  const CatalogBeerLoadedState(this.beers);

  @override
  List<Object> get props => [beers];
}

class CatalogBeerErrorState extends CatalogBeerState {
  final dynamic error;

  const CatalogBeerErrorState([this.error]);
}
