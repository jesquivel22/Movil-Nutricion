import 'package:aplicacion_movil/providers/usuario_provider.dart';
import 'package:aplicacion_movil/share_preferences/preferences.dart';
import 'package:aplicacion_movil/widgets/custom_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBody extends StatelessWidget {
  const CustomBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UsuarioProvider>(context);
    // double defaultSize = SizeConfig.defaultSize;
    return Column(
      children: <Widget>[
        info(
          name: userInfo.nombres + ' ' + userInfo.a_pat + ' ' + userInfo.a_mat,
          email: userInfo.correo,
          image: userInfo.url,
        ),
        const SizedBox(
          height: 30,
        ),
        const ProfileMenuItem(
          icono: Icons.settings,
          router: "/configuracion",
          title: "Configuración",
        ),
        const ProfileMenuItem(
          icono: Icons.report,
          router: "/report",
          title: "Reportar algún problema",
        ),
        const ProfileMenuItem(
          icono: Icons.color_lens_rounded,
          router: "/tema",
          title: "Temas",
        ),
        const ProfileMenuItem(
          icono: Icons.legend_toggle_sharp,
          router: "/licencias",
          title: "licencias",
        ),
        InkWell(
          onTap: () async {
            Navigator.pushReplacementNamed(context, "/login");
            Preferences.logeado = false;
            Preferences.ciclo = 0;
            Preferences.codigo = '';
            Preferences.id_usuario = 0;
            Preferences.nombre = '';
            Preferences.url = '';
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.logout,
                  size: 20,
                  color: Colors.grey[600],
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  "Salir de la cuenta",
                  style: TextStyle(fontSize: 17, color: Colors.grey[600]),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.grey[600],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    Key? key,
    required this.icono,
    required this.title,
    required this.router,
  }) : super(key: key);
  final IconData icono;
  final String title;
  final String router;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "$router");
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
        child: Row(
          children: <Widget>[
            Icon(
              icono,
              size: 20,
              color: Colors.grey[600],
            ),
            SizedBox(
              width: 40,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 17, color: Colors.grey[600]),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.grey[600],
            )
          ],
        ),
      ),
    );
  }
}
