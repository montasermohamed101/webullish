import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../my_text.dart';

class TeamContainer extends StatelessWidget {
  String image;
  String title;
  String description;


  TeamContainer({required this.image,required this.title,required this.description});

  @override
  Widget build(BuildContext context) {
    return  Container(
      // width: 200,
      child: Card(
        color: Colors.transparent,
        elevation: 0.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(9)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(9), topLeft: Radius.circular(9)),
              child: Image.network(
                image,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 180,
              decoration: const BoxDecoration(
                color:Colors.transparent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(14),
                  bottomRight:   Radius.circular(14),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyText(
                    text:  title,
                    color: AppColors.ancientColor,
                    fontWeight: FontWeight.w700,
                    size: 16,
                    maxLine: 1,
                  ),
                  MyText(
                    text:  description,
                    color: AppColors.ancientColor,
                    fontWeight: FontWeight.w400,
                    size: 15,
                    maxLine: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
