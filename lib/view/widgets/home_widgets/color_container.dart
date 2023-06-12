import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../my_text.dart';

class ColorContainer extends StatelessWidget {

  String title;
  String description;
  Color color;

  ColorContainer({required this.title,required this.description,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 27),
      height: MediaQuery.of(context).size.height * .35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context,index) =>  Container(
          margin: EdgeInsets.all(10),
          width: 300,
          padding: EdgeInsets.symmetric(horizontal: 17,vertical: 24),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color: AppColors.ancientColor,
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(18)),
          ),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyText(
                text: title,
                color: AppColors.ancientColor,
                size: 17,
                fontWeight: FontWeight.w700,
              ),
              MyText(text: description,
                color: AppColors.ancientColor,
                size: 17,
                fontWeight: FontWeight.w400,
                // textAlign: TextAlign.end,
              ),
            ],
          ),
        ),),
    );
  }
}
