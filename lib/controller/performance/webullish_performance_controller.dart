// ignore_for_file: avoid_print, unused_import, depend_on_referenced_packages

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:webullish/api/class/status_request.dart';
import 'package:webullish/api/data/dataResoures/remote/test_data.dart';
import 'package:webullish/api/functions/check_internet.dart';
import 'package:webullish/api/functions/handling_data_controller.dart';



class WebullishPerformanceController extends GetxController {
  TestData testData = TestData(Get.find());

   late StatusRequest statusRequest;

   Map<String,dynamic> performance ={};
  // Performance? performance;
  

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getPerformanceData();
     print('========================respose');
      print(response);
    
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print('=============== check if condetion ===============');
      performance.addAll(response);
         update();

      print('========================performance');
      print(performance);
    }
 
  }

  @override
  void onInit() {
    checkInternet();
    getData();
    update();
    super.onInit();
  }
}