import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_beer/blocs/catalog/catalog_beer_bloc.dart';

import 'widgets/beer_list_widget.dart';

class CatalogScreen extends StatefulWidget {
  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '2Beer',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.amber[800],
        elevation: 0,
        actions: const <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.sort, color: Colors.white),
            onPressed: null,
          ),
        ],
      ),
      backgroundColor: Colors.amber[800],
      body: Column(
        children: [
          const SizedBox(
            width: double.maxFinite,
            height: 40,
            child: Text(
              'Meu catálogo',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<CatalogBeerBloc, CatalogBeerState>(
              builder: (context, state) {
                if (state is CatalogBeerLoadingState) {
                  return Container(
                    padding: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10)),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is CatalogBeerDataState) {
                  return BeerList(state.beers);
                } else {
                  return Container(
                    padding: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10)),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Houve um erro ao buscar as cervejas',
                            style: TextStyle(fontSize: 18),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            child: Icon(
                              Icons.error,
                              color: Colors.red.shade700,
                              size: 24,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
