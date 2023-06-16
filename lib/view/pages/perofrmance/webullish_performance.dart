// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webullish/api/class/handling_data_view.dart';
import 'package:webullish/controller/performance/webullish_performance_controller.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/container_month.dart';

class Webullish_Performance extends StatelessWidget {
  const Webullish_Performance({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WebullishPerformanceController>(
      init: WebullishPerformanceController(),
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 45, right: 45),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 63,bottom: 30.0),
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
                    Text(
                      'Monthly Performance',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.ancientColor),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      'We have made it easier than ever to\naccess our many invaluable reports!\ncheck them all out here, broken down into monthly categories.',
                      style: TextStyle(fontSize: 17, color: AppColors.whiteColor),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      height:650.0,
                      child:controller.performance['performances'].length == null? const CircularProgressIndicator(): ListView.builder(
                      itemCount: controller.performance['performances'].length,
                      itemBuilder: (context, index) => Container_Month(
                        color: AppColors.ancientColor,
                        text: controller.performance['performances'][index]['month'],
                        textt: 'Performance ${controller.performance['performances'][index]['month']}',
                        texttt:
                            'Here you will find all of our\n  analyzes for this month',
                      ),
                    ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
