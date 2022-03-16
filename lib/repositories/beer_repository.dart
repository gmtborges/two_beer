import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:two_beer/models/beer.dart';

class BeerRepository {
  final FirebaseFirestore _firebaseFirestore;

  BeerRepository(this._firebaseFirestore);

  Stream<List<Beer>> fetchAllBeers() {
    return _firebaseFirestore.collection('beers').snapshots().map((snap) {
      return snap.docs.map((doc) => Beer.fromSnapshot(doc)).toList();
    });
  }
}
