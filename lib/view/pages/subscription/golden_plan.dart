
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class Golden_Plan extends StatelessWidget {

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
                'Get the golden plan',
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
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        Container(
                          height: 507,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.ancientColor),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: AppColors.primaryColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    'Pro Monthly ',
                                    style: TextStyle(
                                        color: AppColors.ancientColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '\$ 19.99',
                                    style: TextStyle(
                                        color: AppColors.ancientColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Text(
                                    'Swing Trading Alerts',
                                    style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 47,
                                ),
                                Text_Sub(text: 'Well Researched Stock Alerts'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text_Sub(
                                    text:
                                        'Simple Format For All Stock Traders'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text_Sub(
                                    text:
                                        '100+ Spot-On Stock Alerts Every Month'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text_Sub(
                                    text:
                                        'Accessible Analytics & Trackable Performance'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text_Sub(text: 'No Contracts.No Commitments'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text_Sub(text: 'Cancel Anytime'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Save 19% yearly ',
                                  style: TextStyle(
                                      color: AppColors.ancientColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 36,
                                ),
                                Center(
                                  child: Container(
                                    height: 51,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6)),
                                        color: AppColors.backPerformanceColor),
                                    child: Center(
                                      child: Text(
                                        'credit / debit card',
                                        style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Center(
                                  child: Container(
                                    height: 51,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6)),
                                        color: AppColors.ancientColor),
                                    child: Center(
                                      child: Text(
                                        'Pay with PayPal',
                                        style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 507,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.ancientColor),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: AppColors.primaryColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    'ANNUALLY',
                                    style: TextStyle(
                                        color: AppColors.ancientColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    '\$ 139.99',
                                    style: TextStyle(
                                        color: AppColors.ancientColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Text(
                                    'Save Huge By Making One\nSingle Annual Payment.',
                                    style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 47,
                                ),
                                Text_Sub(text: 'Well Researched Stock Alerts'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text_Sub(
                                    text:
                                        'Simple Format For All Stock Traders'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text_Sub(
                                    text:
                                        '100+ Spot-On Stock Alerts Every Month'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text_Sub(
                                    text:
                                        'Accessible Analytics & Trackable Performance'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text_Sub(text: 'No Contracts.No Commitments'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text_Sub(text: 'Cancel Anytime'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Save 19% yearly ',
                                  style: TextStyle(
                                      color: AppColors.ancientColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 36,
                                ),
                                Center(
                                  child: Container(
                                    height: 51,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6)),
                                        color: AppColors.backPerformanceColor),
                                    child: Center(
                                      child: Text(
                                        'credit / debit card',
                                        style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Center(
                                  child: Container(
                                    height: 51,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(6)),
                                        color: AppColors.ancientColor),
                                    child: Center(
                                      child: Text(
                                        'Pay with PayPal',
                                        style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ])))
      ]),
    );
  }
}

class Text_Sub extends StatelessWidget {
  String text;
  Text_Sub({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 5,
          backgroundColor: AppColors.ancientColor,
        ),
        SizedBox(
          width: 7,
        ),
        Text(
          text,
          style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 14,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
