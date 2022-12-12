import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static bool _isDarkmode = false;
  static int _id_usuario = 0;
  static String _nombre = "";
  static String _a_pat = "";
  static String _a_mat = "";
  static String _url = "";
  static String _codigo = "";
  static int _ciclo = 0;
  static bool _logeado = false;
  static String _telefono = "";
  static String _correo = "";
  static int _idpersona = 0;
  static int _h_comunitarias = 0;
  static int _h_clinicas = 0;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get isDarkmode {
    return _prefs.getBool('isDarkmode') ?? _isDarkmode;
  }

  static set isDarkmode(bool value) {
    _isDarkmode = value;
    _prefs.setBool('isDarkmode', value);
  }

  //nombre
  static String get nombre {
    return _prefs.getString('nombre') ?? _nombre;
  }

  static set nombre(String value) {
    _nombre = value;
    _prefs.setString('nombre', value);
  }

  //a_pat
  static String get a_pat {
    return _prefs.getString('a_pat') ?? _a_pat;
  }

  static set a_pat(String value) {
    _a_pat = value;
    _prefs.setString('a_pat', value);
  }

  //a_mat
  static String get a_mat {
    return _prefs.getString('a_mat') ?? a_mat;
  }

  static set a_mat(String value) {
    _a_mat = value;
    _prefs.setString('a_mat', value);
  }

  //url
  static String get url {
    return _prefs.getString('url') ?? _url;
  }

  static set url(String value) {
    _url = value;
    _prefs.setString('url', value);
  }

  //codigo
  static String get codigo {
    return _prefs.getString('codigo') ?? _codigo;
  }

  static set codigo(String value) {
    _codigo = value;
    _prefs.setString('codigo', value);
  }

  //ciclo
  static int get ciclo {
    return _prefs.getInt('ciclo') ?? _ciclo;
  }

  static set ciclo(int value) {
    _ciclo = value;
    _prefs.setInt('ciclo', value);
  }

  //id
  static int get id_usuario {
    return _prefs.getInt('id_usuario') ?? _id_usuario;
  }

  static set id_usuario(int value) {
    _id_usuario = value;
    _prefs.setInt('id_usuario', value);
  }

  //logueado
  static bool get logeado {
    return _prefs.getBool('logeado') ?? _logeado;
  }

  static set logeado(bool value) {
    _logeado = value;
    _prefs.setBool('logeado', value);
  }

  //telefono
  static String get telefono {
    return _prefs.getString('telefono') ?? _telefono;
  }

  static set telefono(String value) {
    _telefono = value;
    _prefs.setString('telefono', value);
  }

  //correo
  static String get correo {
    return _prefs.getString('correo') ?? _correo;
  }

  static set correo(String value) {
    _correo = value;
    _prefs.setString('correo', value);
  }

  //idpersona
  static int get idpersona {
    return _prefs.getInt('idpersona') ?? _idpersona;
  }

  static set idpersona(int value) {
    _idpersona = value;
    _prefs.setInt('idpersona', value);
  }

  //comuu
  static int get h_comunitarias {
    return _prefs.getInt('h_comunitarias') ?? _h_comunitarias;
  }

  static set h_comunitarias(int value) {
    _h_comunitarias = value;
    _prefs.setInt('h_comunitarias', value);
  }

  //clinicas
  static int get h_clinicas {
    return _prefs.getInt('h_clinicas') ?? _h_clinicas;
  }

  static set h_clinicas(int value) {
    _h_clinicas = value;
    _prefs.setInt('h_clinicas', value);
  }
}
