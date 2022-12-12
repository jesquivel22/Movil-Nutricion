import 'dart:convert';
import 'package:aplicacion_movil/providers/usuario_provider.dart';
import 'package:aplicacion_movil/share_preferences/preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:aplicacion_movil/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

final local = "http://192.168.246.223:3000/";

Future<http.Response> getData(int id) async {
  List perfilData = [];
  Map<String, dynamic>? data;
  final url = Uri.parse(local + 'api/perfil/M/${id}');
  final response = await http.get(url);
  data = json.decode(response.body);
  print(data);
  perfilData = data!['result'];
  print("EN SETSTATE");
  Preferences.nombre = perfilData[0]['nombres'];
  Preferences.a_pat = perfilData[0]['ape_pat'];
  Preferences.a_mat = perfilData[0]['ape_mat'];
  Preferences.codigo = perfilData[0]['codigo'].toString();
  Preferences.ciclo = perfilData[0]['ciclo'];
  Preferences.url = perfilData[0]['url'];
  Preferences.correo = perfilData[0]['correo'];
  Preferences.telefono = perfilData[0]['telefono'];
  Preferences.idpersona = perfilData[0]['idpersona'];

  return response;
}
