import 'package:aplicacion_movil/firebase_options.dart';
import 'package:aplicacion_movil/providers/theme_provider.dart';
import 'package:aplicacion_movil/providers/usuario_provider.dart';
import 'package:aplicacion_movil/screens/configuracion_screen.dart';
import 'package:aplicacion_movil/screens/login_screen.dart';
import 'package:aplicacion_movil/screens/report_screen.dart';
import 'package:aplicacion_movil/screens/screens.dart';
import 'package:aplicacion_movil/share_preferences/preferences.dart';
import 'package:aplicacion_movil/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Preferences.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode)),
      ChangeNotifierProvider<UsuarioProvider>(create: (_) => UsuarioProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: Preferences.logeado ? '/' : '/login',
      routes: {
        '/': (_) => MenuScreen(),
        '/perfil': (_) => const PerfilScreen(),
        '/doc': (_) => DocScreen(),
        '/reportes': (_) => const ReportesScreen(),
        '/login': (_) => LoginScreen(),
        '/edit_perfil': (_) => EditPerfilScreen(),
        '/configuracion': (_) => ConfiguracionScreen(),
        '/report': (_) => ReportScreen(),
        '/tema': (_) => TemaScreen(),
        '/licencias': (_) => LicenciasScreen(),
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
