import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beer/models/beer.dart';
import 'package:two_beer/repositories/beer_repository.dart';

part 'beer_event.dart';
part 'beer_state.dart';

class CatalogBeerBloc extends Bloc<CatalogBeerEvent, CatalogBeerState> {
  final BeerRepository _beerRepository;
  StreamSubscription? _beerSubscription;

  CatalogBeerBloc(this._beerRepository) : super(CatalogBeerLoadingState());

  Stream<CatalogBeerState> mapEventToState(CatalogBeerEvent event) async* {
    if (event is CatalogBeerLoadEvent) {
      yield* _mapLoadBeersToState();
    }
    if (event is CatalogBeerUpdateEvent) {
      yield* _mapUpdateBeersToState(event);
    }
  }

  Stream<CatalogBeerState> _mapLoadBeersToState() async* {
    _beerSubscription?.cancel();
    _beerSubscription = _beerRepository.fetchAllBeers().listen(
          (beers) => add(CatalogBeerUpdateEvent(beers)),
          onError: (error) => CatalogBeerErrorState(error),
        );
  }

  Stream<CatalogBeerState> _mapUpdateBeersToState(
    CatalogBeerUpdateEvent event,
  ) async* {
    yield CatalogBeerLoadedState(event.beers);
  }
}
