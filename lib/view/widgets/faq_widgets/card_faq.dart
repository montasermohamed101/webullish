// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';


class Cart_Faq extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: AppColors.ancientColor,
      ),
      child: ExpansionTile(
          iconColor: Colors.white,
          collapsedIconColor: Colors.white,
          childrenPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          expandedCrossAxisAlignment: CrossAxisAlignment.end,
          title: Text(
            'What is Webullish.com',
            style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          children: [
            Text(
              'With more techy bells n’ webullish than our\nfree version.With more techy bells n’\nwebullish than our free version.',
              style: TextStyle(fontSize: 16, color: AppColors.whiteColor),
            ),
          ]),
    );
  }
}
