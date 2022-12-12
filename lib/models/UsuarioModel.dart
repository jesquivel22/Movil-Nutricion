import 'dart:convert';

class UsuarioModel {
  UsuarioModel({
    this.id,
    required this.nombres,
    required this.ape_pat,
    required this.ape_mat,
    required this.telefono,
    required this.correo,
    this.url,
  });

  int? id;
  String nombres;
  String ape_pat;
  String ape_mat;
  String telefono;
  String correo;
  String? url;

  factory UsuarioModel.fromJson(String str) =>
      UsuarioModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromMap(Map<String, dynamic> json) => UsuarioModel(
        id: json["id"],
        nombres: json["nombres"],
        ape_pat: json["ape_pat"],
        ape_mat: json["ape_mat"],
        telefono: json["telefono"],
        correo: json["correo"],
        url: json["url"],
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombres,
        "ape_pat": ape_pat,
        "ape_mat": ape_mat,
        "telefono": telefono,
        "correo": correo,
        "url": url,
      };
}
