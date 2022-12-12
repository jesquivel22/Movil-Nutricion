import 'package:aplicacion_movil/conexion.dart';
import 'package:aplicacion_movil/providers/usuario_provider.dart';
import 'package:aplicacion_movil/share_preferences/preferences.dart';
import 'package:aplicacion_movil/theme/app_theme.dart';
import 'package:aplicacion_movil/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    _ini();
    super.initState();
  }

  _ini() async {
    final userInfo = await Provider.of<UsuarioProvider>(context, listen: false);
    userInfo.id_usuario = Preferences.id_usuario;
    userInfo.nombres = Preferences.nombre;
    userInfo.a_pat = Preferences.a_pat;
    userInfo.a_mat = Preferences.a_mat;
    userInfo.url = Preferences.url;
    userInfo.codigo = Preferences.codigo;
    userInfo.ciclo = Preferences.ciclo;
    userInfo.correo = Preferences.correo;
    userInfo.telefono = Preferences.telefono;
    userInfo.idpersona = Preferences.idpersona;
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UsuarioProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          CustomAvatar(
            avatar: userInfo.url,
            name:
                userInfo.nombres + ' ' + userInfo.a_pat + ' ' + userInfo.a_mat,
            codigo: userInfo.codigo,
            ciclo: "${userInfo.ciclo} ciclo",
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CustomBottonMenu(
                        icono: Icons.edit_note,
                        herotag: "btn1",
                        router: "/perfil"),
                    SizedBox(
                      width: 15,
                    ),
                    CustomBottonMenu(
                        icono: Icons.work_history_outlined,
                        herotag: "btn2",
                        router: "/reportes"),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CustomBottonMenu(
                        icono: Icons.description_rounded,
                        herotag: "btn3",
                        router: "/doc"),
                    SizedBox(
                      width: 15,
                    ),
                    CustomBottonMenu(
                        icono: Icons.newspaper,
                        herotag: "btn4",
                        router: "/reportes"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
