import 'dart:convert';
import '../../../domain/entities/crop_entities/crop_entity.dart';

class CropModel extends CropEntity {
  const CropModel({
    required super.id,
    required super.name,
    required super.description,
    required super.active,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'active': active,
      };

  factory CropModel.fromMap(Map<String, dynamic> map) => CropModel(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        active: map['active'],
      );

  String toJson() => json.encode(toMap());

  factory CropModel.fromJson(String source) =>
      CropModel.fromMap(json.decode(source));

}