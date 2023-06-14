// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';


class Container_Performance extends StatelessWidget {
  String text;
  Color? color;
  Color? colortext;
  Container_Performance(
      {super.key, required this.text, this.color, this.colortext});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 105,
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: colortext, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
