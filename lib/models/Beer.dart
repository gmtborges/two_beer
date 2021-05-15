/*
* Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
  final String name;
  final double abv;
  final int ibu;
  final String description;
  final int score;
  final bool isFavorite;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Beer._internal(
      {@required this.id,
      this.name,
      this.abv,
      this.ibu,
      this.description,
      this.score,
      this.isFavorite});

  factory Beer(
      {String id,
      String name,
      double abv,
      int ibu,
      String description,
      int score,
      bool isFavorite}) {
    return Beer._internal(
        id: id == null ? UUID.getUUID() : id,
        name: name,
        abv: abv,
        ibu: ibu,
        description: description,
        score: score,
        isFavorite: isFavorite);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Beer &&
        id == other.id &&
        name == other.name &&
        abv == other.abv &&
        ibu == other.ibu &&
        description == other.description &&
        score == other.score &&
        isFavorite == other.isFavorite;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Beer {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$name" + ", ");
    buffer.write("abv=" + (abv != null ? abv.toString() : "null") + ", ");
    buffer.write("ibu=" + (ibu != null ? ibu.toString() : "null") + ", ");
    buffer.write("description=" + "$description" + ", ");
    buffer.write("score=" + (score != null ? score.toString() : "null") + ", ");
    buffer.write(
        "isFavorite=" + (isFavorite != null ? isFavorite.toString() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Beer copyWith(
      {String id,
      String name,
      double abv,
      int ibu,
      String description,
      int score,
      bool isFavorite}) {
    return Beer(
        id: id ?? this.id,
        name: name ?? this.name,
        abv: abv ?? this.abv,
        ibu: ibu ?? this.ibu,
        description: description ?? this.description,
        score: score ?? this.score,
        isFavorite: isFavorite ?? this.isFavorite);
  }

  Beer.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        abv = json['abv'],
        ibu = json['ibu'],
        description = json['description'],
        score = json['score'],
        isFavorite = json['isFavorite'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'abv': abv,
        'ibu': ibu,
        'description': description,
        'score': score,
        'isFavorite': isFavorite
      };

  static final QueryField ID = QueryField(fieldName: "beer.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField ABV = QueryField(fieldName: "abv");
  static final QueryField IBU = QueryField(fieldName: "ibu");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField SCORE = QueryField(fieldName: "score");
  static final QueryField ISFAVORITE = QueryField(fieldName: "isFavorite");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Beer";
    modelSchemaDefinition.pluralName = "Beers";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
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
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Beer.ABV,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Beer.IBU,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Beer.DESCRIPTION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Beer.SCORE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Beer.ISFAVORITE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));
  });
}

class _BeerModelType extends ModelType<Beer> {
  const _BeerModelType();

  @override
  Beer fromJson(Map<String, dynamic> jsonData) {
    return Beer.fromJson(jsonData);
  }
}
