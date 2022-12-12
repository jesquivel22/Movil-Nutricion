import 'package:aplicacion_movil/screens/screens.dart';

class AppTheme {
  static const Color primary = Colors.blueAccent;

  static final ThemeData lightTheme = ThemeData.light().copyWith(

      //color primario
      primaryColor: Colors.indigo,
      //Appbar theme
      appBarTheme: AppBarTheme(color: primary, elevation: 0),
      textButtonTheme:
          TextButtonThemeData(style: TextButton.styleFrom(primary: primary)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primary,
        elevation: 5,
      ),
      //elevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: primary, shape: const StadiumBorder(), elevation: 0),
      ),
      //InputDecoration
      inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: primary),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primary),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primary),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10))),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10)))));

  static late final ThemeData darkTheme = ThemeData.dark().copyWith(
      //color primario
      primaryColor: Colors.deepOrange,
      //Appbar theme
      appBarTheme: AppBarTheme(color: primary, elevation: 0),
      scaffoldBackgroundColor: Colors.black,
      //floatingActionButtons
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primary,
        elevation: 5,
      ),
      //elevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: Colors.amber, shape: const StadiumBorder(), elevation: 0),
      ));
}
