import 'dart:convert';

import 'package:aplicacion_movil/conexion.dart';
import 'package:aplicacion_movil/models/UsuarioModel.dart';
import 'package:aplicacion_movil/providers/usuario_provider.dart';
import 'package:aplicacion_movil/theme/app_theme.dart';
import 'package:aplicacion_movil/ui/input_decorations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class EditPerfilScreen extends StatefulWidget {
  const EditPerfilScreen({Key? key}) : super(key: key);

  @override
  State<EditPerfilScreen> createState() => _EditPerfilScreenState();
}

class _EditPerfilScreenState extends State<EditPerfilScreen> {
  String nombres = '';
  String ape_pat = '';
  String ape_mat = '';
  String telefono = '';
  String correo = '';
  List<UsuarioModel> usuariomodel = [];

  Future<http.Response> actualizar(UsuarioModel usuario, int id) async {
    final url = Uri.parse(local + 'api/perfil/M/update/${id}');

    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nombres': usuario.nombres,
        'ape_pat': usuario.ape_pat,
        'ape_mat': usuario.ape_mat,
        'telefono': usuario.telefono,
        'correo': usuario.correo,
      }),
    );

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.body);
      print('A network error occurred');
    }

    this.usuariomodel.add(usuario);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UsuarioProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        title: Text("Perfil"),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(userInfo.url),
                            fit: BoxFit.cover)),
                  ),
                  // Positioned(
                  //   bottom: 0,
                  //   right: -15,
                  //   child: MaterialButton(
                  //     height: 40,
                  //     onPressed: () {},
                  //     child: Container(
                  //       height: 40,
                  //       width: 40,
                  //       decoration: BoxDecoration(
                  //           shape: BoxShape.circle,
                  //           border: Border.all(width: 4, color: Colors.white),
                  //           color: AppTheme.primary),
                  //       child: Icon(Icons.edit, color: Colors.white),
                  //     ),
                  //   ),
                  // )
                ]),
              ),
              SizedBox(
                height: 30,
              ),
              buildTextField(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext) {
    final userInfo = Provider.of<UsuarioProvider>(context);
    return Container(
      child: Form(
        child: Column(
          children: [
            TextFormField(
              initialValue: userInfo.nombres,
              cursorColor: AppTheme.primary,
              autocorrect: false,
              obscureText: false,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Nombres',
                labelText: 'Nombres',
                prefixIcon: Icons.person,
              ),
              onChanged: (value) {
                setState(() {
                  this.nombres = value;
                });
              },
              validator: (value) {
                return (value != null && value.length >= 1)
                    ? null
                    : 'Inserte un valor valido';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              initialValue: userInfo.a_pat,
              autocorrect: false,
              obscureText: false,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Apellido Paterno',
                  labelText: 'Apellido Paterno',
                  prefixIcon: Icons.person),
              onChanged: (value) {
                setState(() {
                  this.ape_pat = value;
                });
              },
              validator: (value) {
                return (value != null && value.length >= 1)
                    ? null
                    : 'Inserte un valor valido';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              initialValue: userInfo.a_mat,
              autocorrect: false,
              obscureText: false,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Apellido Materno',
                  labelText: 'Apellido Materno',
                  prefixIcon: Icons.person),
              onChanged: (value) {
                setState(() {
                  this.ape_mat = value;
                });
              },
              validator: (value) {
                return (value != null && value.length >= 1)
                    ? null
                    : 'Inserte un valor valido';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              initialValue: userInfo.telefono,
              autocorrect: false,
              obscureText: false,
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'telefono',
                  labelText: 'telefono',
                  prefixIcon: Icons.phone),
              onChanged: (value) {
                setState(() {
                  this.telefono = value;
                });
              },
              validator: (value) {
                return (value != null && value.length >= 1)
                    ? null
                    : 'Inserte un valor valido';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              initialValue: userInfo.correo,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'john.doe@gmail.com',
                  labelText: 'Correo electrónico',
                  prefixIcon: Icons.alternate_email_rounded),
              onChanged: (value) {
                setState(() {
                  this.correo = value;
                });
              },
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El valor ingresado no luce como un correo';
              },
            ),
            const SizedBox(height: 30),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Colors.red,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      child: Text(
                        'Cancelar',
                        style: TextStyle(color: Colors.white),
                      )),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: AppTheme.primary,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      child: Text(
                        'Actualizar',
                        style: TextStyle(color: Colors.white),
                      )),
                  onPressed: () async {
                    final usuarioObjeto = new UsuarioModel(
                        nombres: this.nombres,
                        ape_pat: this.ape_pat,
                        ape_mat: this.ape_mat,
                        telefono: this.telefono,
                        correo: this.correo);
                    final Enviar =
                        await actualizar(usuarioObjeto, userInfo.id_usuario);
                    userInfo.nombres = nombres;
                    userInfo.a_pat = ape_pat;
                    userInfo.a_mat = ape_mat;
                    userInfo.telefono = telefono;
                    userInfo.correo = correo;
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
