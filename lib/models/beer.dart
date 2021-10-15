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

  Beer.fromJson(Map<String, dynamic> json)
      : this(
          name: json['name']! as String,
          brand: json['brand']! as String,
          createdAt: json['createdAt']! as Timestamp,
          type: json['type']! as String,
          ibu: json['ibu']! as int,
          abv: double.parse(json['abv'].toString()),
          score: json['score']! as int,
          imgSrc: json['imgSrc']! as String,
          isFavorite: json['isFavorite']! as bool,
          obs: json['obs']! as String,
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
