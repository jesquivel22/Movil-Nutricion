import 'package:aplicacion_movil/screens/screens.dart';
import 'package:aplicacion_movil/theme/app_theme.dart';

class CustomBottonMenu extends StatelessWidget {
  final IconData icono;
  final String herotag;
  final String router;

  const CustomBottonMenu({
    Key? key,
    required this.icono,
    required this.herotag,
    required this.router,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    Size size = mediaquery.size;
    return SizedBox(
      width: size.width * 0.43,
      child: FittedBox(
        child: FloatingActionButton(
            heroTag: herotag,
            backgroundColor: AppTheme.primary,
            child: Icon(icono),
            onPressed: () {
              Navigator.pushNamed(context, "$router");
            }),
      ),
    );
  }
}
