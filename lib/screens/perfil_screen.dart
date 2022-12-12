import 'package:aplicacion_movil/theme/app_theme.dart';
import 'package:aplicacion_movil/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: CustomBody(),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      backgroundColor: AppTheme.primary,
      // leading: SizedBox(),
      centerTitle: true,
      title: Text("Perfil"),
      actions: <Widget>[
        FloatingActionButton.small(
            backgroundColor: AppTheme.primary,
            onPressed: () {
              Navigator.pushNamed(context, '/edit_perfil');
            },
            child: Icon(Icons.edit)
            // Text(
            //   "Editar",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 12,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            )
      ],
    );
  }
}
