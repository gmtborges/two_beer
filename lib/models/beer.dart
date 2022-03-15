import 'package:cloud_firestore/cloud_firestore.dart';

class Beer {
  String name;
  String brand;
  Timestamp createdAt;
  String type;
  int ibu;
  double abv;
  int score;
  String imgSrc;
  bool isFavorite;
  String? obs;

  Beer({
    required this.name,
    required this.brand,
    required this.createdAt,
    required this.type,
    required this.ibu,
    required this.abv,
    required this.score,
    required this.imgSrc,
    required this.isFavorite,
    this.obs,
  });

  Beer.fromSnapshot(DocumentSnapshot doc)
      : this(
          name: doc['name']! as String,
          brand: doc['brand']! as String,
          createdAt: doc['createdAt']! as Timestamp,
          type: doc['type']! as String,
          ibu: doc['ibu']! as int,
          abv: double.parse(doc['abv'].toString()),
          score: doc['score']! as int,
          imgSrc: doc['imgSrc']! as String,
          isFavorite: doc['isFavorite']! as bool,
          obs: doc['obs'] != null ? doc['obs'] as String : '',
        );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'brand': brand,
      'createdAt': createdAt,
      'type': type,
      'ibu': ibu,
      'abv': abv,
      'score': score,
      'imgSrc': imgSrc,
      'isFavorite': isFavorite,
      'obs': obs
    };
  }
}
