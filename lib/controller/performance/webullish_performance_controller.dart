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
   List<dynamic> performances=[];
  // Performance? performance;
  //=====
String? percentage ;
int? value ;
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getPerformanceData();
     print('========================respose');
      print(response);
    
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print('=============== check if condetion ===============');
      performance.addAll(response);
      performances = [performance.addAll(response)].toList();
      print(performances);

         update();

      print('========================performance');
      print(performance);
    }
 
  }
  userGetData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getPerformanceData();
    print('========================respose');
    print(response);


    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print('=============== check if condetion ===============');
      performance.addAll(response);
      performances = [performance.addAll(response)].toList();
      print(performances);
//       String percentage = performance['performance'][0]['target'];
// int value = int.parse(percentage.replaceAll('%', ''));
//   print(value);
      update();

      print('========================performance');
      print(performance);
    }

  }

  String? month;
  String? target;
  String? reached;
  String? sympol;
  String? comment;
  int countFail = 0;
  int countSuccess = 0;
  double rateFail = 0;
  int rateFailInt = 0;
  double rateSuccess = 0;
  int rateSuccessInt = 0;
  // getRateFail(){
  //   rateFail = (countFail+countSuccess)/countFail ;
  // }
  // getRateSuccess(){
  //   rateFail = ((countFail+countSuccess)/countSuccess) ;
  // }
  


  @override
  void onInit() {
    checkInternet();
    // getRateFail();
    // getRateSuccess();
    getData();
    update();
    super.onInit();
  }
}
