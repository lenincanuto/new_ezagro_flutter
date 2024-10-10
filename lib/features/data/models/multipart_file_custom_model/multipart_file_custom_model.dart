import 'dart:convert';
import '../../../domain/entities/multipart_file_custom_entities/multipart_file_custom_entity.dart';

class MultipartFileCustomModel extends MultipartFileCustomEntity {
  const MultipartFileCustomModel({
    required super.name,
    required super.originalFilename,
    required super.contentType,
    required super.size,
    required super.content,
  });

  String toJson() => json.encode(toMap());

  factory MultipartFileCustomModel.fromJson(String source) =>
      MultipartFileCustomModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() => {
        'name': name,
        'originalFilename': originalFilename,
        'contentType': contentType,
        'size': size,
        'content': content,
      };

  factory MultipartFileCustomModel.fromMap(Map<String, dynamic> map) =>
      MultipartFileCustomModel(
        name: map['name'],
        originalFilename: map['originalFilename'],
        contentType: map['contentType'],
        size: map['size'],
        content: List<String>.from(map['content']),
      );
}