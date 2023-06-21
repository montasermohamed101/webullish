import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../controller/alert_controller/swing_alert_controller.dart';
import '../../../model/alert_model/swing_alerts.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/dino_data.dart';
import 'detailbage.dart';

class ItemList extends StatelessWidget {
 // final DinoData dinoData;
 // final SwingAlertsModel swingAlertsModel;

   ItemList({super.key,});
   SwingAlertController controller = Get.put(SwingAlertController());


   @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      height: 150,
      // child: GestureDetector(
      //   onTap: (() {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => DetailPage(
      //
      //         dinoData: dinoData,
      //
      //
      //         ),
      //       ),
      //     );
      //   }),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       Flexible(
      //         flex: 3,
      //         child: Image(
      //           // image: AssetImage(dinoData.dinoImage!),
      //           image:AssetImage(controller.swingAlertsModel!.notifications![index].image!),
      //         ),
      //       ),
      //       Expanded(
      //         flex: 7,
      //         child: Container(
      //           margin:
      //               const EdgeInsets.only(bottom: 4, right: 4, left: 4, top: 4),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             children: [
      //               Container(
      //                 child: Text(
      //                   controller.swingAlertsModel!.notifications[index].name!,
      //                  // dinoData.name!,
      //                   overflow: TextOverflow.ellipsis,
      //                   maxLines: 1,
      //                   style: TextStyle(
      //                     fontWeight: FontWeight.bold,
      //                     fontSize: 16,
      //                     color: AppColors.whiteColor,
      //                   ),
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 7,
      //               ),
      //               Expanded(
      //                 child: Text(
      //                   dinoData.description!,
      //                   overflow: TextOverflow.visible,
      //                   maxLines: 1,
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.w400,
      //                       fontSize: 12,
      //                       color: AppColors.grayColor),
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
