// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/faq_widgets/card_faq.dart';

class FAQ extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 73, right: 28, left: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.whiteColor,
                  ),
                  Text(
                    'FAQ',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.ancientColor),
                  ),
                  SizedBox(),
                ],
              ),
              SizedBox(
                height: 33,
              ),
              Cart_Faq(),
              SizedBox(
                height: 22,
              ),
              Cart_Faq(),
            ],
          ),
        ));
  }
}
