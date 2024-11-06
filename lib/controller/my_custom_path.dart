import 'package:flutter/material.dart';


 class MyCustomPath extends CustomClipper<Path>{
   @override
   Path getClip(Size size) {

     final path = Path();
     path.lineTo(0, size.height *0.5);
     path.cubicTo(size.width *0.33, size.height * 0.4, size.width * 0.66, size.height * 0.65, size.width , size.height *0.4);
     path.lineTo(size.width, 0);
     path.close();
     return path;
   }





   @override
   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {

     return false;
   }
   


}