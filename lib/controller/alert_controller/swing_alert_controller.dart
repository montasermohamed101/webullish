import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/alert_model/swing_alerts.dart';


class SwingAlertController extends GetxController{
  @override
  void onInit() {
    getData();
  }

  SwingAlertsModel? swingAlertsModel;

  getData() async{
   http.Response response = await http.get(Uri.parse("http://webullish.space/api/notification"));
   Map<String,dynamic> data = jsonDecode(response.body);
   swingAlertsModel = SwingAlertsModel.fromJson(data);
   print(swingAlertsModel!.notifications![0].image);
   update();
  }
}