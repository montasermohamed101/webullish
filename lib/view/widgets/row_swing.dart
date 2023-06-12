// ignore_for_file: prefer_const_constructors, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';


class Row_Swing extends StatelessWidget {
  String image;
  String text;
  String textt;
  String texttt;

  Row_Swing(
      {super.key,
      required this.image,
      required this.text,
      required this.textt,
      required this.texttt});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image.asset('assets/images/CDC alert.png'),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  textt,
                  style: TextStyle(
                    color: AppColors.grayColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          texttt,
          style: TextStyle(
              color: AppColors.yelloColor,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
