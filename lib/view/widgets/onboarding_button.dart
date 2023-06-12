// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:webullish/utils/app_colors.dart';
import 'package:webullish/view/widgets/my_text.dart';


class OnBoardingButton extends StatelessWidget {
  String text;
  double size;
  Function() onPressed;
  FontWeight? fontWeight;
  Color color;
  OnBoardingButton(
      {required this.text, required this.onPressed, required this.size,this.fontWeight,required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.ancientColor,
          minimumSize: Size(double.infinity, 51),
        ),
        onPressed: onPressed,
        child: MyText(
         text: text,
          size: size,
          fontWeight:fontWeight,
          color: color,
        ));
  }
}
