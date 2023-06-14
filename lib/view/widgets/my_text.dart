import 'package:flutter/material.dart';

class MyText extends StatelessWidget {

  String text;
  Color color;
  double? size;
  FontWeight? fontWeight;
  TextAlign? textAlign;
  int? maxLine;

  MyText({required this.text,required this.color, this.size,this.fontWeight,this.textAlign,this.maxLine});

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
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLine ?? null,
    );
  }
}
