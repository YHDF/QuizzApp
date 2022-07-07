import 'package:flutter/material.dart';
class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(size.width * 0.85 , size.height * 0.4, size.width/1.75, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.05, size.height, 0, size.height * 0.5);
    path.lineTo(0, size.height);
    //path.moveTo(0, 300);
    /*path.quadraticBezierTo(size.width / 4, size.height / 3.66, size.width / 1.71, size.height / 2.44);
    path.quadraticBezierTo(size.width * 0.75, size.height / 1.464, size.width, size.height / 3.66);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);*/
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}