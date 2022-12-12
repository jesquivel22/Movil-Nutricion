import 'dart:convert';
import 'package:aplicacion_movil/providers/usuario_provider.dart';
import 'package:aplicacion_movil/share_preferences/preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:aplicacion_movil/conexion.dart';
import 'package:aplicacion_movil/providers/login_form_provider.dart';
import 'package:aplicacion_movil/theme/app_theme.dart';
import 'package:aplicacion_movil/ui/input_decorations.dart';
import 'package:aplicacion_movil/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class User {
  String username = "";
  String password = "";
}

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 250),
          CardContainer(
              child: Column(
            children: [
              SizedBox(height: 10),
              Text('Login', style: Theme.of(context).textTheme.headline4),
              SizedBox(height: 30),
              ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(), child: _LoginForm())
            ],
          )),
          SizedBox(height: 50),
          Text(
            'Crear una nueva cuenta',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 50),
        ],
      ),
    )));
  }
}

class _LoginForm extends StatefulWidget {
  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  var usuario = new User();

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UsuarioProvider>(context);

    return Container(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'username',
                  labelText: 'Usuario',
                  prefixIcon: Icons.supervised_user_circle_rounded),
              onChanged: (value) => usuario.username = value,
              // validator: (value) {
              //   String pattern =
              //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              //   RegExp regExp = new RegExp(pattern);

              //   return regExp.hasMatch(value ?? '')
              //       ? null
              //       : 'El valor ingresado no luce como un correo';
              // },
            ),
            const SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '*****',
                  labelText: 'Contraseña',
                  prefixIcon: Icons.lock_outline),
              onChanged: (value) => value != null
                  ? usuario.password = value
                  : usuario.password = "hola",
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'La contraseña debe de ser de 6 caracteres';
              },
            ),
            SizedBox(height: 30),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: AppTheme.primary,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    child: Text(
                      'Ingresar',
                      style: TextStyle(color: Colors.white),
                    )),
                onPressed: () {
                  loginPost() async {
                    List perfilData = [];
                    Map<String, dynamic>? data;
                    String yourToken = "";
                    var userData = {};
                    final response = await http.post(
                      Uri.parse(local + 'api/auth/'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        'user': usuario.username,
                        'password': usuario.password,
                      }),
                    );
                    if (response.statusCode == 200) {
                      print('Exito al conectarte!');
                      data = json.decode(response.body);
                      yourToken = data!["accessToken"];
                      Map<String, dynamic> decodedToken =
                          JwtDecoder.decode(yourToken);
                      userData = decodedToken["user"];
                      Preferences.id_usuario = userData['idusuario'];
                      Preferences.logeado = true;
                      getData(Preferences.id_usuario).then((value) =>
                          Navigator.pushReplacementNamed(context, '/'));
                    } else {
                      print('A network error occurred');
                    }
                    return response;
                  }

                  loginPost();
                })
          ],
        ),
      ),
    );
  }
}
