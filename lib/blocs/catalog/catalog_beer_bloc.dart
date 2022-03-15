import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beer/models/beer.dart';
import 'package:two_beer/repositories/beer_repository.dart';

part 'catalog_beer_event.dart';
part 'catalog_beer_state.dart';

class CatalogBeerBloc extends Bloc<CatalogBeerEvent, CatalogBeerState> {
  final BeerRepository _beerRepository;
  StreamSubscription? _beerSubscription;

  CatalogBeerBloc(this._beerRepository) : super(CatalogBeerLoadingState()) {
    on<CatalogBeerFetchEvent>(_onFetchBeers);
    on<CatalogBeerUpdateDataEvent>(_onUpdateBeersData);
  }

  void _onFetchBeers(_event, emit) {
    _beerSubscription?.cancel();
    _beerSubscription = _beerRepository.fetchAllBeers().listen(
      (beers) {
        add(CatalogBeerUpdateDataEvent(beers));
      },
      onError: (error) {
        emit(CatalogBeerErrorState(error));
      },
    );
  }

  void _onUpdateBeersData(CatalogBeerUpdateDataEvent event, emit) {
    emit(CatalogBeerDataState(event.beers));
  }
}
