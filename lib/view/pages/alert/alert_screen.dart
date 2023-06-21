// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:webullish/view/pages/alert/detailbage.dart';

import '../../../controller/alert_controller/swing_alert_controller.dart';
import 'alert_item_list.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/dino_data.dart';
import '../../widgets/my_text.dart';


class AlertScreen extends StatelessWidget {
  SwingAlertController controller = Get.put(SwingAlertController());

  // AlertScreen({Key? key, this.userame}) : super(key: key);
  //
  // String? userame;

  @override
  Widget build(BuildContext context) {
   // final ScrollController scrollController = ScrollController();
    SwingAlertController controller = Get.put(SwingAlertController());


    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: MyText(text:'Swing Alerts',color: AppColors.ancientColor,
          fontWeight: FontWeight.bold,
          size: 22,
        ),
        centerTitle: true,
        // leading: IconButton(
        //   icon: Image.asset('assets/images/back_arrow.png'),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child:GetBuilder<SwingAlertController>(
                init: SwingAlertController(),
                builder: (controller)=>

                controller.swingAlertsModel != null?
                 ListView.builder(
                 //controller: scrollController,
                  itemExtent: 100,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  itemCount: controller.swingAlertsModel!.notifications!.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      height: 150,
                      child: GestureDetector(
                        onTap: (() {
                          Get.to(DetailPage());

                        }),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Image.network(
                                // image: AssetImage(dinoData.dinoImage!),
                                  controller.swingAlertsModel!.notifications![index].image
                                      == null ?
                                      "https://cdn.hswstatic.com/gif/why-is-sky-blue.jpg"
                                      : controller.swingAlertsModel!.notifications![index].image!
                              )
                            ),
                            Expanded(
                              flex: 7,
                              child: Container(
                                margin:
                                const EdgeInsets.only(bottom: 4, right: 4, left: 4, top: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        controller.swingAlertsModel!.notifications![index].name!,
                                        // dinoData.name!,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Expanded(
                                      child: Text(
                                        controller.swingAlertsModel!.notifications![index].description!,

                                       // dinoData.description!,
                                        overflow: TextOverflow.visible,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: AppColors.grayColor),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ):Center(child: CircularProgressIndicator()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
