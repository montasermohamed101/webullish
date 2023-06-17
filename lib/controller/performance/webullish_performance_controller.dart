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

  Map<String, dynamic> performance = {};

  //=====
  String? percentage;
  int? value;
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
  late double douSuc = rateSuccess;
  late double? douFail = rateFail;

  upDataCounter(int index) {
    month = performance['performances'][index]['month'];
    target = performance['performances'][index]['target'];
    reached = performance['performances'][index]['reached'];
    comment = performance['performances'][index]['comment'];
    sympol = performance['performances'][index]['sympol'];
    if (int.parse("$target".replaceAll('%', '')) <= 9) {
      countFail++;
      rateFail = ((countFail + countSuccess) / countFail) * 100;
      rateFailInt = rateFail.toInt();
    } else {
      countSuccess++;
      rateSuccess = ((countFail + countSuccess) / countSuccess) * 100;
      rateSuccessInt = rateSuccess.toInt();
    }
    update();
  }

  @override
  void onInit() {
    checkInternet();

    getData();
    update();
    super.onInit();
  }
}
