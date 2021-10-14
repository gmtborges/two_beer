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
}