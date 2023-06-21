import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../my_text.dart';

class AnalyticsContainer extends StatelessWidget {
   String image;
   String title;
   String description;


   AnalyticsContainer({super.key, required this.image,required this.title,required this.description});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 250,
      decoration: const BoxDecoration(
        color: Colors.transparent,
          // borderRadius: BorderRadius.all(
          //   Radius.circular(14),
          // ),
          // boxShadow: [
          //   BoxShadow(
          //     color:Colors.transparent,
          //     offset: Offset(2, 2),
          //     blurRadius: 2,
          //   ),
          // ]
      ),
      // width: MediaQuery.of(context).size.width * 0.44,
      // width: 168,
      child: Card(
        color: Colors.transparent,
        elevation: 0.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(9)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(9), topLeft: Radius.circular(9)),
              child: Image.network(
                image,
                // fit: BoxFit.cover,
                // width: MediaQuery.of(context).size.width * 1.4,
                // height: MediaQuery.of(context).size.height * 1 ,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.brownColor,
                borderRadius: const BorderRadius.only(
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
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w700,
                    size: 16,
                  ),
                  MyText(
                    text:  description,
                    color: AppColors.whiteColor,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w400,
                    size: 17,
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
