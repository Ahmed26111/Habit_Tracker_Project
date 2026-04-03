import 'package:flutter/cupertino.dart';

class CustomWaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
      path.moveTo(0, 70);
      path.quadraticBezierTo(
          size.width*0.35,
          -30,
          size.width*0.5,
          size.height*0.03,
      );
      path.quadraticBezierTo(
          size.width*0.7,
          60,
          size.width,
          0,
      );
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper)=> false;

}