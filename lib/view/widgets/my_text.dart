import 'package:flutter/material.dart';

class MyText extends StatelessWidget {

  String text;
  Color color;
  double? size;
  FontWeight? fontWeight;

  MyText({required this.text,required this.color, this.size,this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: TextStyle(
        fontSize: size ?? 30,
        color: color,
        fontWeight:fontWeight ?? FontWeight.w400 ,
        fontFamily: 'Poppins',
      ),
      textAlign: TextAlign.center,
    );
  }
}
