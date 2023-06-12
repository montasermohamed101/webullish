// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/container_month.dart';


class Webullish_Performance extends StatelessWidget {
  const Webullish_Performance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
          child: Padding(
              padding: const EdgeInsets.only(left: 45, right: 45),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 63),
                      child: Center(
                        child: Text(
                          'Webullish Performance',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.ancientColor),
                        ),
                      ),
                    ),
                    Expanded(
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView(
                          children: [
                            SizedBox(
                              height: 41,
                            ),
                            Text(
                              'Monthly Performance',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.ancientColor),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Text(
                              'We have made it easier than ever to\naccess our many invaluable reports!\ncheck them all out here, broken down into monthly categories.',
                              style: TextStyle(
                                  fontSize: 17, color: AppColors.whiteColor),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Container_Month(
                              color: AppColors.ancientColor,
                              text: 'January',
                              textt: 'Performance Jan',
                              texttt:
                                  'Here you will find all of our\n  analyzes for this month',
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Container_Month(
                              color: AppColors.ancientColor,
                              text: 'February',
                              textt: 'Performance Feb',
                              texttt:
                                  'Here you will find all of our\n  analyzes for this month',
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Container_Month(
                              color: AppColors.ancientColor,
                              text: 'March',
                              textt: 'Performance Mar',
                              texttt:
                                  'Here you will find all of our\n  analyzes for this month',
                            )
                          ],
                        ),
                      ),
                    ),
                  ]))),
    );
  }
}
