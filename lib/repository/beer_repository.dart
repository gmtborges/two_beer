import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:two_beer/models/Beer.dart';

class BeerRepository {
  final AmplifyDataStore _dataStore;

  BeerRepository(this._dataStore);

  Future<List<Beer>> fetchBeers() {
    return this._dataStore.query(Beer.classType);
  }
}
