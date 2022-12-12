// To parse this JSON data, do
//
//     final documentResponse = documentResponseFromMap(jsonString);

import 'dart:convert';

class DocumentResponse {
  DocumentResponse({
    required this.id,
    required this.nombre,
    required this.url,
  });

  int id;
  String nombre;
  String url;

  factory DocumentResponse.fromJson(String str) =>
      DocumentResponse.fromMap(json.decode(str));


  factory DocumentResponse.fromMap(Map<String, dynamic> json) =>
      DocumentResponse(
        id: json["id"],
        nombre: json["nombre"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "url": url,
      };
}
