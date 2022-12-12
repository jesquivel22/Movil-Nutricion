import 'dart:ui';

import 'package:aplicacion_movil/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  String avatar;
  String name;
  String codigo;
  String ciclo;

  CustomAvatar(
      {Key? key,
      required this.name,
      required this.codigo,
      required this.avatar,
      required this.ciclo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    Size size = mediaquery.size;
    return Container(
      height: size.width * 0.60,
      color: AppTheme.primary,
      child: Container(
        margin: EdgeInsets.only(top: size.height * 0.01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: size.width * 0.40,
              width: size.width * 0.40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 4,
                  ),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(avatar),
                  )),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              width: size.width * 0.50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    codigo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    ciclo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
