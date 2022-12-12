import 'package:aplicacion_movil/screens/screens.dart';

class UsuarioProvider with ChangeNotifier {
  int _id_usuario = 0;
  String _nombres = "";
  String _a_pat = "";
  String _a_mat = "";
  String _url = "";
  String _codigo = "";
  int _ciclo = 0;
  String _telefono = "";
  String _correo = "";
  int _idpersona = 0;
  int _h_comunitarias = 0;
  int _h_clinicas = 0;

  int get id_usuario => _id_usuario;
  set id_usuario(int id_usuario) {
    this._id_usuario = id_usuario;
    notifyListeners();
  }

  String get nombres => _nombres;
  set nombres(String nombres) {
    this._nombres = nombres;
    notifyListeners();
  }

  String get a_pat => _a_pat;
  set a_pat(String a_pat) {
    this._a_pat = a_pat;
    notifyListeners();
  }

  String get a_mat => _a_mat;
  set a_mat(String a_mat) {
    this._a_mat = a_mat;
    notifyListeners();
  }

  String get url => _url;
  set url(String url) {
    this._url = url;
    notifyListeners();
  }

  String get codigo => _codigo;
  set codigo(String codigo) {
    this._codigo = codigo;
    notifyListeners();
  }

  int get ciclo => _ciclo;
  set ciclo(int ciclo) {
    this._ciclo = ciclo;
    notifyListeners();
  }

  String get telefono => _telefono;
  set telefono(String telefono) {
    this._telefono = telefono;
    notifyListeners();
  }

  String get correo => _correo;
  set correo(String correo) {
    this._correo = correo;
    notifyListeners();
  }

  int get idpersona => _idpersona;
  set idpersona(int idpersona) {
    this._idpersona = idpersona;
    notifyListeners();
  }

  int get h_comunitarias => _h_comunitarias;
  set h_comunitarias(int h_comunitarias) {
    this._h_comunitarias = h_comunitarias;
    notifyListeners();
  }

  int get h_clinicas => _h_clinicas;
  set h_clinicas(int h_clinicas) {
    this._h_clinicas = h_clinicas;
    notifyListeners();
  }
}
