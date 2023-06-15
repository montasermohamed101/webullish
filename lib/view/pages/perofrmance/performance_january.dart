// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:webullish/api/class/handling_data_view.dart';
import 'package:webullish/controller/performance/webullish_performance_controller.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/container_performance.dart';

class PerformanceJanuary extends StatelessWidget {
  const PerformanceJanuary({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WebullishPerformanceController>(
      init: WebullishPerformanceController(),
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Padding(
            padding: const EdgeInsets.only(top: 63),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 41, right: 41),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.whiteColor,
                      ),
                      Text(
                        'Performance January',
                        style: TextStyle(
                            color: AppColors.ancientColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 23,
                ),
                Expanded(
                    child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView(children: [
                          Container(
                            height: 60,
                            width: double.infinity,
                            color: const Color(0xff2A2936),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Symbol',
                                      style: TextStyle(
                                          color: AppColors.ancientColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'P&L Reached',
                                      style: TextStyle(
                                          color: AppColors.ancientColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'P&L Target',
                                      style: TextStyle(
                                          color: AppColors.ancientColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Comments',
                                      style: TextStyle(
                                          color: AppColors.ancientColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                           SizedBox(
                            height: 600.0,
                            child:  ListView.builder(
                              itemCount: controller.performance['performances'].length,
                              itemBuilder: (context, index) => 
                               RowWidget(
                                sympol: controller.performance['performances'][index]['sympol'].toString(),
                                reached: "${controller.performance['performances'][index]['reached']}",
                                target: "${controller.performance['performances'][index]['target']}",
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 27, right: 27),
                            child: Text(
                              'Our success this month!',
                              style: TextStyle(
                                  color: AppColors.ancientColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 27,
                          ),
                          IntrinsicHeight(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 62,
                                          width: 62,
                                          child: Stack(children: [
                                            Image.asset(
                                                'assets/images/background.png'),
                                            Center(
                                                child: Image.asset(
                                                    'assets/images/shet.png'))
                                          ]),
                                        ),
                                        const SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          'Success %',
                                          style: TextStyle(
                                              color: AppColors.whiteColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '75 %',
                                          style: TextStyle(
                                              color: AppColors.greenColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    const VerticalDivider(
                                      color: Colors.white,
                                      thickness: 3,
                                      // indent: 20,
                                      // endIndent: 0,
                                      width: 20,
                                    ),
                                    const SizedBox(
                                      width: 94,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 62,
                                          width: 62,
                                          child: Stack(children: [
                                            Image.asset(
                                                'assets/images/backgroundred.png'),
                                            Center(
                                                child: Image.asset(
                                                    'assets/images/fail.png'))
                                          ]),
                                        ),
                                        const SizedBox(
                                          height: 11,
                                        ),
                                        Text(
                                          'Fail %',
                                          style: TextStyle(
                                              color: AppColors.whiteColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '25 %',
                                          style: TextStyle(
                                              color: AppColors.redColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 41,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '75%',
                                      style: TextStyle(
                                          color: AppColors.greenColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Successful Predictions%',
                                      style: TextStyle(
                                          color: AppColors.ancientColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Center(
                                  child: Stack(
                                    children: [
                                      Image.asset('assets/images/bar.png'),
                                      Image.asset('assets/images/bar-1.png')
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 58,
                                ),
                                Image.asset('assets/images/Vector 10.png'),
                                Image.asset('assets/images/Vector 11.png'),
                              ],
                            ),
                          )
                        ])))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({
    super.key,
    required this.sympol,
    required this.reached,
    required this.target,
  });
  final String sympol;
  final String reached;
  final String target;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container_Performance(
            colortext: AppColors.ancientColor,
            text: sympol,
            color: AppColors.backPerformanceColor,
          ),
          Container_Performance(
            colortext: AppColors.ancientColor,
            text: reached,
            color: AppColors.backPerformanceColor,
          ),
          Container_Performance(
            colortext: AppColors.whiteColor,
            text: target,
            color: AppColors.redColor,
          ),
          Container_Performance(
            colortext: AppColors.ancientColor,
            text: '4 Days',
            color: AppColors.backPerformanceColor,
          ),
        ],
      ),
    );
  }
}
