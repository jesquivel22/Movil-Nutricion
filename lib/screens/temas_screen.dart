import 'package:aplicacion_movil/providers/theme_provider.dart';
import 'package:aplicacion_movil/share_preferences/preferences.dart';
import 'package:aplicacion_movil/widgets/widgets.dart';
import 'package:provider/provider.dart';

class TemaScreen extends StatefulWidget {
  static const String routerName = 'Settings';

  const TemaScreen({Key? key}) : super(key: key);

  @override
  State<TemaScreen> createState() => _TemaScreenState();
}

class _TemaScreenState extends State<TemaScreen> {
  // bool isDarkmode = false;
  // int gender = 1;
  // String name = 'Pedro';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Temas'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Cambiar Tema',
                    style:
                        TextStyle(fontSize: 45, fontWeight: FontWeight.w300)),
                const Divider(),
                SwitchListTile.adaptive(
                    value: Preferences.isDarkmode,
                    title: Row(
                      children: [
                        Icon(Icons.dark_mode_outlined),
                        SizedBox(
                          width: 20,
                        ),
                        Text('Darkmode'),
                      ],
                    ),
                    onChanged: (value) {
                      Preferences.isDarkmode = value;
                      final themeProvider =
                          Provider.of<ThemeProvider>(context, listen: false);

                      value
                          ? themeProvider.setDarkmode()
                          : themeProvider.setLightMode();

                      setState(() {});
                    }),
              ],
            ),
          ),
        ));
  }
}
