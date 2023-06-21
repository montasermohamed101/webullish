// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';


class Webullish_PRO extends StatelessWidget {
  const Webullish_PRO({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.close,
                  size: 20,
                  color: AppColors.ancientColor,
                ),
                Text(
                  'Webullish PRO',
                  style: TextStyle(
                      color: AppColors.ancientColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox()
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 34, left: 34),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Supercharge Your Stock',
                            style: TextStyle(
                                color: AppColors.ancientColor,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'With more techy bells n’ webullish\nthan our free version.',
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 22,
                                fontFamily: 'Poppins'),
                          ),
                          SizedBox(
                            height: 45,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Webullish\n    FREE',
                                        style: TextStyle(
                                            color: AppColors.ancientColor,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 24,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Webullish\n    PRO',
                                        style: TextStyle(
                                            color: AppColors.ancientColor,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 36,
                          ),
                          Big_Row(
                            text: 'Well Researched Alerts',
                            radius: 3,
                            color: AppColors.whiteColor,
                            icon: Icons.close,
                            icoon: Icons.done,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Big_Row(
                            text: 'Simple Format',
                            radius: 3,
                            color: AppColors.whiteColor,
                            icon: Icons.close,
                            icoon: Icons.done,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Big_Row(
                            text: 'Spot-On Stock Alerts',
                            radius: 3,
                            color: AppColors.whiteColor,
                            icon: Icons.close,
                            icoon: Icons.done,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Big_Row(
                            text: 'Accessible Analytics',
                            radius: 3,
                            color: AppColors.whiteColor,
                            icon: Icons.close,
                            icoon: Icons.done,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Big_Row(
                            text: 'Weekly Magazine',
                            radius: 3,
                            color: AppColors.whiteColor,
                            icon: Icons.close,
                            icoon: Icons.done,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Big_Row(
                            text: 'Educational videos',
                            radius: 3,
                            color: AppColors.whiteColor,
                            icon: Icons.close,
                            icoon: Icons.done,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Big_Row(
                            text: 'No Contracts',
                            radius: 3,
                            color: AppColors.whiteColor,
                            icon: Icons.done,
                            icoon: Icons.done,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Big_Row(
                            text: 'No Commitments',
                            radius: 3,
                            color: AppColors.whiteColor,
                            icon: Icons.done,
                            icoon: Icons.done,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Big_Row(
                            text: 'Cancel Anytime',
                            radius: 3,
                            color: AppColors.whiteColor,
                            icon: Icons.done,
                            icoon: Icons.done,
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          Text(
                            'Webullish Pro subscription for 19.99\$/month automatically\ncharged after trial ends. you can cancel anytime',
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 13,
                                fontFamily: 'Poppins'),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width / 3,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  color: AppColors.ancientColor),
                              child: Center(
                                  child: Text(
                                'Try For Free',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.whiteColor,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          )
                        ],
                      ),
                    )
                  ])))
        ]));
  }
}

// Well Researched Alerts

// Simple Format

// Spot-On Stock Alerts

// Accessible Analytics

// Weekly Magazine

// Educational videos

// No Contracts

// No Commitments

// Cancel Anytime

class Big_Row extends StatelessWidget {
  String? text;
  double? radius;
  Color? color;
  IconData? icon;
  IconData? icoon;
  Big_Row(
      {super.key, this.color, this.radius, this.text, this.icon, this.icoon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: radius,
                  backgroundColor: color,
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  text!,
                  style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                icon,
                color: AppColors.ancientColor,
              ),
              SizedBox(
                width: 50,
              ),
              Icon(
                icoon,
                color: AppColors.ancientColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
