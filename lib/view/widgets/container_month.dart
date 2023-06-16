// ignore_for_file: camel_case_types, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';


class Container_Month extends StatelessWidget {
  String text;
  String textt;
  String texttt;
  Color color;
  Container_Month(
      {super.key,
      required this.text,
      required this.textt,
      required this.texttt,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      height: 275,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.ancientColor),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: AppColors.backPerformanceColor),
      child: Padding(
        padding: const EdgeInsets.only(left: 17, right: 17,),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            Text(
              text,
              style: TextStyle(
                  color: color, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              textt,
              style: TextStyle(
                  color: color, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              texttt,
              style: TextStyle(
                color: color,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 75, left: 75),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                    color: AppColors.ancientColor),
                child: Center(
                    child: Text(
                  'SEE RESULTS',
                  style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
