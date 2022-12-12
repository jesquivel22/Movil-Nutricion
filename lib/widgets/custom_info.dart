import 'package:aplicacion_movil/theme/app_theme.dart';
import 'package:flutter/material.dart';

class info extends StatelessWidget {
  const info({
    Key? key,
    required this.name,
    required this.email,
    required this.image,
  }) : super(key: key);

  final String name, email, image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: 200,
              color: AppTheme.primary,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(image))),
                ),
                const SizedBox(height: 15),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 5),
                Text(email,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF8492A2),
                      fontSize: 15,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }
}
