/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Beer type in your schema. */
@immutable
class Beer extends Model {
  static const classType = const _BeerModelType();
  final String id;
  final String? _name;
  final String? _type;
  final int? _ibu;
  final double? _abv;
  final int? _score;
  final bool? _isFavorite;
  final String? _imgSrc;
  final String? _brand;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get name {
    return _name;
  }
  
  String? get type {
    return _type;
  }
  
  int? get ibu {
    return _ibu;
  }
  
  double? get abv {
    return _abv;
  }
  
  int? get score {
    return _score;
  }
  
  bool? get isFavorite {
    return _isFavorite;
  }
  
  String? get imgSrc {
    return _imgSrc;
  }
  
  String? get brand {
    return _brand;
  }
  
  const Beer._internal({required this.id, name, type, ibu, abv, score, isFavorite, imgSrc, brand}): _name = name, _type = type, _ibu = ibu, _abv = abv, _score = score, _isFavorite = isFavorite, _imgSrc = imgSrc, _brand = brand;
  
  factory Beer({String? id, String? name, String? type, int? ibu, double? abv, int? score, bool? isFavorite, String? imgSrc, String? brand}) {
    return Beer._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      type: type,
      ibu: ibu,
      abv: abv,
      score: score,
      isFavorite: isFavorite,
      imgSrc: imgSrc,
      brand: brand);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Beer &&
      id == other.id &&
      _name == other._name &&
      _type == other._type &&
      _ibu == other._ibu &&
      _abv == other._abv &&
      _score == other._score &&
      _isFavorite == other._isFavorite &&
      _imgSrc == other._imgSrc &&
      _brand == other._brand;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Beer {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("type=" + "$_type" + ", ");
    buffer.write("ibu=" + (_ibu != null ? _ibu!.toString() : "null") + ", ");
    buffer.write("abv=" + (_abv != null ? _abv!.toString() : "null") + ", ");
    buffer.write("score=" + (_score != null ? _score!.toString() : "null") + ", ");
    buffer.write("isFavorite=" + (_isFavorite != null ? _isFavorite!.toString() : "null") + ", ");
    buffer.write("imgSrc=" + "$_imgSrc" + ", ");
    buffer.write("brand=" + "$_brand");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Beer copyWith({String? id, String? name, String? type, int? ibu, double? abv, int? score, bool? isFavorite, String? imgSrc, String? brand}) {
    return Beer(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      ibu: ibu ?? this.ibu,
      abv: abv ?? this.abv,
      score: score ?? this.score,
      isFavorite: isFavorite ?? this.isFavorite,
      imgSrc: imgSrc ?? this.imgSrc,
      brand: brand ?? this.brand);
  }
  
  Beer.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _type = json['type'],
      _ibu = json['ibu'],
      _abv = json['abv'],
      _score = json['score'],
      _isFavorite = json['isFavorite'],
      _imgSrc = json['imgSrc'],
      _brand = json['brand'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'type': _type, 'ibu': _ibu, 'abv': _abv, 'score': _score, 'isFavorite': _isFavorite, 'imgSrc': _imgSrc, 'brand': _brand
  };

  static final QueryField ID = QueryField(fieldName: "beer.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField TYPE = QueryField(fieldName: "type");
  static final QueryField IBU = QueryField(fieldName: "ibu");
  static final QueryField ABV = QueryField(fieldName: "abv");
  static final QueryField SCORE = QueryField(fieldName: "score");
  static final QueryField ISFAVORITE = QueryField(fieldName: "isFavorite");
  static final QueryField IMGSRC = QueryField(fieldName: "imgSrc");
  static final QueryField BRAND = QueryField(fieldName: "brand");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Beer";
    modelSchemaDefinition.pluralName = "Beers";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Beer.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Beer.TYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Beer.IBU,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Beer.ABV,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Beer.SCORE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Beer.ISFAVORITE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Beer.IMGSRC,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Beer.BRAND,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _BeerModelType extends ModelType<Beer> {
  const _BeerModelType();
  
  @override
  Beer fromJson(Map<String, dynamic> jsonData) {
    return Beer.fromJson(jsonData);
  }
}